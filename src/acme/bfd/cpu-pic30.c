/*
 * cpu-pic30.c -- BFD library support routines for the PIC30 architecture.
 * Copyright (C) 2000 Free Software Foundation, Inc.
 * Contributed by Microchip Corporation.
 * Written by Tracy A. Kuhrt
 *
 * This file is part of BFD, the Binary File Descriptor library.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include "bfd.h"
#include "sysdep.h"
#include "libbfd.h"
#include "coff-pic30.h"
#include "pic30-utils.h"
#include "libiberty.h"
#include "../../c30_resource/src/c30/resource_info.h"

#ifndef DIR_SEPARATOR
#define DIR_SEPARATOR '/'
#endif

#if defined (_WIN32) || defined (__MSDOS__) || defined (__DJGPP__) || \
  defined (__OS2__)
#ifndef DIR_SEPARATOR_2
#define HAVE_DOS_BASED_FILE_SYSTEM
#define DIR_SEPARATOR_2 '\\\\'
#define EXE_SUFFIX ".exe"
#define PATH_SEPARATOR ';'
#define DIR_SEPARATOR_STR "\\"
#endif
#endif

/* Define IS_DIR_SEPARATOR.  */
#ifndef IS_DIR_SEPARATOR
#ifndef DIR_SEPARATOR_2
# define IS_DIR_SEPARATOR(ch) ((ch) == DIR_SEPARATOR)
#else /* DIR_SEPARATOR_2 */
# define IS_DIR_SEPARATOR(ch) \
        (((ch) == DIR_SEPARATOR) || ((ch) == DIR_SEPARATOR_2))
#endif /* DIR_SEPARATOR_2 */
#endif

#ifndef DIR_SEPARATOR_2 
#define PATH_SEPARATOR ':'
#define DIR_SEPARATOR_2 DIR_SEPARATOR
#define EXE_SUFFIX ""
#define DIR_SEPARATOR_STR "/"
#endif

/******************************************************************************/

/* prototypes */
const bfd_arch_info_type * pic30_get_machine (const char * const name);
int pic30_proc_family(const bfd_arch_info_type *);
int pic30_is_dsp_machine(const bfd_arch_info_type *);
int pic30_is_eedata_machine(const bfd_arch_info_type *);
int pic30_is_auxflash_machine(const bfd_arch_info_type *);
int pic30_is_dma_machine(const bfd_arch_info_type *);
int pic30_is_codeguard_machine(const bfd_arch_info_type *);
int pic30_is_eds_machine(const bfd_arch_info_type *);
int pic30_is_pmp_machine(const bfd_arch_info_type *);
int pic30_is_epmp_machine(const bfd_arch_info_type *);
int pic30_is_ecore_machine(const bfd_arch_info_type *);
int pic30_is_dualpartition_machine(const bfd_arch_info_type *);
int pic30_is_5V_machine(const bfd_arch_info_type *);
void pic30_update_resource(const char *resource);
void pic30_load_codeguard_settings(const bfd_arch_info_type *, int);
void pic30_clear_codeguard_settings(void);
void * pic30_lookup_codeguard_setting(unsigned int, unsigned int);
void * pic30_lookup_valid_codeguard_setting(unsigned int);
char * pic30_codeguard_setting_name(void *);
unsigned int pic30_codeguard_setting_flags(void *s);
bfd_vma pic30_codeguard_setting_address(void *s);
int pic30_add_selected_codeguard_option(void *);
void pic30_dump_selected_codeguard_options(FILE *);
char * pic30_unique_selected_configword_names(void);
int pic30_decode_CG_settings(char *, bfd_vma, unsigned short, int);
unsigned short pic30_encode_CG_settings(char *);
void pic30_get_aivt_settings(const bfd_arch_info_type *, int);
bfd_boolean pic30_has_GSSK(void);
void pic30_get_ivt(const bfd_arch_info_type *, int);

#define ARCH_TABLE 1
#define CODEGUARD_SETTINGS 2
#define AIVT_SETTINGS 3
#define IVT 4
static void process_resource_file(unsigned int, unsigned int, int);


const bfd_arch_info_type * global_PROCESSOR = NULL;

static char *pic30_resource_file = 0;

#define EOL ,
#define ARCH(machine, printable_name, default_machine, next, flags) \
{ 16,                     \
  24,                     \
  16,                      \
  bfd_arch_pic30,         \
  machine,                \
  "pic30",                \
  printable_name,         \
  1,                      \
  default_machine,        \
  bfd_default_compatible, \
  bfd_default_scan,       \
  next }

#if 0
static const bfd_arch_info_type arch_info_struct[] =
{
#include "pic30-procs.h"
};
#endif

struct pic30_resource_info {
  unsigned int flags;
  bfd_arch_info_type *arch_info;
  struct pic30_resource_info *next;
};

typedef struct codeguard_select_list {
  codeguard_setting_type *sel;
  struct codeguard_select_list *next;
} codeguard_select_list_type;

codeguard_setting_type *CG_settings, *last_CG_setting;
static codeguard_select_list_type *CG_select, *last_CG_select;
ivt_record_type *ivt_records_list;
static ivt_record_type *last_ivt_record;

