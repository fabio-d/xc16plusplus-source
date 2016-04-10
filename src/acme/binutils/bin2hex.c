/* bin2hex - convert an executable object file to HEX format
   using the bfd library. */

#include "bfd.h"
#include <getopt.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
/* malloc.h should be stdlib.h for POSIX compliance */
#include <stdlib.h>
#include "bucomm.h"

#define error -1
#define success 0
#define EEDATA_BASE_ADDR 0x7ff000

static int verbose = 0;

struct pic30_section
{
  struct pic30_section *next;
  unsigned int attributes; /* unused */
  PTR *file;
  asection *sec;
};

/* prototypes */
int main (int argc, char ** argv);
void write_extended_address_record(file_ptr base_address, PTR fp);
void write_section(bfd *abfd, asection *sect, PTR fp);
int write_hex_file(char *name, bfd *abfd);
int dump_symbols(bfd *abfd);
void print_symbol(asymbol *sym);

/* needed for sorting */
void init_section_list (struct pic30_section **);
void build_section_list (bfd *, asection *, PTR);
void write_section_list (bfd *, PTR, struct pic30_section *);
void write_section_image_list (bfd *, PTR, struct pic30_section *);
void free_section_list (struct pic30_section **);

/* The BFD object file format.  */
static char *target = NULL;

static bfd_size_type actual_prog_used;

const char *version = VERSION;

static long long int offset_address_by = 0;
static int sort_by_address = 0;
static int upper_case = 0;
static struct pic30_section *outputs;
static char *subordinate_image = 0;

#define MAX_ROW 16384
static long subordinate_image_row = 0;

char *program_name;

void help(char **argv);
void help(char **argv) {
  printf("\n  %s -- convert an object file to Intel hex format\n", argv[0]);
  printf ("  %s", strstr (version, "- ") + 2);
  printf("\n  usage: %s file [options]\n\n", argv[0]);
  printf("  options:\n");
  printf("    -a          sort sections by address\n");
  printf("    --image f   write a loadable subordinate image to f.s\n");
  printf("    --row   n   write n instructions per block in image\n");
  printf("    -u          use upper-case hex digits\n");
  printf("    -v          print verbose messages\n");
  printf("\n");
  printf("    --offset n  offset hex file addresses offset by n\n");
  printf("\n");
}

int
main (argc, argv)
     int argc;
     char **argv;
{
  bfd *abfd;
  char *file = 0;
  char * dot;
  char * hex_file;
  int arg,c;

  if (argc == 1)  {
    help(argv);
    return success;
  }

  program_name = argv[0];

  opterr = 0;

  for (arg = 1; arg < argc; arg++) {
    if (argv[arg][0] == '-') {
      // an option
      c = argv[arg][1];
      switch (c) {
        case '-':
          // extended option
          if (strcmp(argv[arg],"--offset") == 0) {
            offset_address_by = strtoll(argv[arg+1],0,0);
            arg++;
          } else if (strcmp(argv[arg],"--image") == 0) {
            subordinate_image = strdup(argv[arg+1]);
            arg++;
          } else if (strcmp(argv[arg],"--row") == 0) {
            subordinate_image_row = strtol(argv[arg+1],0,0);
            if ((subordinate_image_row <= 0) || 
                (subordinate_image_row > MAX_ROW)) {
               fprintf(stderr,"illegal row size: min %d, max %d\n", 1, MAX_ROW);
               help(argv);
               return 1;
            }
            arg++;
          } else {
            fprintf(stderr,"Unknown option `%s'.\n", argv[arg]);
            help(argv);
            return 1;
          }
          break;
        case 'a':
          sort_by_address = 1;
          break;
        case 'u':
          upper_case = 1;
          break;
        case 'v':
          verbose++;
          break;
        default:
          if (isprint (optopt))
            fprintf (stderr, "Unknown option `-%c'.\n", optopt);
          else
            fprintf (stderr,
                     "Unknown option character `\\x%x'.\n",
                     optopt);
          help(argv);
          return 1;
      }
    } else {
      if (file == 0) {
        /* allow the file anywhere, but... only one.
           users should not notice */
        file = argv[arg];
      } else {
        fprintf(stderr,"Stray option \"%s\"?\n", argv[arg]);
        help(argv);
        return 1;
      }
    }
  }

  if (subordinate_image) {
    int valid_name = 1;
    char *c;

    if (((*subordinate_image < 'A') && (*subordinate_image > 'Z')) &&
        ((*subordinate_image < 'a') && (*subordinate_image > 'z')) &&
        (*subordinate_image != '_')) {
      valid_name = 0;
    }
    for (c = subordinate_image+1; *c; c++) {
      if (((*subordinate_image < 'A') && (*subordinate_image > 'Z')) &&
          ((*subordinate_image < 'a') && (*subordinate_image > 'z')) &&
          ((*subordinate_image < '0') && (*subordinate_image > '9')) &&
          (*subordinate_image != '_')) {
        valid_name = 0;
      }
    }
    if (valid_name == 0) {
      fprintf(stderr,"--image name '%s' must be a valid C identifier\n", 
              subordinate_image);
      subordinate_image = 0;
    }
  }

  bfd_init ();

  abfd = bfd_openr (file, target);

  if (abfd == NULL)
    {
      fprintf(stderr, "  %s: %s could not be opened.\n", program_name, file);
      return error;
    }

  if (bfd_check_format (abfd, bfd_object) == FALSE)
    {
      bfd_close (abfd);
      fprintf(stderr, "  %s: %s is not a valid object file.\n", program_name, 
              file);
      return error;
    }

  if (verbose) {
    printf("\n");
    printf("Offsetting addresses by 0x%16.16llx\n", offset_address_by);
  }

  if (subordinate_image) {
     /* write a subordinate image along with hex file */
     write_image_file(subordinate_image, abfd);
  }

  /* strip extension from filename if present */
  dot = strrchr(file, '.');
  if (dot)
    dot[0] = '\0';

  /* create a new name with .hex extension */
  hex_file = malloc( strlen(file) + strlen(".hex") + 1);
  sprintf( hex_file, "%s%s", file, ".hex");

  if (!write_hex_file(hex_file,abfd)) { /* write it */
    free(hex_file);
    return error;
  }

  if (verbose)
    printf("\n");

  bfd_close (abfd);
  free(hex_file);
  return success;

}

