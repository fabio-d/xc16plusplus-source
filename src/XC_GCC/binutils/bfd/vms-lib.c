/* BFD back-end for VMS archive files.

   Copyright 2010 Free Software Foundation, Inc.
   Written by Tristan Gingold <gingold@adacore.com>, AdaCore.

   This file is part of BFD, the Binary File Descriptor library.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
   MA 02110-1301, USA.  */

#include "sysdep.h"
#include "bfd.h"
#include "libbfd.h"
#include "safe-ctype.h"
#include "bfdver.h"
#include "vms.h"
#include "vms/lbr.h"
#include "vms/dcx.h"

/* The standard VMS disk block size.  */
#ifndef VMS_BLOCK_SIZE
#define VMS_BLOCK_SIZE 512
#endif

/* Maximum key length (which is also the maximum symbol length in archive).  */
#define MAX_KEYLEN 129

/* DCX Submaps.  */

struct dcxsbm_desc
{
  unsigned char min_char;
  unsigned char max_char;
  unsigned char *flags;
  unsigned char *nodes;
  unsigned short *next;
};

/* Kind of library.  Used to filter in archive_p.  */

enum vms_lib_kind
  {
    vms_lib_vax,
    vms_lib_alpha,
    vms_lib_ia64,
    vms_lib_txt
  };

/* Back-end private data.  */

struct lib_tdata
{
  /* Major version.  */
  unsigned char ver;

  /* Type of the archive.  */
  unsigned char type;

  /* Kind of archive.  Summary of its type.  */
  enum vms_lib_kind kind;

  /* Total size of the mhd (element header).  */
  unsigned int mhd_size;

  /* Vector of modules (archive elements), already sorted.  */
  unsigned int nbr_modules;
  struct carsym *modules;
  bfd **cache;

  /* Vector of symbols (archive map), already sorted.  */
  unsigned int nbr_syms;
  struct carsym *syms;

  /* DCX (decompression) data.  */
  unsigned int nbr_dcxsbm;
  struct dcxsbm_desc *dcxsbm;
};

#define bfd_libdata(bfd) ((struct lib_tdata *)((bfd)->tdata.any))

/* End-Of-Text pattern.  This is a special record to mark the end of file.  */

static const unsigned char eotdesc[] = { 0x03, 0x00, 0x77, 0x00, 0x77, 0x00 };

/* Read index block VBN and put the entry in **IDX (which is updated).
   If the entry is indirect, recurse.  */

static bfd_boolean
vms_traverse_index (bfd *abfd, unsigned int vbn, struct carsym **idx)
{
  struct vms_indexdef indexdef;
  unsigned int used;
  file_ptr off;
  unsigned int i;

  /* Read the index block.  */
  off = (vbn - 1) * VMS_BLOCK_SIZE;
  if (bfd_seek (abfd, off, SEEK_SET) != 0
      || bfd_bread (&indexdef, sizeof (indexdef), abfd) != sizeof (indexdef))
    return FALSE;

  /* Traverse it.  */
  used = bfd_getl16 (indexdef.used);
  for (i = 0; i < used;)
    {
      unsigned int idx_vbn;
      unsigned int idx_off;
      unsigned int keylen;
      unsigned char *keyname;
      unsigned char *ridx = (unsigned char *)&indexdef.keys[i];
      unsigned int len;

      idx_vbn = bfd_getl32 (ridx);
      idx_off = bfd_getl16 (ridx + 4);

      /* Illegal value.  */
      if (idx_vbn == 0)
        return FALSE;

      /* Extract key length.  */
      if (bfd_libdata (abfd)->ver == 3)
        {
          keylen = ridx[6];
          len = 7;
        }
      else if (bfd_libdata (abfd)->ver == 4)
        {
          keylen = bfd_getl16 (ridx + 6);
          len = 9;
        }
      else
        return FALSE;

      keyname = ridx + len;
      i += len + keylen;

      if (idx_off == RFADEF__C_INDEX)
        {
          /* Indirect entry.  Recurse.  */
          if (!vms_traverse_index (abfd, idx_vbn, idx))
            return FALSE;
        }
      else
        {
          /* Add a new entry.  */
          char *name;

          name = bfd_alloc (abfd, keylen + 1);
          if (name == NULL)
            return FALSE;
          memcpy (name, keyname, keylen);
          name[keylen] = 0;
          (*idx)->file_offset = (idx_vbn - 1) * VMS_BLOCK_SIZE + idx_off;
          (*idx)->name = name;
          (*idx)++;
        }
    }

  return TRUE;
}

/* Read index #IDX, which must have NBREL entries.  */

static struct carsym *
vms_lib_read_index (bfd *abfd, int idx, unsigned int nbrel)
{
  struct carsym *res;
  struct carsym *el;
  struct vms_idd idd;
  unsigned int flags;
  unsigned int vbn;

  /* Read index desription.  */
  if (bfd_seek (abfd, LHD_IDXDESC + idx * IDD_LENGTH, SEEK_SET) != 0
      || bfd_bread (&idd, sizeof (idd), abfd) != sizeof (idd))
    return NULL;

  /* Sanity checks.  */
  flags = bfd_getl16 (idd.flags);
  if (!(flags & IDD__FLAGS_ASCII)
      || !(flags & IDD__FLAGS_VARLENIDX))
    return NULL;

  res = bfd_alloc (abfd, nbrel * sizeof (struct carsym));
  if (res == NULL)
    return NULL;

  el = res;

  /* Note: if the index is empty, there is no block to traverse.  */
  vbn = bfd_getl32 (idd.vbn);
  if (vbn != 0 && !vms_traverse_index (abfd, vbn, &el))
    {
      bfd_release (abfd, res);
      return NULL;
    }

  if ((unsigned int)(el - res) != nbrel)
    {
      /* Inconsistency between the number of modules declared and the number
         of modules found in the index.  */
      bfd_release (abfd, res);
      return NULL;
    }
  return res;
}

/* Standard function.  */