fuse_setting_type *fuse_settings, *last_fuse_setting;

bfd_boolean pic30_has_CG_settings = FALSE;

/* This is the "last" of the generic devices, and must not
 * be declared const, because the table of devices read
 * from the resource file will be appended to it. */
static bfd_arch_info_type generic_6 = 
   ARCH ( 95,                "GENERIC-16DSP-CH", TRUE, 0, HAS_DSP | HAS_EDS | HAS_ISAV4 | HAS_DUALCORE);

static bfd_arch_info_type generic_5 = 
   ARCH ( 94,                "GENERIC-16DSP-EP", TRUE, &generic_6, HAS_DSP | HAS_EDS | HAS_ECORE);

static bfd_arch_info_type generic_4 = 
   ARCH ( 93,                "GENERIC-16BIT-EP", TRUE, &generic_5, HAS_EDS | HAS_ECORE);

static bfd_arch_info_type generic_3 = 
   ARCH ( 92,                "GENERIC-16BIT-DA", TRUE, &generic_4, HAS_EDS);

static const bfd_arch_info_type generic_2 = 
   ARCH ( 91,                "GENERIC-16DSP", TRUE, &generic_3, HAS_DSP);

static const bfd_arch_info_type generic_1 = 
   ARCH ( 90,                "GENERIC-16BIT", TRUE, &generic_2, 0);

const bfd_arch_info_type bfd_pic30_arch = 
   ARCH ( 0,                 "30Fxxxx", TRUE,  &generic_1, 0 ) ;

static struct pic30_resource_info arch_flags_head[] = {
   { 0, (bfd_arch_info_type *) &bfd_pic30_arch, &arch_flags_head[1] },
   { 0, (bfd_arch_info_type *) &generic_1, &arch_flags_head[2] },
   { HAS_DSP, &generic_2, &arch_flags_head[3] },
   { HAS_EDS, &generic_3, &arch_flags_head[4] },
   { HAS_EDS | HAS_ECORE, &generic_4, &arch_flags_head[5] },
   { HAS_DSP | HAS_EDS | HAS_ECORE, &generic_5, &arch_flags_head[6] },
   { HAS_DSP | HAS_EDS | HAS_ISAV4, &generic_6, 0 }
};


/* Last index value of generic device in arch_flags_head */
#define LAST_GENERIC_DEVICE 6

static int pic30_tool_version;
char *pic30_resource_version;

static char *version_part1;

unsigned int aivtdis_bit_ptr = 0;
unsigned int pagesize = 0;
unsigned int aivtdis_mask = 0;
unsigned int aivtloc_ptr = 0;
unsigned int aivtloc_mask = 0;
bfd_boolean pic30_has_floating_aivt = FALSE;
bfd_boolean pic30_has_fixed_aivt = FALSE;

#define QUOTE2(X) #X
#define QUOTE(X) QUOTE2(X)

int
pic30_is_generic_machine(unsigned int machine) {
  if ((machine == 0) || ((machine >= 90) && (machine <= 95))) return 1;
  return 0;
}


/* stupid prototype */ static void get_resource_path(const char *resource);
static void get_resource_path(const char *resource) {

  char *tool_name = (char *) resource;
  char *c;

  /*
  ** In some command shells, no path information
  ** is provided as part of argv[0].
  */
  if (!IS_DIR_SEPARATOR(resource[0]))
  {
    /*
    ** No DOS path information for the program:
    ** search for the executable using the
    ** PATH environment variable.
    */
    struct stat fs;
    char *separator;
    const char *PATH;
    char *dosPATH = 0;
    int tool_len;
    int len;
    char *command;

    tool_name = xmalloc(strlen(resource) + 4 + 40);
    sprintf(tool_name, "%s", resource);
    tool_len = strlen(tool_name);
#if 0
    fprintf(stderr,"tool_name: %s\n", tool_name);
#endif
#if defined(HAVE_DOS_BASED_FILE_SYSTEM)
    /*
    ** Append ".exe" to the executable name, if necessary
    */
    if ((tolower(tool_name[tool_len-1]) != 'e') ||
        (tolower(tool_name[tool_len-2]) != 'x') ||
        (tolower(tool_name[tool_len-3]) != 'e') ||
        (       (tool_name[tool_len-4]) != '.'))
    {
      strcat(tool_name, ".exe");
      tool_len += 4;
    }
#endif
    /*
    ** Get the current PATH
    */
    PATH = getenv("PATH");
    if (PATH) {
      /*
       *  stupid gnu will print (null) to the string if PATH==0
       */
      dosPATH = xcalloc(1, strlen(PATH) + 3);
      sprintf(dosPATH,"%s%c.",PATH, PATH_SEPARATOR);
      PATH = dosPATH;
    } else {
      PATH=".";
    }
#if 0
    fprintf(stderr,"PATH=%s\n", PATH);
#endif
    len = 256;
    command = xmalloc(len);
    do
    { int path_len;

      separator = strchr(PATH, PATH_SEPARATOR);
      path_len = separator ? (unsigned)(separator-PATH) : strlen(PATH);
      if ((path_len + tool_len + 2)  > len) {
        len = path_len + tool_len + 80;
        free(command);
        command = xmalloc(len);
      }
      command[0] = 0;
      strncpy(command, PATH, path_len);
      command[path_len] = 0;
      if (!IS_DIR_SEPARATOR(command[path_len-1])) {
        strcat(command, DIR_SEPARATOR_STR);
      }
      strcat(command, tool_name);
#if 0
      fprintf(stderr,"dir=%s\n",command);
#endif
      if (stat(command, &fs) == 0) break;
      PATH = 0;
    } while (separator && (PATH = separator+1));
    if (dosPATH) free(dosPATH);
    if (PATH) tool_name = command;
  }
  pic30_resource_file = xmalloc(strlen(tool_name) +
                                sizeof("/c30_device.info") + 1);
  sprintf(pic30_resource_file,"%s", tool_name);
  for (c = pic30_resource_file + strlen(pic30_resource_file);
       !IS_DIR_SEPARATOR(*c); c--);
  *c = 0;
  strcat(pic30_resource_file,"/c30_device.info");
}