int
write_hex_file(char *name, bfd *abfd) {
  FILE *fp;
  int rc = 1;

  fp = fopen(name, "w");
  if (!fp) {
    printf("Error: could not open file %s for writing!\n", name);
    return 0;
  }
  
  if (verbose) {
    printf("writing %s\n\n", name);
    printf("section   PC address   byte address   length (w/pad)   actual length  (dec)\n");
    printf("-------   ----------   ------------   --------------   --------------------\n");
  }

  actual_prog_used = 0;

  /* write each section */
  if (sort_by_address) {
    init_section_list(&outputs);
    bfd_map_over_sections(abfd, &build_section_list, outputs);
    write_section_list (abfd, fp, outputs);
    free_section_list(&outputs);
  } else
    bfd_map_over_sections(abfd, &write_section, fp);

  /* write the end of file marker */
  fprintf(fp, ":00000001FF\n");
  fclose(fp);

  /* write summary info */
  if (verbose)
    printf(upper_case ? "\nTotal program memory used (bytes): %#33lX  (%ld)\n" :
                        "\nTotal program memory used (bytes): %#33lx  (%ld)\n",
           actual_prog_used, actual_prog_used);

  return rc;
}


int
write_image_file(char *name, bfd *abfd) {
  FILE *fp;
  int rc = 1;
  char *filename;
  time_t current_time;

  time(&current_time);

  filename = xmalloc(strlen(name)+2);
  if (filename == 0) {
    printf("Error: could not create file\n");
    return 0;
  }
  sprintf(filename,"%s.h", name);
  fp = fopen(filename, "w");
  if (!fp) {
    printf("Error: could not open file %s for writing!\n", filename);
    return 0;
  }
  fprintf(fp,"/* %s.h - interface for image */\n", name);
  fprintf(fp,"/* Generated: %s */",ctime(&current_time));
  fprintf(fp,"\n");
  fprintf(fp,"extern __psv__ char * %s[];\n", name);
  fclose(fp);

  sprintf(filename,"%s.s", name);

  fp = fopen(filename, "w");
  if (!fp) {
    printf("Error: could not open file %s for writing!\n", filename);
    return 0;
  }

  fprintf(fp,";\n");
  fprintf(fp,"; %s generated on %s\n", name, ctime(&current_time));
  fprintf(fp,";\n");
  fprintf(fp,"\t.section %s_image,code,page\n",name);
  fprintf(fp,"\t.global _%s\n",name);
  fprintf(fp,"_%s:\n\n",name);
  
  /* write each section */
  if (1) {
    init_section_list(&outputs);
    bfd_map_over_sections(abfd, &build_section_list, outputs);
    write_section_image_list (abfd, fp, outputs);
    free_section_list(&outputs);
  }
 
  /* write terminator */
  /*  only the first word is read */
  fprintf(fp,"       ; terminator\n");
  fprintf(fp,"       .word 0x0000\n");
  fprintf(fp,";      .word 0x0000\n");
  fprintf(fp,";      .word 0x0000\n");

  fclose(fp);

  return 1;
}