static const bfd_target *
_bfd_vms_lib_archive_p (bfd *abfd, enum vms_lib_kind kind)
{
  struct vms_lhd lhd;
  unsigned int sanity;
  struct lib_tdata *tdata_hold;
  struct lib_tdata *tdata;
  unsigned int dcxvbn;

  /* Read header.  */
  if (bfd_bread (&lhd, sizeof (lhd), abfd) != sizeof (lhd))
    {
      if (bfd_get_error () != bfd_error_system_call)
	bfd_set_error (bfd_error_wrong_format);
      return NULL;
    }

  /* Check sanity (= magic) number.  */
  sanity = bfd_getl32 (lhd.sanity);
  if (!(sanity == LHD_SANEID3
        || sanity == LHD_SANEID4
        || sanity == LHD_SANEID_DCX))
    {
      bfd_set_error (bfd_error_wrong_format);
      return NULL;
    }

  /* Check archive kind.  */
  switch (kind)
    {
    case vms_lib_alpha:
      if ((lhd.type != LBR__C_TYP_EOBJ && lhd.type != LBR__C_TYP_ESHSTB)
          || bfd_getl32 (lhd.majorid) != 3
          || lhd.nindex != 2)
        {
          bfd_set_error (bfd_error_wrong_format);
          return NULL;
        }
      break;
    case vms_lib_txt:
      if ((lhd.type != LBR__C_TYP_TXT
           && lhd.type != LBR__C_TYP_MLB
           && lhd.type != LBR__C_TYP_HLP)
          || bfd_getl32 (lhd.majorid) != 3
          || lhd.nindex != 1)
        {
          bfd_set_error (bfd_error_wrong_format);
          return NULL;
        }
      break;
    default:
      abort ();
    }

  /* Allocate and initialize private data.  */
  tdata_hold = bfd_libdata (abfd);
  tdata = (struct lib_tdata *) bfd_zalloc (abfd, sizeof (struct lib_tdata));
  if (tdata == NULL)
    return NULL;
  abfd->tdata.any = (void *)tdata;
  tdata->ver = bfd_getl32 (lhd.majorid);
  tdata->mhd_size = MHD__C_USRDAT + lhd.mhdusz;
  tdata->type = lhd.type;
  tdata->kind = kind;

  /* Read indexes.  */
  tdata->nbr_modules = bfd_getl32 (lhd.modcnt);
  tdata->nbr_syms = bfd_getl32 (lhd.idxcnt) - tdata->nbr_modules;
  tdata->modules = vms_lib_read_index (abfd, 0, tdata->nbr_modules);
  if (tdata->modules == NULL)
    goto err;
  if (lhd.nindex == 2)
    {
      tdata->syms = vms_lib_read_index (abfd, 1, tdata->nbr_syms);
      if (tdata->syms == NULL)
        goto err;
    }
  tdata->cache = bfd_zalloc (abfd, sizeof (bfd *) * tdata->nbr_modules);
  if (tdata->cache == NULL)
    goto err;

  /* Read DCX submaps.  */
  dcxvbn = bfd_getl32 (lhd.dcxmapvbn);
  if (dcxvbn != 0)
    {
      unsigned char buf_reclen[4];
      unsigned int reclen;
      unsigned char *buf;
      struct vms_dcxmap *map;
      unsigned int sbm_off;
      unsigned int i;

      if (bfd_seek (abfd, (dcxvbn - 1) * VMS_BLOCK_SIZE, SEEK_SET) != 0
          || bfd_bread (buf_reclen, sizeof (buf_reclen), abfd)
          != sizeof (buf_reclen))
        goto err;
      reclen = bfd_getl32 (buf_reclen);
      buf = bfd_malloc (reclen);
      if (buf == NULL)
        goto err;
      if (bfd_bread (buf, reclen, abfd) != reclen)
        {
          free (buf);
          goto err;
        }
      map = (struct vms_dcxmap *)buf;
      tdata->nbr_dcxsbm = bfd_getl16 (map->nsubs);
      sbm_off = bfd_getl16 (map->sub0);
      tdata->dcxsbm = (struct dcxsbm_desc *)bfd_alloc
        (abfd, tdata->nbr_dcxsbm * sizeof (struct dcxsbm_desc));
      for (i = 0; i < tdata->nbr_dcxsbm; i++)
        {
          struct vms_dcxsbm *sbm = (struct vms_dcxsbm *) (buf + sbm_off);
          struct dcxsbm_desc *sbmdesc = &tdata->dcxsbm[i];
          unsigned int sbm_len;
          unsigned int sbm_sz;
          unsigned char *data = (unsigned char *)sbm;
          unsigned char *buf1;
          unsigned int l, j;

          sbm_sz = bfd_getl16 (sbm->size);
          sbm_off += sbm_sz;
          BFD_ASSERT (sbm_off <= reclen);

          sbmdesc->min_char = sbm->min_char;
          BFD_ASSERT (sbmdesc->min_char == 0);
          sbmdesc->max_char = sbm->max_char;
          sbm_len = sbmdesc->max_char - sbmdesc->min_char + 1;
          l = (2 * sbm_len + 7) / 8;
          BFD_ASSERT (sbm_sz >= sizeof (struct vms_dcxsbm) + l + 3 * sbm_len);
          sbmdesc->flags = (unsigned char *)bfd_alloc (abfd, l);
          memcpy (sbmdesc->flags, data + bfd_getl16 (sbm->flags), l);
          sbmdesc->nodes = (unsigned char *)bfd_alloc (abfd, 2 * sbm_len);
          memcpy (sbmdesc->nodes, data + bfd_getl16 (sbm->nodes), 2 * sbm_len);
          sbmdesc->next = (unsigned short *)bfd_alloc
            (abfd, sbm_len * sizeof (unsigned short));
          buf1 = data + bfd_getl16 (sbm->next);
          for (j = 0; j < sbm_len; j++)
            sbmdesc->next[j] = bfd_getl16 (buf1 + j * 2);
        }
      free (buf);
    }
  else
    {
      tdata->nbr_dcxsbm = 0;
    }

  /* The map is always present.  Also mark shared image library.  */
  abfd->has_armap = TRUE;
  if (tdata->type == LBR__C_TYP_ESHSTB)
    abfd->is_thin_archive = TRUE;

  return abfd->xvec;

 err:
  bfd_release (abfd, tdata);
  abfd->tdata.any = (void *)tdata_hold;;
  return NULL;
}

/* Standard function for alpha libraries.  */

const bfd_target *
_bfd_vms_lib_alpha_archive_p (bfd *abfd)
{
  return _bfd_vms_lib_archive_p (abfd, vms_lib_alpha);
}

/* Standard function for text libraries.  */

static const bfd_target *
_bfd_vms_lib_txt_archive_p (bfd *abfd)
{
  return _bfd_vms_lib_archive_p (abfd, vms_lib_txt);
}

/* Standard bfd function.  */

bfd_boolean
_bfd_vms_lib_mkarchive (bfd *abfd)
{
  struct lib_tdata *tdata;

  tdata = (struct lib_tdata *) bfd_zalloc (abfd, sizeof (struct lib_tdata));
  if (tdata == NULL)
    return FALSE;

  abfd->tdata.any = (void *)tdata;
  tdata->ver = 3;
  tdata->mhd_size = sizeof (struct vms_mhd);
  tdata->type = LBR__C_TYP_EOBJ;

  tdata->nbr_modules = 0;
  tdata->nbr_syms = 0;
  tdata->modules = NULL;
  tdata->syms = NULL;
  tdata->cache = NULL;

  return TRUE;
}