void pic30_update_resource(const char *resource) {
  /* The tool_version is defined in the string MCHP_VERSION */
  char *Microchip;
#ifndef MCHP_VERSION
  char *new_version = xstrdup("undefined0_00");
#else
  char *new_version = xstrdup(QUOTE(MCHP_VERSION));
#endif
  int major = 0, minor = 0;

  Microchip = new_version;
  if (Microchip) {
    for (; (*Microchip) && ((*Microchip < '0') || (*Microchip > '9')); 
         Microchip++);
    if (*Microchip) {
      major = strtol(Microchip, &Microchip, 0);
      if ((*Microchip) && ((*Microchip == '_') || (*Microchip == '.'))) {
         Microchip++;
         minor = strtol(Microchip, &Microchip, 0);
         for (; *Microchip && *Microchip != ' '; Microchip++);
      }
      pic30_tool_version = major *100 + minor;
      version_part1 = new_version;
      *Microchip = 0;
    }
  }
  get_resource_path(resource);
  process_resource_file(ARCH_TABLE, 0, 0);
}

static struct pic30_resource_info *selected_processor;

static void process_resource_file(unsigned int mode, unsigned int procID, int debug) {
  struct resource_data d;
  static int err_return = 0;
  int version;
  static int record = 0;
  static struct resource_introduction_block *rib = 0;

  if (err_return) return;

  if (pic30_resource_file == 0) {
    fprintf(stderr,"Provide a resource file");
    err_return = 1;
    return;
  }
  if (rib == 0) {
    rib = read_device_rib(pic30_resource_file,
                          global_PROCESSOR ? global_PROCESSOR->printable_name :
                                             0);
  }
  if (rib == 0) {
    fprintf(stderr,"Could not open resource file: %s\n", pic30_resource_file);
    err_return = 1;
    return;
  }
  if (strcmp(rib->tool_chain,"C30")) {
    fprintf(stderr,"Invalid resource resource file\n");
    close_rib();
    err_return = 1;
    return;
  }

  if (!pic30_resource_version) {
    pic30_resource_version = xmalloc(strlen(version_part1) + 40);
    version = rib->version.major * 100 + rib->version.minor;
#ifndef RESOURCE_MISMATCH_OK
    if (version != pic30_tool_version) {
      fprintf(stderr,"Warning: resource version (%d.%.2d) does not match!\n",
              rib->version.major, rib->version.minor);
      sprintf(pic30_resource_version,"%s, resource version %d.%02d (%c)",
              version_part1, rib->version.major, rib->version.minor, 
              rib->resource_version_increment);
    }  
    else {
      sprintf(pic30_resource_version,"%s (%c)",
              version_part1, rib->resource_version_increment);
    }
#else
      sprintf(pic30_resource_version,"%s (%c)",
              version_part1, rib->resource_version_increment);
#endif
  }

  if ((mode == ARCH_TABLE) && rib->field_count >= 3) {
    bfd_arch_info_type *last_generic = arch_flags_head[sizeof(arch_flags_head)/sizeof(struct pic30_resource_info)-1].arch_info;
    struct pic30_resource_info *last_arch_flags = &arch_flags_head[sizeof(arch_flags_head)/sizeof(struct pic30_resource_info)-1];
    for (record = 0; move_to_record(record); record++) {
      bfd_arch_info_type *next;
      struct pic30_resource_info *next_flags; 
      struct resource_data d2;
      struct resource_data d3;

      read_value(rik_string, &d);
      read_value(rik_int, &d2);
      if ((d2.v.i & RECORD_TYPE_MASK) == IS_DEVICE_ID) {
        next = xmalloc(sizeof(bfd_arch_info_type));
        memcpy(next, last_generic, sizeof(bfd_arch_info_type));
        last_generic->next = next;
        last_generic = next;
        next_flags = xmalloc(sizeof(struct pic30_resource_info));
        next->printable_name = d.v.s;
        next_flags->flags = d2.v.i;
        read_value(rik_int, &d3);
        next->mach = d3.v.i;
        next_flags->arch_info = next;
        last_arch_flags->next = next_flags;
        last_arch_flags = next_flags;
      } else {
        /* end of IS_DEVICE_ID records */
        free(d.v.s);
        break;
      }
    }
    last_arch_flags->next = 0;
  }

  if ((mode != ARCH_TABLE) && (rib->field_count >= 6)) {

    if (CG_settings) free(CG_settings);
    CG_settings = xmalloc(sizeof(codeguard_setting_type));
    memset(CG_settings, 0, sizeof(codeguard_setting_type));
    last_CG_setting = CG_settings;

    if (fuse_settings) free(fuse_settings);
    fuse_settings = xmalloc(sizeof(fuse_setting_type));
    memset(fuse_settings, 0, sizeof(fuse_setting_type));
    last_fuse_setting = fuse_settings;
    if (ivt_records_list) {
       /* free entire list */
       ivt_record_type *e,*n;

       for (e = ivt_records_list; e; e = n) {
          n = e->next;
          free(e);
       }
       ivt_records_list = 0;
       last_ivt_record = 0;
    }

    if (debug)
      printf("  matching records (procID = %d) ", procID);
    /* continue where we left offffffffffff */
    for (;move_to_record(record); record++) {
      codeguard_setting_type *cg_next;
      ivt_record_type *ivt_next;
      fuse_setting_type *fuse_next;
      struct resource_data d2,d3,d4,d5,d6;
      
      read_value(rik_string, &d); // name
      read_value(rik_int, &d2);   // flags
      read_value(rik_int, &d3);

      /* we don't support generic codeguard settings */
      // if ((d2.v.i & IS_CODEGUARD_ID) && (d2.v.i & FAMILY_MASK) &&
      if (((d2.v.i & RECORD_TYPE_MASK) == IS_CODEGUARD_ID) && 
          (d2.v.i & FAMILY_MASK) &&
          (d3.v.i == 0))
        printf("\nGeneric CodeGuard settings are not supported\n");

      // if ((d2.v.i & IS_CODEGUARD_ID) && (d3.v.i == procID)) 
      if (((d2.v.i & RECORD_TYPE_MASK) == IS_CODEGUARD_ID)  && 
          (((d2.v.i & PARTITIONED) != 0) == pic30_partition_flash) &&
          (d3.v.i == procID)) {
        if (debug)
          printf(".");
        read_value(rik_int, &d4);
        read_value(rik_int, &d5);
        read_value(rik_int, &d6);

        cg_next = xmalloc(sizeof(codeguard_setting_type));
        cg_next->name    = d.v.s;
        cg_next->flags   = d2.v.i & CODEGUARD_MASK;
        cg_next->mask    = d4.v.i;
        cg_next->value   = d5.v.i;
        cg_next->address = d6.v.i;
        cg_next->next    = 0;

        last_CG_setting->next = cg_next;
        last_CG_setting = cg_next;
        if (!pic30_has_CG_settings)
          pic30_has_CG_settings = TRUE;
      } 
      else if (((d2.v.i & RECORD_TYPE_MASK) == IS_MEM_ID)  &&
               (d2.v.i & MEM_CONFIG_WORD) &&
               (d3.v.i == procID)) {

        read_value(rik_int, &d4);
        
        fuse_next = xmalloc(sizeof(fuse_setting_type));
        fuse_next->name = d.v.s;
        fuse_next->address = d4.v.i;
        fuse_next->next = 0;

        last_fuse_setting->next = fuse_next;
        last_fuse_setting = fuse_next;        
      } 
      else if (((d2.v.i & RECORD_TYPE_MASK) == IS_MEM_ID)  &&
          (d3.v.i == procID)) {
        if (debug)
          printf(".");
        read_value(rik_int, &d4);
        read_value(rik_int, &d5);

        if (((d2.v.i & MEM_PARTITIONED) != 0) == pic30_partition_flash) {
          if (d2.v.i & MEM_IS_AIVT_ENABLED) {
            pic30_has_floating_aivt = TRUE;
            aivtdis_bit_ptr = d4.v.i;
            aivtdis_mask = d5.v.i;
          }

          if (d2.v.i & MEM_AIVT_LOCATION) {
            aivtloc_ptr = d4.v.i;
            aivtloc_mask = d5.v.i;
          }
        }

        if (d2.v.i & MEM_PAGESIZE) {
          pagesize = d5.v.i;
        }
        if (d2.v.i & MEM_FIXED_IVT)
          ivt_base = d4.v.i;
        else if (d2.v.i & MEM_FIXED_AIVT) {
          pic30_has_fixed_aivt = TRUE;
          aivt_base = d4.v.i;
        }
      }  
      else if (((d2.v.i & RECORD_TYPE_MASK) == IS_VECTOR_ID)  &&
          (d3.v.i == procID)) {
        if (debug)
          printf(".");

        ivt_next = xmalloc(sizeof(ivt_record_type));

        /* unfilled fields */
        ivt_next->sec_name = 0;
        ivt_next->ivt_sec = 0;

        ivt_next->name = d.v.s;
        ivt_next->offset = ((d2.v.i >> VECTOR_IDX_SHIFT) & 
                        ((1 << (VECTOR_IDX_WIDTH+1)) - 1)) * 2;
        if (d2.v.i & VECTOR_ALT_VECTOR) 
          ivt_next->is_alternate_vector = TRUE;
        else
          ivt_next->is_alternate_vector = FALSE;

        if (debug) {
          printf("vector: %s @ 0x%4.4x %s\n",
                 ivt_next->name,
                 ivt_next->offset,
                 ivt_next->is_alternate_vector ? "alternate" : "");
        }
        ivt_next->flags = 0;
        ivt_next->next = 0;

        if ((ivt_next->offset == 0) && 
            strcmp(ivt_next->name,"_DefaultInterrupt") == 0) {
           /* can't do anything without an offset... */
           free(ivt_next);
           //free(d.v.s);
           continue;
        }

        if (ivt_records_list == 0) {
          ivt_records_list = ivt_next;
          last_ivt_record = ivt_next;
        } else {
          last_ivt_record->next = ivt_next;        
          last_ivt_record = ivt_next;
        }
      }  else free(d.v.s);
    }
    close_rib();
    rib = 0;
  }
  if (debug)
    printf("\n");
}
/*
** Load CodeGuard settings from a resource file
** for a particular processor.
*/
void pic30_load_codeguard_settings(const bfd_arch_info_type *proc, int debug)
{
  /* do nothing if already loaded */
  if (CG_settings) {
    if (debug)
      printf("\nCodeGuard settings already loaded.\n");
    return;
  }

  /* do nothing if no processor specified */
  if (!proc) {
    if (debug)
      printf("\nCan't load CodeGuard settings; no target device specified.\n");
    return;
  }

  /* else read the resource file */
  if (debug)
    printf("\nLoading CodeGuard settings for %s:\n", proc->printable_name);
  process_resource_file(CODEGUARD_SETTINGS, proc->mach, debug);
}