void
init_section_list(lst)
     struct pic30_section **lst;
{
  *lst = ((struct pic30_section *)
         xmalloc(sizeof(struct pic30_section)));
  (*lst)->next = 0;
  (*lst)->sec = 0;
  (*lst)->attributes = 0;
  (*lst)->file = 0;
}


/*
** Build a list of output sections
**  sorted by address.
**
** - called via bfd_map_over_sections()
*/
void
build_section_list (abfd, sect, p)
     bfd *abfd ATTRIBUTE_UNUSED ;
     asection *sect;
     PTR p ;
{
  struct pic30_section *new, *s, *prev;
  int done = 0;

  /* create a new element */
  new = ((struct pic30_section *) 
         xmalloc(sizeof(struct pic30_section)));
  new->sec  = sect;

  prev = (struct pic30_section *) p;
  for (s = prev; s != NULL; s = s->next)
    {
      /* insert it at the correct spot */
      if (s->sec && (new->sec->lma < s->sec->lma))
        {
          prev->next = new;
          new->next = s;
          done++;
          break;
        }
      prev = s;
    }

  /* if still not placed, add it to the end */
  if (!done)
    {
      prev->next = new;
      new->next = NULL;
    }
} /* static void pic30_build_section_list (...) */


void
write_section_list (bfd *abfd, PTR fp, struct pic30_section *p)
{
  struct pic30_section *s;

  for (s = p; s != NULL; s = s->next) {
      if (s->sec)
        write_section(abfd, s->sec, fp);
    }
}

void
write_section_image_list (bfd *abfd, PTR fp, struct pic30_section *p)
{
  struct pic30_section *s;

  for (s = p; s != NULL; s = s->next) {
      if (s->sec)
        write_section_image(abfd, s->sec, fp);
    }
}


void
free_section_list(lst)
     struct pic30_section **lst;
{
  struct pic30_section *s, *next;

  if (!(*lst))
    return;

  for (s = *lst; s != NULL; s = next) {
      next = s->next;
      free(s);
    }
  *lst = NULL;
}