/* Find NAME in the symbol index.  Return the index.  */

symindex
_bfd_vms_lib_find_symbol (bfd *abfd, const char *name)
{
  struct lib_tdata *tdata = bfd_libdata (abfd);
  int lo, hi;

  /* Open-coded binary search for speed.  */
  lo = 0;
  hi = tdata->nbr_syms - 1;

  while (lo <= hi)
    {
      int mid = lo + (hi - lo) / 2;
      int diff;

      diff = (char)(name[0] - tdata->syms[mid].name[0]);
      if (diff == 0)
        diff = strcmp (name, tdata->syms[mid].name);
      if (diff == 0)
        return tdata->syms[mid].file_offset;
      else if (diff < 0)
        hi = mid - 1;
      else
        lo = mid + 1;
    }
  return 0;
}

/* IO vector for archive member.  Need that because members are not linearly
   stored in archives.  */

struct vms_lib_iovec
{
  /* Current offset.  */
  ufile_ptr where;

  /* Length of the module, when known.  */
  ufile_ptr file_len;

  /* Current position in the record from bfd_bread point of view (ie, after
     decompression).  0 means that no data byte have been read, -2 and -1
     are reserved for the length word.  */
  int rec_pos;
#define REC_POS_NL   -4
#define REC_POS_PAD  -3
#define REC_POS_LEN0 -2
#define REC_POS_LEN1 -1

  /* Record length.  */
  unsigned short rec_len;
  /* Number of bytes to read in the current record.  */
  unsigned short rec_rem;
  /* Offset of the next block.  */
  file_ptr next_block;
  /* Current *data* offset in the data block.  */
  unsigned short blk_off;

  /* Offset of the first block.  Extracted from the index.  */
  file_ptr first_block;

  /* Initial next_block.  Extracted when the MHD is read.  */
  file_ptr init_next_block;
  /* Initial blk_off, once the MHD is read.  */
  unsigned short init_blk_off;

  /* Used to store any 3 byte record, which could be the EOF pattern.  */
  unsigned char pattern[4];

  /* DCX.  */
  struct dcxsbm_desc *dcxsbms;
  /* Current submap.  */
  struct dcxsbm_desc *dcx_sbm;
  /* Current offset in the submap.  */
  unsigned int dcx_offset;
  int dcx_pos;

  /* Compressed buffer.  */
  unsigned char *dcx_buf;
  /* Size of the buffer.  Used to resize.  */
  unsigned int dcx_max;
  /* Number of valid bytes in the buffer.  */
  unsigned int dcx_rlen;
};

/* Return the current position.  */

static file_ptr
vms_lib_btell (struct bfd *abfd)
{
  struct vms_lib_iovec *vec = (struct vms_lib_iovec *) abfd->iostream;
  return vec->where;
}

/* Read the header of the next data block if all bytes of the current block
   have been read.  */

static bfd_boolean
vms_lib_read_block (struct bfd *abfd)
{
  struct vms_lib_iovec *vec = (struct vms_lib_iovec *) abfd->iostream;

  if (vec->blk_off == DATA__LENGTH)
    {
      unsigned char hdr[DATA__DATA];

      /* Read next block.  */
      if (bfd_seek (abfd->my_archive, vec->next_block, SEEK_SET) != 0)
        return FALSE;
      if (bfd_bread (hdr, sizeof (hdr), abfd->my_archive) != sizeof (hdr))
        return FALSE;
      vec->next_block = (bfd_getl32 (hdr + 2) - 1) * VMS_BLOCK_SIZE;
      vec->blk_off = sizeof (hdr);
    }
  return TRUE;
}

/* Read NBYTES from ABFD into BUF if not NULL.  If BUF is NULL, bytes are
   not stored.  Read linearly from the library, but handle blocks.  This
   function does not handle records nor EOF.  */

static file_ptr
vms_lib_bread_raw (struct bfd *abfd, unsigned char *buf, file_ptr nbytes)
{
  struct vms_lib_iovec *vec = (struct vms_lib_iovec *) abfd->iostream;
  file_ptr res;

  res = 0;
  while (nbytes > 0)
    {
      unsigned int l;

      /* Be sure the current data block is read.  */
      if (!vms_lib_read_block (abfd))
        return -1;

      /* Do not read past the data block, do not read more than requested.  */
      l = DATA__LENGTH - vec->blk_off;
      if (l > nbytes)
        l = nbytes;
      if (l == 0)
        return 0;
      if (buf != NULL)
        {
          /* Really read into BUF.  */
          if (bfd_bread (buf, l, abfd->my_archive) != l)
            return -1;
        }
      else
        {
          /* Make as if we are reading.  */
          if (bfd_seek (abfd->my_archive, l, SEEK_CUR) != 0)
            return -1;
        }

      if (buf != NULL)
        buf += l;
      vec->blk_off += l;
      nbytes -= l;
      res += l;
    }
  return res;
}

/* Decompress NBYTES from VEC.  Store the bytes into BUF if not NULL.  */

static file_ptr
vms_lib_dcx (struct vms_lib_iovec *vec, unsigned char *buf, file_ptr nbytes)
{
  struct dcxsbm_desc *sbm;
  unsigned int i;
  unsigned int offset;
  unsigned int j;
  file_ptr res = 0;

  /* The loop below expect to deliver at least one byte.  */
  if (nbytes == 0)
    return 0;

  /* Get the current state.  */
  sbm = vec->dcx_sbm;
  offset = vec->dcx_offset;
  j = vec->dcx_pos & 7;

  for (i = vec->dcx_pos >> 3; i < vec->dcx_rlen; i++)
    {
      unsigned char b = vec->dcx_buf[i];

      for (; j < 8; j++)
        {
          if (b & (1 << j))
            offset++;
          if (!(sbm->flags[offset >> 3] & (1 << (offset & 7))))
            {
              unsigned int n_offset = sbm->nodes[offset];
              if (n_offset == 0)
                {
                  /* End of buffer.  Stay where we are.  */
                  vec->dcx_pos = (i << 3) + j;
                  if (b & (1 << j))
                    offset--;
                  vec->dcx_offset = offset;
                  vec->dcx_sbm = sbm;
                  return res;
                }
              offset = 2 * n_offset;
            }
          else
            {
              unsigned char v = sbm->nodes[offset];

              sbm = vec->dcxsbms + sbm->next[v];
              offset = 0;
              res++;

              if (buf)
                {
                  *buf++ = v;
                  nbytes--;

                  if (nbytes == 0)
                    {
                      vec->dcx_pos = (i << 3) + j + 1;
                      vec->dcx_offset = offset;
                      vec->dcx_sbm = sbm;

                      return res;
                    }
                }
            }
        }
      j = 0;
    }
  return -1;
}