/*
** Clear the CodeGuard settings
*/
void pic30_clear_codeguard_settings()
{
  if (CG_settings) free(CG_settings);
}


/*
** Lookup a CodeGuard setting
** from the list of currently selected options.
**
** Takes two arguments:
**
**  base_flags = flags that must be set
**  seek_flags = flags we are looking for
**
** Sample usage:
**   Which of flags a|b|c is set for xx:yy?
**
** Returns:
**   A setting for xx:yy that includes at least one of a|b|c
**   or NULL
*/
void * pic30_lookup_codeguard_setting(unsigned int base_flags,
                                      unsigned int seek_flags)
{
  codeguard_select_list_type *s;

  if (!CG_select) return NULL;

#if 0
  printf("\nLooking up CodeGuard setting, base_flags = 0x%x,"
         " seek_flags = 0x%x\n", base_flags, seek_flags);
#endif
  for (s = CG_select; s; s = s->next ) {
#if 0
    printf("  %s  0x%x\n", s->sel->name, s->sel->flags);
#endif
    if (((s->sel->flags & base_flags) == base_flags) &&
        ((s->sel->flags & seek_flags) != 0))
      return s->sel;
  }
#if 0
  printf("  (not found)\n");
#endif
  return NULL;
}


/*
** Lookup an exact CodeGuard setting
** from the list of all valid options.
**
** Note that the flags argument is complete.
**
** Sample usage:
**   Is setting xx:yy:zz valid for this device?
*/
void * pic30_lookup_valid_codeguard_setting(unsigned int flags)
{
  codeguard_setting_type *s;

  if (!CG_settings) return NULL;

  for (s = CG_settings; s; s = s->next ) {
#if 0
    printf("  %s  0x%x\n", s->name, s->flags);
#endif
    if (s->flags == flags)
      return s;
  }
  return NULL;
}