void
write_section(bfd *abfd, asection *sect, PTR fp) {

  const bfd_size_type row_size=0x10;

  FILE *hexfile;
  unsigned char dat[row_size];
  unsigned char *p;
  file_ptr  PCstart, start, offset;
  file_ptr  upper_addr, base_addr;  /* for Extended Linear Address Records */
  bfd_size_type total, actual;
  unsigned int   num_rows,last_row,i,j,sum;
  unsigned short low_addr;

  base_addr = 0;
  hexfile = fp;
  p = &dat[0];
  offset = 0;
  total = 0;

  /* if section is load-able and has contents */
  if ((sect->flags & SEC_LOAD) && (sect->flags & SEC_HAS_CONTENTS)
#if 0
      &&
      (bfd_family_coff(abfd) || ((sect->flags & SEC_CODE) == SEC_CODE))
#endif
     )
  {

    /* print section header */
    PCstart = sect->lma;
    if (PCstart < 0x800000)
      start = (PCstart + offset_address_by) << 1;
    else
      start = PCstart << 1;
#if 0
    /* offset un-shifted address instead; this makes it easier to get the
       right offset */
    start += offset_address_by;
#endif
    total = sect->_raw_size;
    actual = total * .75;

    /* report correct size of EEDATA sections */
    if (PCstart >= EEDATA_BASE_ADDR)
      actual = total / 2;

    /* clear flags so that bfd_get_section_contents does not attempt to
         reformat the data */
    sect->psv = 0;
    sect->flags &= ~SEC_READONLY;
    sect->auxpsv = 0;
    sect->eedata = 0;

    if (verbose)
      printf(upper_case ? "%-10s%#10lX%#15lX%#17lX%#16lX  (%ld)\n" :
                          "%-10s%#10lx%#15lx%#17lx%#16lx  (%ld)\n",
             sect->name, PCstart, start, total, actual, actual);

    actual_prog_used += (total * .75);  /* actual program memory used */
    num_rows = total / row_size;
    last_row = total % row_size;

    /* start with extended address = 0 */
    write_extended_address_record(0,fp);

    /* write the full records */
    for (i=0; i<num_rows; i++) {
      sum = 0;
      low_addr = (unsigned short) (start+offset);
      upper_addr = (start+offset) - low_addr;
      if (upper_addr > base_addr) { /* if address overflows */
        base_addr = upper_addr;
        write_extended_address_record(base_addr,fp);
      }

      bfd_get_section_contents(abfd, sect, p, offset, row_size);
      fprintf(hexfile,              /* begin record */
              upper_case ? ":10%4.4X00" :":10%4.4x00", low_addr);
      sum -= (0x10 + (low_addr>>8) + (low_addr&0xFF));
      offset += row_size;
      for (j=0; j<row_size; j++) {  /* fill in data */
        fprintf(hexfile, upper_case ? "%2.2X" : "%2.2x", dat[j]);
        sum -= dat[j];
      }
      fprintf(hexfile,              /* add checksum */
              upper_case ? "%2.2X\n" : "%2.2x\n", (unsigned char) sum);
    }

    /* write the last record */
    if (last_row) {
      sum = 0;
      low_addr = (unsigned short) (start+offset);
      upper_addr = (start+offset) - low_addr;
      if (upper_addr > base_addr) { /* if address overflows */
        base_addr = upper_addr;
        write_extended_address_record(base_addr,fp);
      }
      fprintf(hexfile,              /* begin record */
              upper_case ? ":%2.2X%4.4X00" : ":%2.2x%4.4x00", last_row, low_addr);
      sum -= (last_row + (low_addr>>8) + (low_addr&0xFF));
      bfd_get_section_contents(abfd, sect, p, offset, last_row);
      for (j=0; j<last_row; j++) {  /* fill in data */
        fprintf(hexfile, upper_case ? "%2.2X" : "%2.2x", dat[j]);
        sum -= dat[j];
      }
      fprintf(hexfile,              /* add checksum */
              upper_case ? "%2.2X\n" : "%2.2x\n", (unsigned char) sum);
    }    
  } /* if ((sect->flags & SEC_LOAD) && (sect->flags & SEC_HAS_CONTENTS)) */
}

void write_extended_address_record(file_ptr base_address, PTR fp) {
  FILE *hexfile;
  unsigned int   sum,upper_addr;

  sum = 0;
  hexfile = fp;
  upper_addr = (unsigned long) base_address>>16;
  sum -= (2 + 0 + 4 + (upper_addr>>8) + (upper_addr&0xFF));
  fprintf(hexfile,
          upper_case ? ":02000004%4.4X%2.2X\n" : ":02000004%4.4x%2.2x\n",
          upper_addr, (unsigned char) sum);

} /* write_extended_address_record */