/* Standard IOVEC function.  */

static file_ptr
vms_lib_bread (struct bfd *abfd, void *buf, file_ptr nbytes)
{
  struct vms_lib_iovec *vec = (struct vms_lib_iovec *) abfd->iostream;
  file_ptr res;
  file_ptr chunk;

  /* Do not read past the end.  */
  if (vec->where >= vec->file_len)
    return 0;

  res = 0;
  while (nbytes > 0)
    {
      if (vec->rec_rem == 0)
        {
          unsigned char blen[2];

          /* Read record length.  */
          if (vms_lib_bread_raw (abfd, blen, sizeof (blen)) != sizeof (blen))
            return -1;
          vec->rec_len = bfd_getl16 (blen);
          if (bfd_libdata (abfd->my_archive)->kind == vms_lib_txt)
            {
              /* Discard record size and align byte.  */
              vec->rec_pos = 0;
              vec->rec_rem = vec->rec_len;
            }
          else
            {
              /* Prepend record size.  */
              vec->rec_pos = REC_POS_LEN0;
              vec->rec_rem = (vec->rec_len + 1) & ~1;	/* With align byte.  */
            }
          if (vec->rec_len == 3)
            {
              /* Possibly end of file.  Check the pattern.  */
              if (vms_lib_bread_raw (abfd, vec->pattern, 4) != 4)
                return -1;
              if (!memcmp (vec->pattern, eotdesc + 2, 3))
                {
                  /* This is really an EOF.  */
                  vec->where += res;
                  vec->file_len = vec->where;
                  return res;
                }
            }

          if (vec->dcxsbms != NULL)
            {
              /* This is a compressed member.  */
              unsigned int len;
              file_ptr elen;

              /* Be sure there is enough room for the expansion.  */
              len = (vec->rec_len + 1) & ~1;
              if (len > vec->dcx_max)
                {
                  while (len > vec->dcx_max)
                    vec->dcx_max *= 2;
                  vec->dcx_buf = bfd_alloc (abfd, vec->dcx_max);
                  if (vec->dcx_buf == NULL)
                    return -1;
                }

              /* Read the compressed record.  */
              vec->dcx_rlen = len;
              if (vec->rec_len == 3)
                {
                  /* Already read.  */
                  memcpy (vec->dcx_buf, vec->pattern, 3);
                }
              else
                {
                  elen = vms_lib_bread_raw (abfd, vec->dcx_buf, len);
                  if (elen != len)
                    return -1;
                }

              /* Dummy expansion to get the expanded length.  */
              vec->dcx_offset = 0;
              vec->dcx_sbm = vec->dcxsbms;
              vec->dcx_pos = 0;
              elen = vms_lib_dcx (vec, NULL, 0x10000);
              if (elen < 0)
                return -1;
              vec->rec_len = elen;
              vec->rec_rem = elen;

              /* Reset the state.  */
              vec->dcx_offset = 0;
              vec->dcx_sbm = vec->dcxsbms;
              vec->dcx_pos = 0;
            }
        }
      if (vec->rec_pos < 0)
        {
          unsigned char c;
          switch (vec->rec_pos)
            {
            case REC_POS_LEN0:
              c = vec->rec_len & 0xff;
              vec->rec_pos = REC_POS_LEN1;
              break;
            case REC_POS_LEN1:
              c = (vec->rec_len >> 8) & 0xff;
              vec->rec_pos = 0;
              break;
            case REC_POS_PAD:
              c = 0;
              vec->rec_rem = 0;
              break;
            case REC_POS_NL:
              c = '\n';
              vec->rec_rem = 0;
              break;
            default:
              abort ();
            }
          if (buf != NULL)
            {
              *(unsigned char *)buf = c;
              buf++;
            }
          nbytes--;
          res++;
          continue;
        }

      if (nbytes > vec->rec_rem)
        chunk = vec->rec_rem;
      else
        chunk = nbytes;

      if (vec->dcxsbms != NULL)
        {
          /* Optimize the stat() case: no need to decompress again as we
             know the length.  */
          if (!(buf == NULL && chunk == vec->rec_rem))
            chunk = vms_lib_dcx (vec, buf, chunk);
        }
      else
        {
          if (vec->rec_len == 3)
            {
              if (buf != NULL)
                memcpy (buf, vec->pattern + vec->rec_pos, chunk);
            }
          else
            chunk = vms_lib_bread_raw (abfd, buf, chunk);
        }
      if (chunk < 0)
        return -1;
      res += chunk;
      if (buf != NULL)
        buf += chunk;
      nbytes -= chunk;
      vec->rec_pos += chunk;
      vec->rec_rem -= chunk;

      if (vec->rec_rem == 0)
        {
          /* End of record reached.  */
          if (bfd_libdata (abfd->my_archive)->kind == vms_lib_txt)
            {
              if ((vec->rec_len & 1) == 1
                  && vec->rec_len != 3
                  && vec->dcxsbms == NULL)
                {
                  /* Eat the pad byte.  */
                  unsigned char pad;
                  if (vms_lib_bread_raw (abfd, &pad, 1) != 1)
                    return -1;
                }
              vec->rec_pos = REC_POS_NL;
              vec->rec_rem = 1;
            }
          else
            {
              if ((vec->rec_len & 1) == 1 && vec->dcxsbms != NULL)
                {
                  vec->rec_pos = REC_POS_PAD;
                  vec->rec_rem = 1;
                }
            }
        }
    }
  vec->where += res;
  return res;
}

/* Standard function, but we currently only handle the rewind case.  */

static int
vms_lib_bseek (struct bfd *abfd, file_ptr offset, int whence)
{
  struct vms_lib_iovec *vec = (struct vms_lib_iovec *) abfd->iostream;

  if (whence == SEEK_SET && offset == 0)
    {
      vec->where = 0;
      vec->rec_rem = 0;
      vec->dcx_pos = -1;
      vec->blk_off = vec->init_blk_off;
      vec->next_block = vec->init_next_block;

      if (bfd_seek (abfd->my_archive, vec->first_block, SEEK_SET) != 0)
        return -1;
    }
  else
    abort ();
  return 0;
}

static file_ptr
vms_lib_bwrite (struct bfd *abfd ATTRIBUTE_UNUSED,
	      const void *where ATTRIBUTE_UNUSED,
	      file_ptr nbytes ATTRIBUTE_UNUSED)
{
  return -1;
}

static int
vms_lib_bclose (struct bfd *abfd)
{
  abfd->iostream = NULL;
  return 0;
}