/*
** Accessor functions for CodeGuard settings
*/
char * pic30_codeguard_setting_name(void *s)
{
  return ((codeguard_setting_type *)s)->name;
}


unsigned int pic30_codeguard_setting_flags(void *s)
{
  return ((codeguard_setting_type *)s)->flags;
}

bfd_vma pic30_codeguard_setting_address(void *s)
{
  return ((codeguard_setting_type *)s)->address;
}


/*
** Collect CodeGuard options and look for conflicts
**
** Note that option names have format "name:setting:value"
*/
int pic30_add_selected_codeguard_option(void *op)
{
  codeguard_setting_type *opt = (codeguard_setting_type *) op;
  codeguard_select_list_type *s,*next,*last;

  if (!CG_select) {
    /* first item in the list, add it */
    next = xmalloc(sizeof(codeguard_select_list_type));
    next->sel = opt;
    next->next = 0;
    CG_select = next;
    return 1;
  }
  else {
    /* look for conflicts */
    for (s = CG_select; s; last = s, s = s->next ) {
      char *p; int len;

      /* take the first two fields of opt->name */
      p = strstr(opt->name, ":"); if (p++) p = strstr(p, ":");
      len = p - opt->name;

      /* compare these fields only */
      if (strncmp(opt->name, s->sel->name, len) == 0) {

        /* name:setting match; check for duplicate or alias...
           we must test the mask and hex value, not the
           value string, in order to support aliases */
        if ((opt->mask == s->sel->mask) &&
            (opt->value == s->sel->value))
          return 1;  /* exact match OK */
        else {
          fprintf(stderr,"Error: %s does not match %s\n", opt->name, s->sel->name);
          return 0;
        }
      }
    }
  }

  /* no conflict found; add to the end of the list */
  next = xmalloc(sizeof(codeguard_select_list_type));
  next->sel = (codeguard_setting_type *) opt;
  next->next = 0;

  last->next = next;
  return 1;
}