void
write_section_image(bfd *abfd, asection *sect, PTR fp) {
#define DATA_LINE_WIDTH 4

  /* row-size in instructions word width 
     5 -> 15 bytes of instruction data
          20 bytes including the phantom byte */

  bfd_size_type row_size=(subordinate_image_row ? subordinate_image_row:0x200);

  FILE *imagefile=fp;
  unsigned char dat[MAX_ROW*4];
  unsigned char *p;
  file_ptr  PCstart, start, offset, raw_offset;
  bfd_size_type total, actual;
  unsigned int   num_rows,last_row,i,j;
  unsigned short low_addr;
  int data_line_width = 0;

  p = &dat[0];
  offset = 0;
  total = 0;
  raw_offset = 0;

  /* if section is load-able and has contents */
  /*   use real machine addresses here */
  if ((sect->flags & SEC_LOAD) && (sect->flags & SEC_HAS_CONTENTS))
  {

    fprintf(imagefile,"\t; %s\n", sect->name);

    /* print section header */
    PCstart = sect->lma;
    if (PCstart < 0x800000)
      start = PCstart + offset_address_by;
    else
      start = PCstart;

    total = sect->_raw_size;
    actual = (total * 3) / 4;

    /* report correct size of EEDATA sections */
    if (PCstart >= EEDATA_BASE_ADDR)
      actual = total / 2;

    num_rows = actual / (row_size * 3);
    last_row = (actual % (row_size * 3))/3;

    for (i = 0; i < num_rows + 1; i++) {
      /* first write the full records */
      int write_row_size;

      if (i < num_rows) {
        write_row_size = row_size;
      } else {
        write_row_size = last_row;
      }
      low_addr = (unsigned short) (start+(offset*2/3));

      fprintf(imagefile,"\t; record start\n");
      fprintf(imagefile,"\t.word 0x%4.4x ; destination\n", 
          low_addr & 0x7FFF | ((low_addr >> 15) ? 0x8000 : 0x0000));
      fprintf(imagefile,"\t.word 0x%4.4x ; len\n", write_row_size);
      fprintf(imagefile,"\t.word 0x%4.4x ; page | format\n",
          0x1F | ((low_addr >> 15) << 7));
      fprintf(imagefile,"\t; data start\n");
         
      if (bfd_get_section_contents(abfd,sect,p,raw_offset,write_row_size*4)== 0)
      {
        fprintf(stderr,"*** Error %d: could not get section contents %s\n", 
                bfd_get_error(), sect->name);
      } else {
        /* raw includes a phantom byte */
        raw_offset += write_row_size*4;
        offset += write_row_size*3;
        for (j=0; j < write_row_size; j++) {  
          /* fill in data */
          if (data_line_width++ == 0) {
            fprintf(imagefile, "	.pbyte ");
          }
      
          fprintf(imagefile, 
                    upper_case ? 
                       "0x%2.2X,0x%2.2X,0x%2.2X" : 
                       "0x%2.2x,0x%2.2x,0x%2.2x", 
                  dat[j*4], dat[j*4+1], dat[j*4+2]);
          if ((data_line_width != DATA_LINE_WIDTH) && (j+1 < write_row_size)) {
            fprintf(imagefile, ", ");
          } else { 
            fprintf(imagefile, "\n");
            data_line_width = 0;
          }
        }
      }
    }
  } /* if ((sect->flags & SEC_LOAD) && (sect->flags & SEC_HAS_CONTENTS)) */
}

int
dump_symbols(bfd *abfd) {
  long size, num, i;
  asymbol **symbols;

  size = bfd_get_symtab_upper_bound(abfd);
  if (size < 0) {
    /* error accessing symbol table */
    return error;
  }

  if (size == 0) {
    printf("  no symbols\n");
    return success;
  }

  symbols = (asymbol **) malloc(size);
  num = bfd_canonicalize_symtab(abfd, symbols);

  if (num < 0) {
    free(symbols);
    /* error processing symbol table */
    return error;
  }
  else {
    for (i=0; i<num; i++) {
      print_symbol(symbols[i]);
    }
    free(symbols);
    return success;
  }
}

void
print_symbol(asymbol *sym) {
  printf("  %s\n", bfd_asymbol_name(sym));
}


#if 0
/*
   Sample code cloned from coff_object_p in bfd/coffgen.c
   that shows how to read the file header magic number.
   This function can be called after bfd_openr and before
   bfd_check_format. Note that bfd_check_format does way
   more than just check the format. It calls many routines
   that are involved in setting up the bfd.
*/
#include "libbfd.h"
#include <coff/internal.h>
#include "libcoff.h"

unsigned short
coff_file_magic_number (abfd)
     bfd *abfd;
{
  unsigned int filhsz;
  unsigned int aoutsz;
  int nscns;
  PTR filehdr;
  struct internal_filehdr internal_f;
  struct internal_aouthdr internal_a;

  /* figure out how much to read */
  filhsz = bfd_coff_filhsz (abfd);
  aoutsz = bfd_coff_aoutsz (abfd);

  /* get the raw coff header */
  filehdr = bfd_alloc (abfd, filhsz);
  if (filehdr == NULL)
    return 0;
  if (bfd_read (filehdr, 1, filhsz, abfd) != filhsz)
    {
      if (bfd_get_error () != bfd_error_system_call)
	bfd_set_error (bfd_error_wrong_format);
      return 0;
    }
  /* convert to internal form */
  bfd_coff_swap_filehdr_in (abfd, filehdr, &internal_f);
  bfd_release (abfd, filehdr);

  /* read the optional header, too */
  if (internal_f.f_opthdr)
    {
      PTR opthdr;

      opthdr = bfd_alloc (abfd, aoutsz);
      if (opthdr == NULL)
	return 0;;
      if (bfd_read (opthdr, 1, internal_f.f_opthdr, abfd)
	  != internal_f.f_opthdr)
	{
	  return 0;
	}
      bfd_coff_swap_aouthdr_in (abfd, opthdr, (PTR) &internal_a);
      bfd_release (abfd, opthdr);
    }

  return internal_f.f_magic;
}
#endif