static int
vms_lib_bflush (struct bfd *abfd ATTRIBUTE_UNUSED)
{
  return 0;
}

static int
vms_lib_bstat (struct bfd *abfd ATTRIBUTE_UNUSED,
               struct stat *sb ATTRIBUTE_UNUSED)
{
  /* Not supported.  */
  return 0;
}

static void *
vms_lib_bmmap (struct bfd *abfd ATTRIBUTE_UNUSED,
	      void *addr ATTRIBUTE_UNUSED,
	      bfd_size_type len ATTRIBUTE_UNUSED,
	      int prot ATTRIBUTE_UNUSED,
	      int flags ATTRIBUTE_UNUSED,
	      file_ptr offset ATTRIBUTE_UNUSED)
{
  return (void *) -1;
}

static const struct bfd_iovec vms_lib_iovec = {
  &vms_lib_bread, &vms_lib_bwrite, &vms_lib_btell, &vms_lib_bseek,
  &vms_lib_bclose, &vms_lib_bflush, &vms_lib_bstat, &vms_lib_bmmap
};

/* Open a library module.  FILEPOS is the position of the module header.  */

static bfd_boolean
vms_lib_bopen (bfd *el, file_ptr filepos)
{
  struct vms_lib_iovec *vec;
  unsigned char buf[256];
  struct vms_mhd *mhd;
  struct lib_tdata *tdata = bfd_libdata (el->my_archive);
  unsigned int len;

  /* Allocate and initialized the iovec.  */
  vec = bfd_zalloc (el, sizeof (*vec));
  if (vec == NULL)
    return FALSE;

  el->iostream = vec;
  el->iovec = &vms_lib_iovec;

  /* File length is not known.  */
  vec->file_len = -1;

  /* Read the first data block.  */
  vec->next_block = filepos & ~(VMS_BLOCK_SIZE - 1);
  vec->blk_off = DATA__LENGTH;
  if (!vms_lib_read_block (el))
    return FALSE;

  /* Prepare to read the first record.  */
  vec->blk_off = filepos & (VMS_BLOCK_SIZE - 1);
  vec->rec_rem = 0;
  if (bfd_seek (el->my_archive, filepos, SEEK_SET) != 0)
    return FALSE;

  /* Read Record length + MHD + align byte.  */
  len = tdata->mhd_size;
  if (vms_lib_bread_raw (el, buf, 2) != 2)
    return -1;
  if (bfd_getl16 (buf) != len)
    return -1;
  len = (len + 1) & ~1;
  BFD_ASSERT (len <= sizeof (buf));
  if (vms_lib_bread_raw (el, buf, len) != len)
    return -1;

  /* Get info from mhd.  */
  mhd = (struct vms_mhd *)buf;
  if (len >= sizeof (struct vms_mhd))
    el->selective_search = (mhd->objstat & MHD__M_SELSRC) ? 1 : 0;
  el->mtime = vms_rawtime_to_time_t (mhd->datim);
  el->mtime_set = TRUE;

  /* Reinit the iovec so that seek() will point to the first record after
     the mhd.  */
  vec->where = 0;
  vec->init_blk_off = vec->blk_off;
  vec->init_next_block = vec->next_block;
  vec->first_block = bfd_tell (el->my_archive);
  vec->dcxsbms = bfd_libdata (el->my_archive)->dcxsbm;

  if (vec->dcxsbms != NULL)
    {
      /* Handle DCX.  */
      vec->dcx_max = 10 * 1024;
      vec->dcx_buf = bfd_alloc (el, vec->dcx_max);
      vec->dcx_pos = -1;
      if (vec->dcx_buf == NULL)
        return -1;
    }
  return TRUE;
}

/* Standard function: get member at IDX.  */

bfd *
_bfd_vms_lib_get_elt_at_index (bfd *abfd, symindex idx)
{
  struct lib_tdata *tdata = bfd_libdata (abfd);
  bfd *res;
  unsigned int i;

  /* Linear-scan.  */
  for (i = 0; i < tdata->nbr_modules; i++)
    {
      if (tdata->modules[i].file_offset == (file_ptr)idx)
        break;
    }

  /* Invalid index.  */
  if (i >= tdata->nbr_modules)
    return NULL;

  /* Already loaded.  */
  if (tdata->cache[i])
    return tdata->cache[i];

  /* Build it.  */
  res = _bfd_create_empty_archive_element_shell (abfd);
  if (!vms_lib_bopen (res, idx))
    return NULL;
  res->filename = tdata->modules[i].name;

  tdata->cache[i] = res;

  return res;
}

/* Elements of an imagelib are stubs.  You can get the real image with this
   function.  */

bfd *
_bfd_vms_lib_get_imagelib_file (bfd *el)
{
  bfd *archive = el->my_archive;
  const char *modname = el->filename;
  int modlen = strlen (modname);
  char *filename;
  int j;
  bfd *res;

  /* Convert module name to lower case and append '.exe'.  */
  filename = bfd_alloc (el, modlen + 5);
  if (filename == NULL)
    return NULL;
  for (j = 0; j < modlen; j++)
    if (ISALPHA (modname[j]))
      filename[j] = TOLOWER (modname[j]);
    else
      filename[j] = modname[j];
  memcpy (filename + modlen, ".exe", 5);

  filename = _bfd_append_relative_path (archive, filename);
  if (filename == NULL)
    return NULL;
  res = bfd_openr (filename, NULL);

  if (res == NULL)
    {
      (*_bfd_error_handler)(_("could not open shared image '%s' from '%s'"),
                            filename, archive->filename);
      bfd_release (archive, filename);
      return NULL;
    }

  /* FIXME: put it in a cache ?  */
  return res;
}

/* Standard function.  */

bfd *
_bfd_vms_lib_openr_next_archived_file (bfd *archive,
                                       bfd *last_file)
{
  unsigned int idx;
  bfd *res;

  if (!last_file)
    idx = 0;
  else
    idx = last_file->proxy_origin + 1;

  if (idx >= bfd_libdata (archive)->nbr_modules)
    {
      bfd_set_error (bfd_error_no_more_archived_files);
      return NULL;
    }

  res = _bfd_vms_lib_get_elt_at_index
    (archive, bfd_libdata (archive)->modules[idx].file_offset);
  if (res == NULL)
    return res;
  res->proxy_origin = idx;
  return res;
}

/* Standard function.  Just compute the length.  */