/*
** Dump selected CodeGuard options
*/
void pic30_dump_selected_codeguard_options(FILE *f)
{
  codeguard_select_list_type *s;

  if (!CG_select) return;

  fprintf(f,"\nSelected CodeGuard Options:\n");

  for (s = CG_select; s; s = s->next )
    fprintf(f,"  %s\n", s->sel->name);
}


/*
** Create a list of unique CodeGuard option configword names
**
** Note that options have the format "name:setting:value"
**
** The result is formatted as "name1,name2,nameN,"
*/
char * pic30_unique_selected_configword_names(void)
{
#define BUFFER_SIZE 40

  codeguard_select_list_type *s;
  char *p,*str,*result = xmalloc(BUFFER_SIZE);
  unsigned int total = 0;

  result[0] = '\0';
  for (s = CG_select; s; s = s->next ) {
    if (!s) continue;

    /* extract the config word name */
    str = strdup(s->sel->name);
    p = strtok(str, ":");
      
    /* loop if not unique */
    if (strstr(result, p)) {
      free(str);
      continue;
    }

    total += strlen(p);
    if (total >= BUFFER_SIZE - 2)
      result = realloc(result, total + BUFFER_SIZE);
    result = strcat(result, p);
    result = strcat(result, ",");
    free(str);
  }
  return result;
}

/*
** Decode a CodeGuard config word,
** validate the data and update CG_select.
**
** return code:
**   1 = valid settings found (and no errors)
**   0 = no valid settings found
*/
int pic30_decode_CG_settings(char *name, bfd_vma address, unsigned short value, int debug)
{
  codeguard_setting_type *s;
  fuse_setting_type *f;
  int matches = 0, errors = 0;

  if (!CG_settings) return 0;
  if (!fuse_settings) return 0;

  if (address) {
   for (f = fuse_settings ; f != NULL; f = f->next) {
     if (f && (f->address == address)) {
       for (s = CG_settings; s ; s = s->next ) {
          if (s && s->name && strstr(s->name, f->name)) {
            if ((value & s->mask) == s->value) {
              if (pic30_add_selected_codeguard_option(s))
               matches++;
             else
               errors++;
             if (debug)
               printf("  %s\n", s->name);
            }
          }
        }
      }
   }
  }
  else {
   for (s = CG_settings; s ; s = s->next ) {
     if (s && s->name && (strncmp(s->name, name, strlen(name)) == 0))
     {
      if ((value & s->mask) == s->value) {
        if (pic30_add_selected_codeguard_option(s))
          matches++;
        else
          errors++;
        if (debug)
          printf("  %s\n", s->name);
      }
     }
   }
  }
  if (matches && !errors)
    return 1;
  else
    return 0;
}

bfd_boolean pic30_has_GSSK(void)
{
  fuse_setting_type *f;

  if (!fuse_settings) return FALSE;

  for (f = fuse_settings; f != NULL ; f = f->next) {
     if (f->name  && (strcmp(f->name, "GSSK") == 0)) 
       return TRUE;
  }
  return FALSE;
}

unsigned short pic30_encode_CG_settings(char *name)
{
  codeguard_select_list_type *s;
  unsigned short result = ~0;
  unsigned short mask = 0;

  if (!CG_select) return result;

  for (s = CG_select; s; s = s->next ) {
    if (strncmp(s->sel->name, name, strlen(name)) == 0) {
      result = (result & ~(s->sel->mask)) | s->sel->value;
      if (strcmp(name, "FGS") == 0) {
        if (strstr(s->sel->name, "GSS") || strstr(s->sel->name, "GWRP"))
          mask |= s->sel->mask;
      }
    }
  }
  if ((pic30_is_ecore_machine(global_PROCESSOR) ||
      (pic30_is_isav4_machine(global_PROCESSOR))) && pic30_has_GSSK() && 
      (strcmp(name, "FGS") == 0)){
        if ((result & mask ) == mask)
          result = result & 0xFFCF; /* GSSK bits (4 & 5) of FGS should be 00
                                        when GSS = 1 & GWRP = 1 */
                                    /* XC16E-63 was entered to improve this
                                       to have the position of the GSSK bits
                                       in the resource file since it might
                                       change from bits 4 & 5 to something
                                       else. */
        }

  return result;
}


/*
** Lookup a machine description
**
*/
const bfd_arch_info_type *
pic30_get_machine (name)
   const char * const name;
{

   const bfd_arch_info_type * p;
   struct pic30_resource_info *f;

   f = arch_flags_head[0].next;
   
   for (p = bfd_pic30_arch.next; p != NULL; f = f->next, p = p->next)
   {
      if (strcasecmp (name, p->printable_name) == 0)
         break;
   } /* for p */
   if (p) {
     if (f->arch_info != p) {
       fprintf(stderr,"Architecture description mis-match!\n");
     } else selected_processor = f;
   }
   return p;
}