int
_bfd_vms_lib_generic_stat_arch_elt (bfd *abfd, struct stat *st)
{
  struct vms_lib_iovec *vec = (struct vms_lib_iovec *) abfd->iostream;

  if (abfd->my_archive == NULL)
    {
      bfd_set_error (bfd_error_invalid_operation);
      return -1;
    }

  if (vec->file_len == (ufile_ptr)-1)
    {
      if (vms_lib_bseek (abfd, 0, SEEK_SET) != 0)
        return -1;

      /* Compute length.  */
      while (vms_lib_bread (abfd, NULL, 1 << 20) > 0)
        ;
    }

  st->st_size = vec->file_len;
  if (abfd->mtime_set)
    st->st_mtime = abfd->mtime;
  else
    st->st_mtime = 0;
  st->st_uid = 0;
  st->st_gid = 0;
  st->st_mode = 0644;

  return 0;
}

/* Internal representation of an index entry.  */

struct vms_index
{
  /* Corresponding archive member.  */
  bfd *abfd;

  /* Number of reference to this entry.  */
  unsigned int ref;

  /* Length of the key.  */
  unsigned short namlen;

  /* Key.  */
  const char *name;
};

/* Used to sort index entries.  */

static int
vms_index_cmp (const void *lv, const void *rv)
{
  const struct vms_index *l = lv;
  const struct vms_index *r = rv;

  return strcmp (l->name, r->name);
}

/* Maximum number of index blocks level.  */

#define MAX_LEVEL 10

/* Get the size of an index entry.  */

static unsigned int
get_idxlen (struct vms_index *idx)
{
  return 7 + idx->namlen;
}

/* Write the index.  VBN is the first vbn to be used, and will contain
   on return the last vbn.
   Return TRUE on success.  */

static bfd_boolean
vms_write_index (bfd *abfd,
                 struct vms_index *idx, unsigned int nbr, unsigned int *vbn,
                 unsigned int *topvbn)
{
  unsigned int i;
  int j;
  int level;
  struct vms_indexdef *rblk[MAX_LEVEL];
  struct idxblk
  {
    unsigned int vbn;
    unsigned short len;
    unsigned short lastlen;
  } blk[MAX_LEVEL];

  if (nbr == 0)
    {
      if (topvbn != NULL)
        *topvbn = 0;
      return TRUE;
    }

  if (abfd == NULL)
    {
      /* Sort the index the first time this function is called.  */
      qsort (idx, nbr, sizeof (struct vms_index), vms_index_cmp);
    }

  /* Allocate first index block.  */
  level = 1;
  if (abfd != NULL)
    rblk[0] = bfd_malloc (sizeof (struct vms_indexdef));
  blk[0].vbn = (*vbn)++;
  blk[0].len = 0;
  blk[0].lastlen = 0;

  for (i = 0; i < nbr; i++, idx++)
    {
      unsigned int idxlen = get_idxlen (idx);
      struct vms_idxdef *en;
      int flush = 0;

      /* Check if a block might overflow.  In this case we will flush this
         block and all the blocks below it.  */
      for (j = 0; j < level; j++)
        if (blk[j].len + blk[j].lastlen + idxlen > INDEXDEF__BLKSIZ)
          flush = j + 1;

      for (j = 0; j < level; j++)
        {
          if (j < flush)
            {
              /* There is not enough room to write the new entry in this
                 block or in a parent block.  */

              if (j + 1 == level)
                {
                  BFD_ASSERT (level < MAX_LEVEL);

                  /* Need to create a parent.  */
                  if (abfd != NULL)
                    {
                      rblk[level] = bfd_malloc (sizeof (struct vms_indexdef));
                      bfd_putl32 (*vbn, rblk[j]->parent);
                    }
                  blk[level].vbn = (*vbn)++;
                  blk[level].len = 0;
                  blk[level].lastlen = 0;

                  level++;
                }

              /* Update parent block: write the new entry.  */
              if (abfd != NULL)
                {
                  en = (struct vms_idxdef *)(rblk[j]->keys + blk[j].len);
                  memcpy (rblk[j + 1]->keys + blk[j + 1].len, en,
                          blk[j].lastlen);
                  en = (struct vms_idxdef *)
                    (rblk[j + 1]->keys + blk[j + 1].len);
                  bfd_putl32 (blk[j].vbn, en->vbn);
                  bfd_putl16 (RFADEF__C_INDEX, en->offset);
                }

              if (j + 1 == flush)
                {
                  /* And allocate it.  Do it only on the block that won't be
                     flushed (so that the parent of the parent can be
                     updated too).  */
                  blk[j + 1].len += blk[j].lastlen;
                  blk[j + 1].lastlen = 0;
                }

              /* Write this block on the disk.  */
              if (abfd != NULL)
                {
                  bfd_putl16 (blk[j].len + blk[j].lastlen, rblk[j]->used);
                  if (bfd_seek (abfd, (blk[j].vbn - 1) * VMS_BLOCK_SIZE,
                                SEEK_SET) != 0)
                    return FALSE;
                  if (bfd_bwrite (rblk[j], sizeof (struct vms_indexdef), abfd)
                      != sizeof (struct vms_indexdef))
                    return FALSE;
                }

              /* Reset this block.  */
              blk[j].len = 0;
              blk[j].lastlen = 0;
              blk[j].vbn = (*vbn)++;
            }

          /* Append it to the block.  */
          if (j == 0)
            {
              blk[j].len += blk[j].lastlen;

              if (abfd != NULL)
                {
                  en = (struct vms_idxdef *)(rblk[j]->keys + blk[j].len);
                  bfd_putl32 ((idx->abfd->proxy_origin / VMS_BLOCK_SIZE) + 1,
                              en->vbn);
                  bfd_putl16
                    ((idx->abfd->proxy_origin % VMS_BLOCK_SIZE) + DATA__DATA,
                     en->offset);
                  en->keylen = idx->namlen;
                  memcpy (en->keyname, idx->name, idx->namlen);
                }
            }

          blk[j].lastlen = idxlen;
        }
    }

  if (topvbn != NULL)
    *topvbn = blk[level - 1].vbn;

  if (abfd == NULL)
    return TRUE;

  /* Flush.  */
  for (j = 0; j < level; j++)
    {
      if (j > 0)
        {
          /* Update parent block: write the new entry.  */
          struct vms_idxdef *en;
          struct vms_idxdef *par;

          en = (struct vms_idxdef *)(rblk[j - 1]->keys + blk[j - 1].len);
          par = (struct vms_idxdef *)(rblk[j]->keys + blk[j].len);
          memcpy (par, en, blk[j - 1].lastlen);
          bfd_putl32 (blk[j - 1].vbn, par->vbn);
          bfd_putl16 (RFADEF__C_INDEX, par->offset);
        }

      /* Write this block on the disk.  */
      bfd_putl16 (blk[j].len + blk[j].lastlen, rblk[j]->used);
      if (bfd_seek (abfd, (blk[j].vbn - 1) * VMS_BLOCK_SIZE,
                    SEEK_SET) != 0)
        return FALSE;
      if (bfd_bwrite (rblk[j], sizeof (struct vms_indexdef), abfd)
          != sizeof (struct vms_indexdef))
        return FALSE;

      free (rblk[j]);
    }

  return TRUE;
}