/*
** Lookup if Generic device
*/
int
pic30_is_generic(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  for (f = arch_flags_head[0].next; f != NULL;rc++, f = f->next)
    if (proc == f->arch_info) {
      break;
    }

  return (rc <= LAST_GENERIC_DEVICE);
}

/*
** Lookup a processor family
*/
int
pic30_proc_family(const bfd_arch_info_type *proc)
{
  int rc = -1;
  struct pic30_resource_info *f;

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & FAMILY_MASK;
    }

  return rc;
}


/*
** Query machine for DSP support
*/
int
pic30_is_dsp_machine(const bfd_arch_info_type *proc)
{
  int rc = 1;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,  */
    return rc;         /*  assume it supports DSP instructions */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_DSP;
    }

  return rc;
}


/*
** Query machine for EEPROM support
*/
int
pic30_is_eedata_machine(const bfd_arch_info_type *proc)
{
  int rc = 1;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,  */
    return rc;         /*  assume it supports EEDATA */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_EEDATA;
    }

  return rc;
}


/*
** Query machine for DMA support
*/
int
pic30_is_dma_machine(const bfd_arch_info_type *proc)
{
  int rc = 1;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,  */
    return rc;         /*  assume it supports DMA V1 */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = 0;
      if (f->flags & HAS_DMA) rc = 1;
      if (f->flags & HAS_DMAV2) rc = 2;
    }

  return rc;
}

/*
** Query machine for AUXFLASH support
*/
int
pic30_is_auxflash_machine(const bfd_arch_info_type *proc)
{
  int rc = 1;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,  */
    return 0;         /*  it's not an auxflash machine */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = 0;
      if (f->flags & HAS_AUXFLASH) rc = 1;
    }

  return rc;
}


/*
** Query machine for CodeGuard support
*/
int
pic30_is_codeguard_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,  */
    return rc;         /*  assume it does NOT support CodeGuard */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_CODEGUARD;
    }

  return rc;
}


/*
** Query machine for EDS support
*/
int
pic30_is_eds_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support EDS,           */
                       /*  allowing the sim30 device to use more RAM */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_EDS;
    }

  return rc;
}


/*
** Query machine for PMP support
*/
int
pic30_is_pmp_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support PMP            */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_PMP;
    }

  return rc;
}


int
pic30_is_epmp_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support EPMP           */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_PMPV2;
    }

  return rc;
}

int
pic30_is_isav4_machine(const bfd_arch_info_type *proc)
{
  extern bfd_boolean pic30_isa_v4;

  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)
    return rc || pic30_isa_v4;

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_ISAV4;
    }

  return rc || pic30_isa_v4;
}


int
pic30_is_ecore_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support ECORE          */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_ECORE;
    }

  return rc;
}

int
pic30_is_dualpartition_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support dualpartition          */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_DUALPARTITION;
    }

  return rc;
}

int
pic30_is_contexts_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support contexts          */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = f->flags & HAS_ALTREGS;
    }

  return rc;
}


int
pic30_is_5V_machine(const bfd_arch_info_type *proc)
{
  int rc = 0;
  struct pic30_resource_info *f;

  if (proc == NULL)    /* if no processor has been specified,        */
    return rc;         /*  assume it does NOT support ECORE          */

  for (f = arch_flags_head[0].next; f != NULL; f = f->next)
    if (proc == f->arch_info) {
      rc = (f->flags & HAS_5VOLTS) || (f->flags & P30F);
    }

  return rc;
}

int
pic30_display_as_program_memory_p(asection *sec)
{
  int fDisplay;

    fDisplay = ((sec->flags & SEC_CODE) | (sec->auxflash) |
                (sec->packedflash && (sec->owner->flags & EXEC_P)));

  return(fDisplay);
}

int
pic30_display_as_data_memory_p(asection *sec)
{
  int fDisplay;

  if ((sec->owner->flags & EXEC_P) == 0) /* unlinked object */
    fDisplay = !PIC30_IS_CODE_ATTR(sec) && !PIC30_IS_AUXFLASH_ATTR(sec);
  else
    fDisplay = (!PIC30_IS_CODE_ATTR(sec) &&
                !PIC30_IS_AUXPSV_ATTR(sec) &&
                !PIC30_IS_PSV_ATTR(sec) &&
                !PIC30_IS_EEDATA_ATTR(sec) &&
                !PIC30_IS_AUXFLASH_ATTR(sec) &&
                !PIC30_IS_PACKEDFLASH_ATTR(sec));

  return(fDisplay);
}

int
pic30_display_as_readonly_memory_p(asection *sec)
{
  int fDisplay;

    fDisplay = ((PIC30_IS_PSV_ATTR(sec) || PIC30_IS_AUXPSV_ATTR(sec) ||
                 PIC30_IS_EEDATA_ATTR(sec)) && 
                ((sec->owner->flags & EXEC_P) == EXEC_P));

  return(fDisplay);
}

/*
** Get aivt settings from a resource file
** for a particular processor.
*/
void pic30_get_aivt_settings(const bfd_arch_info_type *proc, int debug)
{
  /* do nothing if no processor specified */
  if (!proc) {
    if (debug)
      printf("\nCan't get aivt settings; no target device specified.\n");
    return;
  }

  /* else read the resource file */
  if (debug)
    printf("\nGetting aivt settings for %s:\n", proc->printable_name);
  process_resource_file(AIVT_SETTINGS, proc->mach, debug);
}