/* Append data to the data block DATA.  Force write if PAD is true.  */

static bfd_boolean
vms_write_data_block (bfd *arch, struct vms_datadef *data, file_ptr *off,
                      const unsigned char *buf, unsigned int len, int pad)
{
  while (len > 0 || pad)
    {
      unsigned int doff = *off & (VMS_BLOCK_SIZE - 1);
      unsigned int remlen = (DATA__LENGTH - DATA__DATA) - doff;
      unsigned int l;

      l = (len > remlen) ? remlen : len;
      memcpy (data->data + doff, buf, l);
      buf += l;
      len -= l;
      doff += l;
      *off += l;

      if (doff == (DATA__LENGTH - DATA__DATA) || (len == 0 && pad))
        {
          data->recs = 0;
          data->fill_1 = 0;
          bfd_putl32 ((*off / VMS_BLOCK_SIZE) + 2, data->link);

          if (bfd_bwrite (data, sizeof (*data), arch) != sizeof (*data))
            return FALSE;

          *off += DATA__LENGTH - doff;

          if (len == 0)
            break;
        }
    }
  return TRUE;
}

/* Build the symbols index.  */

static bfd_boolean
_bfd_vms_lib_build_map (unsigned int nbr_modules,
                        struct vms_index *modules,
                        unsigned int *res_cnt,
                        struct vms_index **res)
{
  unsigned int i;
  asymbol **syms = NULL;
  long syms_max = 0;
  struct vms_index *map = NULL;
  unsigned int map_max = 1024;		/* Fine initial default.  */
  unsigned int map_count = 0;

  map = (struct vms_index *) bfd_malloc (map_max * sizeof (struct vms_index));
  if (map == NULL)
    goto error_return;

  /* Gather symbols.  */
  for (i = 0; i < nbr_modules; i++)
    {
      long storage;
      long symcount;
      long src_count;
      bfd *current = modules[i].abfd;

      if ((bfd_get_file_flags (current) & HAS_SYMS) == 0)
        continue;

      storage = bfd_get_symtab_upper_bound (current);
      if (storage < 0)
        goto error_return;

      if (storage != 0)
        {
          if (storage > syms_max)
            {
              if (syms_max > 0)
                free (syms);
              syms_max = storage;
              syms = (asymbol **) bfd_malloc (syms_max);
              if (syms == NULL)
                goto error_return;
            }
          symcount = bfd_canonicalize_symtab (current, syms);
          if (symcount < 0)
            goto error_return;

          /* Now map over all the symbols, picking out the ones we
             want.  */
          for (src_count = 0; src_count < symcount; src_count++)
            {
              flagword flags = (syms[src_count])->flags;
              asection *sec = syms[src_count]->section;

              if ((flags & BSF_GLOBAL
                   || flags & BSF_WEAK
                   || flags & BSF_INDIRECT
                   || bfd_is_com_section (sec))
                  && ! bfd_is_und_section (sec))
                {
                  struct vms_index *new_map;

                  /* This symbol will go into the archive header.  */
                  if (map_count == map_max)
                    {
                      map_max *= 2;
                      new_map = (struct vms_index *)
                        bfd_realloc (map, map_max * sizeof (struct vms_index));
                      if (new_map == NULL)
                        goto error_return;
                      map = new_map;
                    }

                  map[map_count].abfd = current;
                  /* FIXME: check length.  */
                  map[map_count].namlen = strlen (syms[src_count]->name);
                  map[map_count].name = syms[src_count]->name;
                  map_count++;
                  modules[i].ref++;
                }
            }
	}
    }

  *res_cnt = map_count;
  *res = map;
  return TRUE;

 error_return:
  if (syms_max > 0)
    free (syms);
  if (map != NULL)
    free (map);
  return FALSE;
}

/* Do the hard work: write an archive on the disk.  */

bfd_boolean
_bfd_vms_lib_write_archive_contents (bfd *arch)
{
  bfd *current;
  unsigned int nbr_modules;
  struct vms_index *modules;
  unsigned int nbr_symbols;
  struct vms_index *symbols;
  struct lib_tdata *tdata = bfd_libdata (arch);
  unsigned int i;
  file_ptr off;
  unsigned int nbr_mod_iblk;
  unsigned int nbr_sym_iblk;
  unsigned int vbn;
  unsigned int mod_idx_vbn;
  unsigned int sym_idx_vbn;

  /* Count the number of modules (and do a first sanity check).  */
  nbr_modules = 0;
  for (current = arch->archive_head;
       current != NULL;
       current = current->archive_next)
    {
      /* This check is checking the bfds for the objects we're reading
	 from (which are usually either an object file or archive on
	 disk), not the archive entries we're writing to.  We don't
	 actually create bfds for the archive members, we just copy
	 them byte-wise when we write out the archive.  */
      if (bfd_write_p (current) || !bfd_check_format (current, bfd_object))
	{
	  bfd_set_error (bfd_error_invalid_operation);
	  goto input_err;
	}

      nbr_modules++;
    }

  /* Build the modules list.  */
  BFD_ASSERT (tdata->modules == NULL);
  modules = bfd_alloc (arch, nbr_modules * sizeof (struct vms_index));
  if (modules == NULL)
    return FALSE;

  for (current = arch->archive_head, i = 0;
       current != NULL;
       current = current->archive_next, i++)
    {
      int nl;

      modules[i].abfd = current;
      modules[i].name = vms_get_module_name (current->filename, FALSE);
      modules[i].ref = 1;

      /* FIXME: silently truncate long names ?  */
      nl = strlen (modules[i].name);
      modules[i].namlen = (nl > MAX_KEYLEN ? MAX_KEYLEN : nl);
    }

  /* Create the module index.  */
  vbn = 0;
  if (!vms_write_index (NULL, modules, nbr_modules, &vbn, NULL))
    return FALSE;
  nbr_mod_iblk = vbn;

  /* Create symbol index.  */
  if (!_bfd_vms_lib_build_map (nbr_modules, modules, &nbr_symbols, &symbols))
    return FALSE;

  vbn = 0;
  if (!vms_write_index (NULL, symbols, nbr_symbols, &vbn, NULL))
    return FALSE;
  nbr_sym_iblk = vbn;

  /* Write modules and remember their position.  */
  off = (1 + nbr_mod_iblk + nbr_sym_iblk) * VMS_BLOCK_SIZE;

  if (bfd_seek (arch, off, SEEK_SET) != 0)
    return FALSE;

  for (i = 0; i < nbr_modules; i++)
    {
      struct vms_datadef data;
      unsigned char blk[VMS_BLOCK_SIZE];
      struct vms_mhd *mhd;
      unsigned int sz;

      current = modules[i].abfd;
      current->proxy_origin = off;

      bfd_putl16 (sizeof (struct vms_mhd), blk);
      mhd = (struct vms_mhd *)(blk + 2);
      memset (mhd, 0, sizeof (struct vms_mhd));
      mhd->lbrflag = 0;
      mhd->id = MHD__C_MHDID;
      mhd->objidlng = 4;
      memcpy (mhd->objid, "V1.0", 4);
      bfd_putl32 (modules[i].ref, mhd->refcnt);
      /* FIXME: datim.  */

      sz = (2 + sizeof (struct vms_mhd) + 1) & ~1;
      if (vms_write_data_block (arch, &data, &off, blk, sz, 0) < 0)
        goto input_err;

      if (bfd_seek (current, 0, SEEK_SET) != 0)
        goto input_err;

      while (1)
	{
          sz = bfd_bread (blk, sizeof (blk), current);
          if (sz == 0)
            break;
          if (vms_write_data_block (arch, &data, &off, blk, sz, 0) < 0)
            goto input_err;
        }
      if (vms_write_data_block (arch, &data, &off,
                                eotdesc, sizeof (eotdesc), 1) < 0)
        goto input_err;
    }

  /* Write the indexes.  */
  vbn = 2;
  if (vms_write_index (arch, modules, nbr_modules, &vbn, &mod_idx_vbn) != TRUE)
    return FALSE;
  if (vms_write_index (arch, symbols, nbr_symbols, &vbn, &sym_idx_vbn) != TRUE)
    return FALSE;

  /* Write libary header.  */
  {
    unsigned char blk[VMS_BLOCK_SIZE];
    struct vms_lhd *lhd = (struct vms_lhd *)blk;
    struct vms_idd *idd = (struct vms_idd *)(blk + sizeof (*lhd));
    unsigned int idd_flags;

    memset (blk, 0, sizeof (blk));

    lhd->type = LBR__C_TYP_EOBJ;
    lhd->nindex = 2;
    bfd_putl32 (LHD_SANEID3, lhd->sanity);
    bfd_putl16 (3, lhd->majorid);
    bfd_putl16 (0, lhd->minorid);
    snprintf ((char *)lhd->lbrver + 1, sizeof (lhd->lbrver) - 1,
              "GNU ar %u.%u.%u",
              (unsigned)(BFD_VERSION / 100000000UL),
              (unsigned)(BFD_VERSION / 1000000UL) % 100,
              (unsigned)(BFD_VERSION / 10000UL) % 100);
    lhd->lbrver[sizeof (lhd->lbrver) - 1] = 0;
    lhd->lbrver[0] = strlen ((char *)lhd->lbrver + 1);

    /* FIXME.  */
    bfd_putl64 (0, lhd->credat);
    bfd_putl64 (0, lhd->updtim);

    lhd->mhdusz = sizeof (struct vms_mhd) - MHD__C_USRDAT;

    bfd_putl32 (nbr_modules + nbr_symbols, lhd->idxcnt);
    bfd_putl32 (nbr_modules, lhd->modcnt);
    bfd_putl32 (nbr_modules, lhd->modhdrs);

    bfd_putl32 (vbn - 1, lhd->hipreal);
    bfd_putl32 (vbn - 1, lhd->hiprusd);

    /* First index (modules name).  */
    idd_flags = IDD__FLAGS_ASCII | IDD__FLAGS_VARLENIDX
      | IDD__FLAGS_NOCASECMP | IDD__FLAGS_NOCASENTR;
    bfd_putl16 (idd_flags, idd->flags);
    bfd_putl16 (MAX_KEYLEN, idd->keylen);
    bfd_putl16 (mod_idx_vbn, idd->vbn);
    idd++;

    /* Second index (symbols name).  */
    bfd_putl16 (idd_flags, idd->flags);
    bfd_putl16 (MAX_KEYLEN, idd->keylen);
    bfd_putl16 (sym_idx_vbn, idd->vbn);
    idd++;

    if (bfd_seek (arch, 0, SEEK_SET) != 0)
      return FALSE;
    if (bfd_bwrite (blk, sizeof (blk), arch) != sizeof (blk))
      return FALSE;
  }

  return TRUE;

 input_err:
  bfd_set_error (bfd_error_on_input, current, bfd_get_error ());
  return FALSE;
}

/* Add a target for text library.  This costs almost nothing and is useful to
   read VMS library on the host.  */

const bfd_target vms_lib_txt_vec =
{
  "vms-libtxt",			/* Name.  */
  bfd_target_unknown_flavour,
  BFD_ENDIAN_UNKNOWN,		/* byteorder */
  BFD_ENDIAN_UNKNOWN,		/* header_byteorder */
  0,				/* Object flags.  */
  0,				/* Sect flags.  */
  0,				/* symbol_leading_char.  */
  ' ',				/* ar_pad_char.  */
  15,				/* ar_max_namelen.  */
  bfd_getl64, bfd_getl_signed_64, bfd_putl64,
  bfd_getl32, bfd_getl_signed_32, bfd_putl32,
  bfd_getl16, bfd_getl_signed_16, bfd_putl16,
  bfd_getl64, bfd_getl_signed_64, bfd_putl64,
  bfd_getl32, bfd_getl_signed_32, bfd_putl32,
  bfd_getl16, bfd_getl_signed_16, bfd_putl16,

  {_bfd_dummy_target, _bfd_dummy_target,	/* bfd_check_format.  */
   _bfd_vms_lib_txt_archive_p, _bfd_dummy_target},
  {bfd_false, bfd_false, bfd_false, bfd_false},	/* bfd_set_format.  */
  {bfd_false, bfd_false, bfd_false, bfd_false},	/* bfd_write_contents.  */

  BFD_JUMP_TABLE_GENERIC (_bfd_generic),
  BFD_JUMP_TABLE_COPY (_bfd_generic),
  BFD_JUMP_TABLE_CORE (_bfd_nocore),
  BFD_JUMP_TABLE_ARCHIVE (_bfd_vms_lib),
  BFD_JUMP_TABLE_SYMBOLS (_bfd_nosymbols),
  BFD_JUMP_TABLE_RELOCS (_bfd_norelocs),
  BFD_JUMP_TABLE_WRITE (_bfd_nowrite),
  BFD_JUMP_TABLE_LINK (_bfd_nolink),
  BFD_JUMP_TABLE_DYNAMIC (_bfd_nodynamic),

  NULL,

  (PTR) 0
};