/*
** Get ivt from a resource file
** for a particular processor.
*/
void pic30_get_ivt(const bfd_arch_info_type *proc, int debug)
{
  /* do nothing if no processor specified */
  if (!proc) {
    if (debug)
      printf("\nCan't get the ivt settings; no target device specified.\n");
    return;
  }

  /* else read the resource file */
  if (debug)
    printf("\nGetting the ivt for %s:\n", proc->printable_name);
  process_resource_file(IVT, proc->mach, debug);
}

/*
 * object selection
 *
 */

struct pic30_deferred_archive_members *pic30_deferred = NULL;

int pic30_count_ones(unsigned int a) {
  int result = 0;

  while (a) {
    if (a & 1) result++;
    a = a >> 1;
  }
  return result;
}

void pic30_defer_archive(carsym *symdef,
                         asymbol *sym,
                         bfd *abfd, 
                         struct bfd_link_info *info, 
                         unsigned int new_mask_bits, 
                         unsigned int new_set_bits,
                         symindex aye) {
  struct pic30_deferred_archive_members *m;
  const char *name;

  if (symdef)
     name = symdef->name;
  else if (sym) 
     name = sym->name;
  else 
     abort();

  if (pic30_debug)
    printf("...Defer %s [%s]\n", name, abfd->filename);
  for (m = pic30_deferred; m; m = m->next) {
    if (m->symdef ? 
          (strcmp(m->symdef->name, name) == 0) :
          (strcmp(m->sym->name, name) == 0)) {
      /* deffered match found already */
      if ((new_mask_bits < m->new_mask_bits) ||
          ((new_mask_bits == m->new_mask_bits) && 
           (new_set_bits < m->new_set_bits))) {
         /* this one is better iff there are fewer mask bits set or
          * there are no more mask bits set, and there are less 1 bits 
          * requried */
         if (pic30_debug)
           printf("...Improving match from (%d,%d)\n",  m->new_mask_bits,
                                                         m->new_set_bits);
         m->symdef = symdef;
         m->sym = sym;
         m->info = info;
         m->abfd = abfd;
         m->new_mask_bits = new_mask_bits;
         m->new_set_bits = new_set_bits;
         m->aye = aye;
      }
      return;
    }
  }
  m = malloc(sizeof(struct pic30_deferred_archive_members));
  m->symdef = symdef;
  m->sym = sym;
  m->info = info;
  m->abfd = abfd;
  m->new_mask_bits = new_mask_bits;
  m->new_set_bits = new_set_bits;
  m->next = pic30_deferred;
  m->aye = aye;
  pic30_deferred = m;
}

void pic30_remove_archive(carsym *symdef, asymbol *sym) {
  struct pic30_deferred_archive_members *m,*last = 0, *next;
  const char *name;
  bfd *removed_bfd = 0;

  if (symdef)
     name = symdef->name;
  else if (sym) 
     name = sym->name;
  else 
     abort();
  if (pic30_debug)
    printf("...remove %s\n", name);

  /* each symbol is in the list once */
  for (m = pic30_deferred; m; last = m, m = m->next) {
    if (m->symdef ? 
          (strcmp(m->symdef->name, name) == 0) :
          (strcmp(m->sym->name, name) == 0)) {
      if (pic30_debug)
        printf("...removed %s\n", m->abfd->filename);
      removed_bfd = m->abfd;
      if (last) {
        last->next = m->next;
      } else {
        pic30_deferred = m->next;
      }
      free(m);
      break;
    }
  }
  /* each bfd may have multiple symbols */
  for (m = pic30_deferred; m; last = m, m = next) {
    next = m->next;
    if (m->abfd == removed_bfd) {
      if (pic30_debug)
        printf("...removed %s\n", m->abfd->filename);
      if (m != pic30_deferred) {
        last->next = next;
      } else {
        pic30_deferred = next;
      }
      free(m);
    }
  }
}

struct pic30_deferred_archive_members *pic30_pop_tail_archive() {
  struct pic30_deferred_archive_members *m,*last = 0,*next,*return_m;

  for (m = pic30_deferred; m && m->next; last = m,m = m->next);
  if (last) {
    last->next = NULL;
  } else {
    pic30_deferred = NULL;
  }
  if (m && pic30_debug)
    printf("...pop tail %s\n", m->symdef ? m->symdef->name : m->sym->name);

  return_m = m;

  /* each bfd may have multiple symbols */
  for (m = pic30_deferred; m; last = m, m = next) {
    next = m->next;
    if (m->abfd == return_m->abfd) {
      if (pic30_debug)
        printf("...removed %s\n", m->abfd->filename);
      if (m != pic30_deferred) {
        last->next = next;
      } else {
        pic30_deferred = next;
      }
      free(m);
    }
  }

  return return_m;
}

void pic30_clear_deferred(void) {
  struct pic30_deferred_archive_members *m,*next = 0;
         
  for (m = pic30_deferred; m; m = next) {
    next = m->next;
    free(m);
  }
  pic30_deferred = NULL;
}
