/* Subroutines used for Microchip PIC32 MCU support
   Copyright (C) 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998
   1999, 2000, 2001, 2002, 2003, 2004, 2005, 2007, 2008, 2009
   Free Software Foundation, Inc.
   Contributed by J. Grosbach, james.grosbach@microchip.com, and
   T. Kuhrt, tracy.kuhrt@microchip.com
   Changes by J. Kajita, jason.kajita@microchip.com, and
   G. Loegel, george.loegel@microchip.com

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  */

#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "cppdefault.h"
#include "tm.h"
#include <signal.h>
#include "rtl.h"
#include "regs.h"
#include "hard-reg-set.h"
#include "real.h"
#include "insn-config.h"
#include "conditions.h"
#include "insn-attr.h"
#include "recog.h"
#include "toplev.h"
#include "output.h"
#include "tree.h"
#include "function.h"
#include "expr.h"
#include "optabs.h"
#include "libfuncs.h"
#include "flags.h"
#include "reload.h"
#include "tm_p.h"
#include "ggc.h"
#include "gstab.h"
#include "hashtab.h"
#include "debug.h"
#include "target.h"
#include "target-def.h"
#include "integrate.h"
#include "langhooks.h"
#include "cfglayout.h"
#include "sched-int.h"
#include "gimple.h"
#include "bitmap.h"
#include "diagnostic.h"
#include "params.h"
#include "prefix.h"
#include "bversion.h"

#include <stdio.h>
#include "cpplib.h"
#include "mchp-protos.h"
#include "mchp-pragmas.h"
#include "c-common.h"
#include "c-pragma.h"
#include "c-tree.h"
#include "incpath.h"
#include "cppdefault.h"
#include "config/mips/mips-machine-function.h"
#include "version.h"
#ifdef __MINGW32__
void *alloca(size_t);
#else
#include <alloca.h>
#endif

#include "config/mchp-cci/cci.h"

#define SKIP_LICENSE_MANAGER
#warning XCLM disabled

#define xstr(s) str(s)
#define str(s) #s

#define const_section readonly_data_section
#define dconst_section readonly_data_section

/* Global Variables */
extern const char * mchp_text_scn;
SECTION_FLAGS_INT mchp_text_flags = SECTION_CODE;
extern bool user_defined_section_attribute;

extern bool bss_initializer_p (const_tree decl);

extern cpp_options *cpp_opts;

/* Options used for C translation units */
#define MCHP_XCLM_FREE_LICENSE 0x0
#define MCHP_XCLM_VALID_STANDARD_LICENSE 0x1
#define MCHP_XCLM_VALID_PRO_LICENSE 0x2

/* Options used for C++ translation units */
#define MCHP_XCLM_NO_CPP_LICENSE 0x3
#define MCHP_XCLM_VALID_CPP_FREE 0x4
#define MCHP_XCLM_VALID_CPP_FULL 0x5

/* Local Variables */

#ifndef BITSET_P
/* True if bit BIT is set in VALUE.  */
#define BITSET_P(VALUE, BIT) (((VALUE) & (1 << (BIT))) != 0)
#endif

#define SECTION_FLAG_EXEC       "x"
#define SECTION_FLAG_DATA       "d"
#define SECTION_FLAG_BSS        "b"
#define SECTION_FLAG_READONLY   "r"

#define SECTION_NAME_BSS          ".bss"
#define SECTION_NAME_NBSS         ".sbss"
#define SECTION_NAME_SBSS         ".sbss"
#define SECTION_NAME_DATA         ".data"
#define SECTION_NAME_NDATA        ".sdata"
#define SECTION_NAME_SDATA        ".sdata"
#define SECTION_NAME_CONST        ".rodata"
#define SECTION_NAME_RAMFUNC      ".ramfunc"
#define SECTION_NAME_PBSS         ".pbss"
#define SECTION_NAME_INIT         ".init"
#define SECTION_NAME_FINI         ".fini"
#define SECTION_NAME_CTORS        ".ctors"
#define SECTION_NAME_DTORS        ".dtors"
#define SECTION_NAME_INIT_ARRAY   ".init_array"
#define SECTION_NAME_FINI_ARRAY   ".fini_array"

#define JOIN2(X,Y) (X ## Y)
#define JOIN(X,Y) JOIN2(X,Y)
#define MCHP_ULL(X) JOIN2(X,ULL)

/* 0x100000 */
#define SECTION_READ_ONLY       (MCHP_ULL(SECTION_MACH_DEP))
#define SECTION_CONST           (MCHP_ULL(SECTION_MACH_DEP))
#define SECTION_RAMFUNC         (MCHP_ULL(SECTION_MACH_DEP) << 1)
#define SECTION_NEAR            (MCHP_ULL(SECTION_MACH_DEP) << 2)
#define SECTION_PERSIST         (MCHP_ULL(SECTION_MACH_DEP) << 3)
#define SECTION_NOLOAD          (MCHP_ULL(SECTION_MACH_DEP) << 4)
#define SECTION_INFO            (MCHP_ULL(SECTION_MACH_DEP) << 5)
#define SECTION_ADDRESS         (MCHP_ULL(SECTION_MACH_DEP) << 6)
#define SECTION_ALIGN           (MCHP_ULL(SECTION_MACH_DEP) << 7)


/* the attribute names from the assemblers point of view */
#define SECTION_ATTR_ADDRESS "address"
#define SECTION_ATTR_ALIGN   "align"
#define SECTION_ATTR_BSS     "bss"
#define SECTION_ATTR_CODE    "code"
#define SECTION_ATTR_CONST   "code"
#define SECTION_ATTR_DATA    "data"
#define SECTION_ATTR_INFO    "info"
#define SECTION_ATTR_NEAR    "near"
#define SECTION_ATTR_NOLOAD  "noload"
#define SECTION_ATTR_PERSIST "persist"
#define SECTION_ATTR_RAMFUNC "ramfunc"
#define SECTION_ATTR_DEFAULT "unused"

struct valid_section_flags_
{
  const char *flag_name;
  char single_letter_equiv;
  unsigned long long flag_mask;
  unsigned long long incompatible_with;
} valid_section_flags[] =
{
  {
    SECTION_ATTR_ADDRESS, 0,
    SECTION_ADDRESS, SECTION_ALIGN | SECTION_INFO
  },
  {
    SECTION_ATTR_ALIGN, 0,
    SECTION_ALIGN,   SECTION_ADDRESS |
    SECTION_INFO
  },
  {
    SECTION_ATTR_BSS, 'b',
    SECTION_BSS,     SECTION_CODE | SECTION_WRITE | SECTION_PERSIST |
    SECTION_READ_ONLY
  },
  {
    SECTION_ATTR_CODE, 'x',
    SECTION_CODE,     SECTION_WRITE | SECTION_BSS |
    SECTION_NEAR |
    SECTION_PERSIST |
    SECTION_READ_ONLY
  },
  {
    SECTION_ATTR_CONST, 'r',
    SECTION_READ_ONLY,SECTION_CODE | SECTION_WRITE | SECTION_BSS |
    SECTION_NEAR |
    SECTION_INFO
  },
  {
    SECTION_ATTR_DATA, 'd',
    SECTION_WRITE,    SECTION_BSS | SECTION_PERSIST |
    SECTION_READ_ONLY
  },

  {
    SECTION_ATTR_INFO, 0,
    SECTION_INFO,     SECTION_PERSIST |
    SECTION_ADDRESS | SECTION_NEAR |
    SECTION_ALIGN |
    SECTION_NOLOAD | SECTION_MERGE |
    SECTION_READ_ONLY
  },
  {
    SECTION_ATTR_NOLOAD, 0,
    SECTION_NOLOAD,   SECTION_MERGE | SECTION_INFO
  },
  {
    SECTION_ATTR_PERSIST, 'b',
    SECTION_PERSIST,  SECTION_CODE | SECTION_WRITE | SECTION_BSS |
    SECTION_MERGE |
    SECTION_INFO | SECTION_READ_ONLY
  },
  {
    SECTION_ATTR_RAMFUNC, 0,
    SECTION_RAMFUNC,     SECTION_WRITE | SECTION_BSS |
    SECTION_NEAR |
    SECTION_PERSIST |
    SECTION_READ_ONLY
  },
  { 0, 0, 0, 0},
};

struct reserved_section_names_
{
  const char *section_name;
  SECTION_FLAGS_INT mask;
} reserved_section_names[] =
{
  { ".bss",    SECTION_BSS },
  { ".rodata",  SECTION_READ_ONLY },
  { ".rodata1",  SECTION_READ_ONLY },
  { ".data",   SECTION_WRITE },
  { ".dconst", SECTION_WRITE },
  { ".sbss",   SECTION_BSS | SECTION_NEAR },
  { ".sdata",  SECTION_WRITE | SECTION_NEAR },
  { ".sdconst",SECTION_WRITE | SECTION_NEAR },
  { ".pbss",   SECTION_PERSIST },
  { ".text",   SECTION_CODE },
  { ".ramfunc", SECTION_RAMFUNC },
  { ".gnu.linkonce.d", SECTION_WRITE },
  { ".gnu.linkonce.t", SECTION_CODE },
  { ".gnu.linkonce.r", SECTION_READ_ONLY },
  { ".gnu.linkonce.s2", SECTION_READ_ONLY },
  { ".gnu.linkonce.sb2", SECTION_READ_ONLY },
  { ".got", SECTION_WRITE },
  { ".got.plt", SECTION_WRITE },
  { ".gnu.linkonce.s", SECTION_WRITE | SECTION_NEAR },
  { ".gnu.linkonce.sb", SECTION_BSS | SECTION_NEAR },
  { ".dynsbss", SECTION_BSS | SECTION_NEAR },
  { ".scommon", SECTION_BSS | SECTION_NEAR },
  { ".dynbss", SECTION_BSS },
  { 0, 0},
};

static const char *mchp_default_section = "*";
static char this_default_name[sizeof("*_012345670123456701234567")];
static time_t current_time = 0;
static int lfInExecutableSection = FALSE;

enum
{
  ss_pushed = 0,     /* section stack was pushed */
  ss_set = 1,        /* section stack was set */
  ss_should_pop = 2  /* popped, but wait til we see what is pushed next */
};

typedef struct sectionStack_
{
  const char * pszName;
  unsigned int pszFlag;
  struct sectionStack_ *pop;
  SECTION_FLAGS_INT flags;
} sectionStack;

enum css
{
  css_pop = 0,
  css_push = 1,
  css_activate = 2,
  css_tos = 3
};

static sectionStack default_section =
{
  ".text.default_section", SECTION_CODE , 0x0, 0x0
};

static sectionStack *lSectionStack = &default_section;
static sectionStack *freeSectionStack;

/* The maximum distance between the top of the stack frame and the
   value $sp has when we save and restore registers.

   The value for normal-mode code must be a SMALL_OPERAND and must
   preserve the maximum stack alignment.  We therefore use a value
   of 0x7ff0 in this case.

   MIPS16e SAVE and RESTORE instructions can adjust the stack pointer by
   up to 0x7f8 bytes and can usually save or restore all the registers
   that we need to save or restore.  (Note that we can only use these
   instructions for o32, for which the stack alignment is 8 bytes.)

   We use a maximum gap of 0x100 or 0x400 for MIPS16 code when SAVE and
   RESTORE are not available.  We can then use unextended instructions
   to save and restore registers, and to allocate and deallocate the top
   part of the frame.  */
#ifndef MIPS_MAX_FIRST_STACK_STEP
#define MIPS_MAX_FIRST_STACK_STEP     \
  (!TARGET_MIPS16 ? 0x7ff0      \
   : GENERATE_MIPS16E_SAVE_RESTORE ? 0x7f8    \
   : TARGET_64BIT ? 0x100 : 0x400)
#endif

#if 1 /* TODO */

enum mips_function_type_tag current_function_type;

typedef struct cheap_rtx_list {
  tree t;
  rtx x;
  int flag;  
  struct cheap_rtx_list *next;
} cheap_rtx_list;

typedef enum mchp_interesting_fn_info_
{
  info_invalid,
  info_I,
  info_O,
  info_O_v,
  info_dbl
} mchp_interesting_fn_info;

typedef enum mchp_conversion_status_
{
  conv_state_unknown,
  conv_possible,
  conv_indeterminate,
  conv_not_possible,
  conv_c =  0x000080,
  conv_d =  0x000100,
  conv_i =  0x000100,
  conv_e =  0x000200,
  conv_E =  0x000400,
  conv_f =  0x000800,
  conv_g =  0x001000,
  conv_G =  0x002000,
  conv_n =  0x004000,
  conv_o =  0x008000,
  conv_p =  0x010000,
  conv_s =  0x020000,
  conv_u =  0x040000,
  conv_x =  0x080000,
  conv_X =  0x100000,
  conv_a =  0x200000,
  conv_A =  0x400000,
  conv_F =  0x800000
} mchp_conversion_status;

typedef struct mchp_intersting_fn_
{
  const char *name;
  const char *map_to;
  mchp_interesting_fn_info conversion_style;
  int interesting_arg;
  unsigned int function_convertable;
  mchp_conversion_status conv_flags;
  char *encoded_name;
} mchp_interesting_fn;

/* The nesting depth of .set noat */
extern struct mips_asm_switch mips_noat;

static HOST_WIDE_INT mchp_interrupt_priority;
static HOST_WIDE_INT mchp_isr_backcompat = 0;

static HOST_WIDE_INT mchp_offset_status = 0;
static HOST_WIDE_INT mchp_offset_epc = 0;
static HOST_WIDE_INT mchp_offset_srsctl = 0;

static HOST_WIDE_INT mchp_invalid_ipl_warning = 0;
HOST_WIDE_INT mchp_pic32_license_valid = MCHP_XCLM_VALID_CPP_FULL;

static void push_cheap_rtx(cheap_rtx_list **l, rtx x, tree t, int flag);
static rtx pop_cheap_rtx(cheap_rtx_list **l, tree *t, int *flag);

static tree mchp_function_interrupt_p (tree decl);
static int mchp_function_naked_p (tree func);
static int mchp_function_persistent_p (tree func);

static int mchp_vector_attribute_compound_expr (tree *node, tree expr,
    bool *no_add_attrs);
int mchp_epilogue_uses (unsigned regno);

static void mchp_output_configuration_words (void);
static void mchp_output_vector_dispatch_table (void);
static int mchp_vector_attribute_compound_expr (tree *node, tree expr,
    bool *no_add_attrs);
inline int
mchp_register_interrupt_context_p (unsigned regno);
static mchp_interesting_fn *mchp_match_conversion_fn(const char *name);
static const char *default_section_name(tree decl, SECTION_FLAGS_INT flags);
static void    mchp_merged_asm_named_section(const char *name,
    SECTION_FLAGS_INT flags);
static char * mchp_get_named_section_flags (const char *pszSectionName,
    SECTION_FLAGS_INT flags);
int set_section_stack(const char *pszSectionName,
                      SECTION_FLAGS_INT pszSectionFlag);
#if 1
void mchp_push_section_name(const char *pszSectionName,
                            SECTION_FLAGS_INT pszSectionFlag);
#endif
#if 1
static tree mchp_push_pop_constant_section(tree decl, enum css push,
    const char **section_name);
static void mchp_pop_section_name(void);
#endif
static tree get_mchp_space_attribute (tree decl);

extern void mips_set_mips16_micromips_mode (int mips16_p, int micromips_p);
extern void mips_for_each_saved_gpr_and_fpr (HOST_WIDE_INT sp_offset, mchp_save_restore_fn fn);
extern void mips_restore_reg (rtx reg, rtx mem);

struct vector_dispatch_spec *vector_dispatch_list_head;

struct mchp_config_specification *mchp_configuration_values;

/* Validate the Microchip-specific command-line options.  */
void
mchp_subtarget_override_options1 (void)
{
  mips_code_readable = CODE_READABLE_PCREL;

  /* If smart-io is explicitly disabled, make the size value 0 */
  if (!TARGET_MCHP_SMARTIO)
    {
      mchp_io_size_val = 0;
    }
  if ((mchp_io_size_val < 0) || (mchp_io_size_val > 2))
    {
      warning (0, "Invalid smart-io level %d, assuming 1", mchp_io_size_val);
      mchp_io_size_val = 1;
    }

  if (TARGET_LEGACY_LIBC || TARGET_LONG_CALLS)
    {
      TARGET_MCHP_SMARTIO = 0;
      mchp_io_size_val = 0;
    }

  /* Don't emit DWARF3/4 unless specifically selected. */
  if (dwarf_strict < 0)
    dwarf_strict = 1;
}

#ifdef MCHP_USE_LICENSE_CONF
/* get a line, and remove any line-ending \n or \r\n */
static char *
get_line (char *buf, size_t n, FILE *fptr)
{
  if (fgets (buf, n, fptr) == NULL)
    return NULL;
  while (buf [strlen (buf) - 1] == '\n'
         || buf [strlen (buf) - 1] == '\r')
    buf [strlen (buf) - 1] = '\0';
  return buf;
}
#endif

#ifndef SKIP_LICENSE_MANAGER

#ifdef MCHP_USE_LICENSE_CONF
#define MCHP_LICENSE_CONF_FILENAME "license.conf"
#define MCHP_LICENSEPATH_MARKER "license_dir"
#endif /* MCHP_USE_LICENSE_CONF */

#ifdef __MINGW32__
#define MCHP_MAX_LICENSEPATH_LINE_LENGTH 1024
#define MCHP_XCLM_FILENAME "xclm.exe"
#else
#define MCHP_XCLM_FILENAME "xclm"
#endif

static char*
get_license_manager_path (void)
{
  extern char **save_argv;
  char *xclmpath = NULL;
  FILE *fptr = NULL;
  struct stat filestat;
  int xclmpath_length;
  
#ifdef MCHP_USE_LICENSE_CONF
  char *conf_dir, *conf_fname;
  FILE *fptr = NULL;
  char line [MCHP_MAX_LICENSEPATH_LINE_LENGTH] = {0};

  /* MCHP_LICENSE_CONF_FILENAME must reside in the same directory as pic32-gcc */
  conf_dir = make_relative_prefix(save_argv[0],
                                  "/pic32mx/bin/gcc/pic32mx/"
                                  str(BUILDING_GCC_MAJOR) "."
                                  str(BUILDING_GCC_MINOR) "."
                                  str(BUILDING_GCC_PATCHLEVEL),
                                  "/bin");

  /* alloc space for the filename: directory + '/' + MCHP_LICENSE_CONF_FILENAME
   */
  conf_fname = (char*)alloca (strlen (conf_dir) + 1 +
                              strlen (MCHP_LICENSE_CONF_FILENAME) + 1);
  strcpy (conf_fname, conf_dir);
  if (conf_fname [strlen (conf_fname) - 1] != '/'
      && conf_fname [strlen (conf_fname) - 1] != '\\')
    strcat (conf_fname, "/");
  strcat (conf_fname, MCHP_LICENSE_CONF_FILENAME);

  if ((fptr = fopen (conf_fname, "rb")) != NULL)
    {
      while (get_line (line, sizeof (line), fptr) != NULL)
        {
          char *pch0, *pch1;
          /* Find the line with the license directory */
          if (strstr (line, MCHP_LICENSEPATH_MARKER))
            {
              /* Find the quoted string on that line */
              pch0 = strchr (line,'"') +1;
              pch1 = strrchr (line,'"');
              if ((pch1-pch0) > 2)
                strncpy (xclmpath, pch0, pch1-pch0);
              break;
            }
        }
      /* Append the xclm executable name to the directory. */
      if (xclmpath [strlen (xclmpath) - 1] != '/'
          && xclmpath [strlen (xclmpath) - 1] != '\\')
        strcat (xclmpath, "/");
      strcat (xclmpath, MCHP_XCLM_FILENAME);

    }
    
  if (fptr != NULL)
    {
      fclose (fptr);
      fptr = NULL;
    }
#endif /* MCHP_USE_LICENSE_CONF */

#ifdef MCHP_USE_LICENSE_CONF
  if (-1 == stat (xclmpath, &filestat))
#endif /* MCHP_USE_LICENSE_CONF */
    {
      /*  Try the compiler bin directory.
       *
       */
      char* bindir = make_relative_prefix(save_argv[0],
                                          "/pic32mx/bin/gcc/pic32mx/"
                                          str(BUILDING_GCC_MAJOR) "."
                                          str(BUILDING_GCC_MINOR) "."
                                          str(BUILDING_GCC_PATCHLEVEL),
                                          "/bin");
      xclmpath_length = strlen(bindir) + strlen(MCHP_XCLM_FILENAME);
      xclmpath = (char*)xcalloc(xclmpath_length+1,sizeof(char));
      strncpy (xclmpath, bindir, xclmpath_length);
      /* Append the xclm executable name to the directory. */
      if (xclmpath [strlen (xclmpath) - 1] != '/'
          && xclmpath [strlen (xclmpath) - 1] != '\\')
        strcat (xclmpath, "/");
      strcat (xclmpath, MCHP_XCLM_FILENAME);

      if (-1 == stat (xclmpath, &filestat))
        {
          free (xclmpath);
          /*  Try the old common directory
           */
          xclmpath_length = strlen("/opt/Microchip/xclm/bin") + strlen(MCHP_XCLM_FILENAME);
          xclmpath = (char*)xcalloc(xclmpath_length+1,sizeof(char));
          strncpy (xclmpath, "/opt/Microchip/xclm/bin", xclmpath_length);
          /* Append the xclm executable name to the directory. */
          if (xclmpath [strlen (xclmpath) - 1] != '/'
              && xclmpath [strlen (xclmpath) - 1] != '\\')
            strcat (xclmpath, "/");
          strcat (xclmpath, MCHP_XCLM_FILENAME);
        }
      if (-1 == stat (xclmpath, &filestat))
        {
          /*  Try the build directory
           */
          strncpy (xclmpath, "/build/xc32/xclm/bin", xclmpath_length);
          /* Append the xclm executable name to the directory. */
          if (xclmpath [strlen (xclmpath) - 1] != '/'
              && xclmpath [strlen (xclmpath) - 1] != '\\')
            strcat (xclmpath, "/");
          strcat (xclmpath, MCHP_XCLM_FILENAME);
        }
    }

#if defined(__MINGW32__)
  {
    char *convert;
    convert = xclmpath;
    while (*convert != '\0')
      {
        if (*convert == '\\')
          *convert = '/';
        convert++;
      }
  }
#endif
  if (-1 == stat (xclmpath, &filestat))
    return NULL;

  return xclmpath;
}
#ifdef MCHP_USE_LICENSE_CONF
#undef MCHP_MAX_LICENSEPATH_LINE_LENGTH
#undef MCHP_LICENSE_CONF_FILENAME
#undef MCHP_LICENSEPATH_MARKER
#endif /* MCHP_USE_LICENSE_CONF */
#undef MCHP_XCLM_FILENAME
#endif

#ifdef TARGET_MCHP_PIC32MX
static const char *disabled_option_message = NULL;
static int message_displayed = 0;
static const char *invalid_license = "due to an invalid license";
#define NULLIFY(X,S) \
    if (X) { \
      if ((S != NULL) && (disabled_option_message == NULL)) { \
          disabled_option_message = S; \
          message_displayed++;         \
        } \
    } \
    X
#endif

static int
pic32_get_license (int require_cpp)
{
  /*
   *  On systems where we have a licence manager, call it
   */
#ifdef TARGET_MCHP_PIC32MX

/* Misc. Return Codes */
#define MCHP_XCLM_EXPIRED_DEMO 0x6
#pragma message switch to xclm_public.h

#define PIC32_EXPIRED_LICENSE MCHP_XCLM_EXPIRED_DEMO
#define PIC32_FREE_LICENSE MCHP_XCLM_FREE_LICENSE
#define PIC32_VALID_STANDARD_LICENSE MCHP_XCLM_VALID_STANDARD_LICENSE
#define PIC32_VALID_PRO_LICENSE MCHP_XCLM_VALID_PRO_LICENSE
#define PIC32_NO_CPP_LICENSE MCHP_XCLM_NO_CPP_LICENSE
#define PIC32_VALID_CPP_FREE MCHP_XCLM_VALID_CPP_FREE
#define PIC32_VALID_CPP_FULL MCHP_XCLM_VALID_CPP_FULL
#ifndef SKIP_LICENSE_MANAGER
  {
    char *exec;
#if XCLM_FULL_CHECKOUT
    char kopt[] = "-fcfc";
#else
    char kopt[] = "-checkout";
#endif
    char productc[]   = "swxc32";
    char productcpp[] = "swxcpp32";
    char version[9] = "";
    char date[] = __DATE__;

#if XCLM_FULL_CHECKOUT
    char * args[] = { NULL, NULL, NULL, NULL, NULL, NULL};
#else
    char * args[] = { NULL, NULL, NULL, NULL, NULL};
#endif

    char *err_msg=(char*)"", *err_arg=(char*)"";
    const char *failure = NULL;
    int status = 0;
    int err = 0;
    int major_ver =0, minor_ver=0;
    extern char **save_argv;
    struct stat filestat;

    mchp_pic32_license_valid = 0;

    /* Get the version number string from the entire version string */
    if ((version_string != NULL) && *version_string)
      {
        char *Microchip;
        gcc_assert(strlen(version_string) < 80);
        Microchip = strrchr (version_string, 'v');
        if (Microchip)
          {
            while ((*Microchip) &&
                   ((*Microchip < '0') ||
                    (*Microchip > '9')))
              {
                Microchip++;
              }
            if (*Microchip)
              {
                major_ver = strtol (Microchip, &Microchip, 0);
              }
            if ((*Microchip) &&
                ((*Microchip=='_') || (*Microchip=='.')))
              {
                Microchip++;
                minor_ver = strtol(Microchip, &Microchip, 0);
              }
          }
        snprintf (version, 6, "%d.%02d", major_ver, minor_ver);
      }

    /* Arguments to pass to xclm */
    args[1] = kopt;
    if (require_cpp)
      args[2] = productcpp;
    else
      args[2] = productc;
    args[3] = version;
#if XCLM_FULL_CHECKOUT
    args[4] = date;
#endif
    /* Get a path to the license manager to try */
    exec = get_license_manager_path();

#if MCHP_DEBUG
    fprintf (stderr, "exec: %s\n", exec);
#endif

    if ((exec == NULL) || (-1 == stat (exec, &filestat)))
      {
        /* Set free edition if the license manager isn't available. */
        mchp_pic32_license_valid=PIC32_FREE_LICENSE;
        warning (0, "Could not retrieve compiler license");
        inform (input_location, "Please reinstall the compiler");
      }
    else
      {
        /* Found xclm */
        mchp_pic32_license_valid=-1;
      }

    /* Call xclm to determine the license */
    if (-1 == mchp_pic32_license_valid)
      {
        args[0] = exec;
        failure = pex_one(0, exec, args, "MPLAB XC32 Compiler", 0, 0, &status, &err);

        if (failure != NULL)
          {
            /* Set free edition if the license manager isn't available. */
            /* The free edition disables optimization options without an eval period. */
            mchp_pic32_license_valid=PIC32_FREE_LICENSE;
            warning (0, "Could not retrieve compiler license (%s)", failure);
            inform (input_location, "Please reinstall the compiler");
          }
        else if (WIFEXITED(status))
          {
            mchp_pic32_license_valid = WEXITSTATUS(status);
          }
      }
#if MCHP_DEBUG
    fprintf (stderr, "valid license: %d\n", mchp_pic32_license_valid);
#endif
  }
#endif /* SKIP_LICENSE_MANAGER */
  return mchp_pic32_license_valid;
}

/* Implement OPTIMIZATION_OPTIONS */
/* Set default optimization options.  */
void
pic32_optimization_options (int level ATTRIBUTE_UNUSED, int size ATTRIBUTE_UNUSED)
{
    extern char **save_argv;
  {
    int require_cpp    = 0;
    int disable_O2     = 1;
    int disable_O3     = 1;
    int disable_Os     = 1;
    int disable_mips16 = 1;
    int disable_lto    = 1;
    
    require_cpp = (TARGET_XC32_LIBCPP || (strstr (save_argv[0], "cc1plus")!=NULL));
    mchp_pic32_license_valid = pic32_get_license (require_cpp);

    if ((mchp_pic32_license_valid == PIC32_VALID_PRO_LICENSE) ||
        (mchp_pic32_license_valid == PIC32_VALID_CPP_FULL))
      {
        disable_lto = disable_mips16 = disable_O2 =  disable_O3 = disable_Os = 0;
      }
    else if (mchp_pic32_license_valid == PIC32_VALID_STANDARD_LICENSE)
      {
        disable_O2 = 0;
      }
    if (disable_Os)
      {
        /* Disable -Os optimization(s) */
        /* flag_web and flag_inline_functions already disabled */
        if (optimize_size)
          {
            optimize = 2;
          }
        NULLIFY(optimize_size, "Optimize for size") = 0;
      }
    if (disable_O2)
      {
        int opt1_max;
        /* Disable -O2 optimizations */
        if (optimize > 1)
          {
            NULLIFY(optimize, "Optimization level > 1") = 1;
          }
        NULLIFY(flag_indirect_inlining, "indirect inlining") = 0;
        NULLIFY(flag_thread_jumps, "thread jumps") = 0;
        NULLIFY(flag_crossjumping, "crossjumping") = 0;
        NULLIFY(flag_optimize_sibling_calls, "optimize sibling calls") = 0;
        NULLIFY(flag_cse_follow_jumps, "cse follow jumps") = 0;
        NULLIFY(flag_gcse, "gcse") = 0;
        NULLIFY(flag_expensive_optimizations, "expensive optimizations") = 0;
        NULLIFY(flag_rerun_cse_after_loop, "cse after loop") = 0;
        NULLIFY(flag_caller_saves, "caller saves") = 0;
        NULLIFY(flag_peephole2, "peephole2") = 0;
#ifdef INSN_SCHEDULING
        NULLIFY(flag_schedule_insns, "schedule insns") = 0;
        NULLIFY(flag_schedule_insns_after_reload, "schedule insns after reload") = 0;
#endif
        NULLIFY(flag_regmove, "regmove") = 0;
        NULLIFY(flag_strict_aliasing, "strict aliasing") = 0;
        NULLIFY(flag_strict_overflow, "strict overflow") = 0;
        NULLIFY(flag_reorder_blocks, "reorder blocks") = 0;
        NULLIFY(flag_reorder_functions, "reorder functions") = 0;
        NULLIFY(flag_tree_vrp, "tree vrp") = 0;
        NULLIFY(flag_tree_builtin_call_dce, "tree builtin call dce") = 0;
        NULLIFY(flag_tree_pre, "tree pre") = 0;
        NULLIFY(flag_tree_switch_conversion, "tree switch conversion") = 0;
        NULLIFY(flag_ipa_cp, "ipa cp") = 0;
        NULLIFY(flag_ipa_sra, "ipa sra") = 0;

        /* Just -O1/-O0 optimizations.  */
        opt1_max = (optimize <= 1);
        align_loops = opt1_max;
        align_jumps = opt1_max;
        align_labels = opt1_max;
        align_functions = opt1_max;
      }
    if (disable_O3)
      {
        if (optimize >= 3)
          {
            NULLIFY(optimize, "Optimization level > 2") = 2;
          }
        /* Disable -O3 optimizations */
        NULLIFY(flag_predictive_commoning, "predictive commoning") = 0;
        NULLIFY(flag_inline_functions, "inline functions") = 0;
        NULLIFY(flag_unswitch_loops, "unswitch loops") = 0;
        NULLIFY(flag_gcse_after_reload, "gcse after reload") = 0;
        NULLIFY(flag_tree_vectorize, "tree vectorize") = 0;
        NULLIFY(flag_ipa_cp_clone, "ipa cp clone") = 0;
        flag_ipa_cp = 0;
       }
    if (disable_mips16)
      {
        /* Disable -mips16 and -mips16e */
        if (mips_base_mips16 != 0)
          {
            /* Disable -mips16 and -mips16e */
            NULLIFY(mips_base_mips16, "mips16 mode") = 0;
          }
        if (mips_base_micromips != 0)
          {
            /* Disable -mmicromips */
            NULLIFY(mips_base_micromips, "micromips mode") = 0;
          }
      }
    if (disable_lto)
      {
        NULLIFY(flag_lto, "Link-time optimization") = 0;
        NULLIFY(flag_whopr, "Partitioned link-time optimization") = 0;
        NULLIFY(flag_whole_program, "Whole-program optimizations") = 0;
        NULLIFY(flag_generate_lto, "Link-time optimization") = 0;
      }
  }
#endif
}

void
mchp_subtarget_override_options2 (void)
{
  extern char **save_argv;
  int require_cpp    = 0;
  int disable_O2     = 1;
  int disable_O3     = 1;
  int disable_Os     = 1;
  int disable_mips16 = 1;
  int disable_lto    = 1;

  require_cpp = (TARGET_XC32_LIBCPP || (strstr (save_argv[0], "cc1plus")!=NULL));

#if MCHP_DEBUG
  fprintf (stderr, "save_argv[0] == %s\n", save_argv[0]);
#endif

    if (require_cpp && !((mchp_pic32_license_valid == PIC32_VALID_CPP_FREE) || 
                         (mchp_pic32_license_valid == PIC32_VALID_CPP_FULL)))
      {
        error  ("MPLAB XC32 C++ license not activated");
        inform (input_location, "Visit http://www.microchip.com/MPLABXCcompilers to acquire a "
               "free C++ license");
       }
    if ((mchp_pic32_license_valid == PIC32_VALID_PRO_LICENSE) ||
        (mchp_pic32_license_valid == PIC32_VALID_CPP_FULL))
      {
        disable_lto = disable_mips16 = disable_O2 =  disable_O3 = disable_Os = 0;
      }
    else if (mchp_pic32_license_valid == PIC32_VALID_STANDARD_LICENSE)
      {
        disable_O2 = 0;
      }

#if 1
  if (((optimize_size) || (optimize < 2) || (mips_base_mips16))
   && (TARGET_NO_OVERRIDE_INLINE == 0)) {
    /* 4.5.1 does inlining at -O1, which really isn't always helpful... */
    flag_split_wide_types = 0;

#if 1
    flag_inline_functions = 0;
    flag_no_inline = 1;
    flag_inline_functions_called_once = 0;
    flag_inline_small_functions = 0;
    flag_indirect_inlining = 0;
    flag_tree_loop_optimize = 0;
#endif

    flag_tree_switch_conversion = 0;
    
    flag_tree_parallelize_loops = 0;
    flag_tree_vect_loop_version = 0;
  }
#endif

  /*
   *  On systems where we have a licence manager, call it
   */
#ifdef TARGET_MCHP_PIC32MX
  {
    static int message_purchase_display = 0;

    switch (mchp_pic32_license_valid)
      {
      case PIC32_EXPIRED_LICENSE:
        invalid_license = "because the evaluation period has expired";
        break;
      case PIC32_FREE_LICENSE:
      case PIC32_VALID_CPP_FREE:
        invalid_license = "because the free compiler does not support this feature.";
        break;
      case PIC32_VALID_STANDARD_LICENSE:
        invalid_license = "because this feature requires the MPLAB XC PRO compiler";
        break;
      default:
        invalid_license = "due to an invalid license";
        break;
      }

    if (message_displayed && TARGET_LICENSE_WARNING)
      {
        /* Display a warning for the Standard option first */
        if (disabled_option_message != NULL)
          warning (0,"Compiler option (%s) ignored %s",
                   disabled_option_message, invalid_license);
        disabled_option_message = NULL;
        message_displayed = 0;
        message_purchase_display++;
      }

    if (disable_lto)
      {
        if (optimize_size)
          {
            optimize = 2;
          }
        if (optimize >= 3)
          {
            NULLIFY(optimize, "Optimization level > 2") = 2;
          }
        NULLIFY(optimize_size, "Optimize for size") = 0;
        
        NULLIFY(flag_predictive_commoning, "predictive commoning") = 0;
        NULLIFY(flag_inline_functions, "inline functions") = 0;
        NULLIFY(flag_unswitch_loops, "unswitch loops") = 0;
        NULLIFY(flag_gcse_after_reload, "gcse after reload") = 0;
        NULLIFY(flag_tree_vectorize, "tree vectorize") = 0;
        NULLIFY(flag_ipa_cp_clone, "ipa cp clone") = 0;
        flag_ipa_cp = 0;
        
        NULLIFY(flag_lto, "Link-time optimization") = 0;
        NULLIFY(flag_whopr, "Partitioned link-time optimization") = 0;
        NULLIFY(flag_whole_program, "Whole-program optimizations") = 0;
        NULLIFY(flag_generate_lto, "Link-time optimization") = 0;

        /* Disable -mips16 and -mips16e */
        if (mips_base_mips16 != 0)
          {
            /* Disable -mips16 and -mips16e */
            NULLIFY(mips_base_mips16, "mips16 mode") = 0;
          }

        if (mips_base_micromips != 0)
          {
            /* Disable -mmicromips */
            NULLIFY(mips_base_micromips, "micromips mode") = 0;
          }
      }
    if (message_displayed && TARGET_LICENSE_WARNING)
      {
        /* Now display a warning for the Pro option */
        if (disabled_option_message != NULL)
          warning (0,"Pro Compiler option (%s) ignored %s", disabled_option_message,
                   invalid_license);
        message_purchase_display++;
      }
    if ((message_purchase_display > 0) && (TARGET_LICENSE_WARNING))
      {
        inform (0, "Disable the option or visit http://www.microchip.com/MPLABXCcompilers "
                "to purchase a new MPLAB XC compiler license.");
      }

    if (TARGET_LEGACY_LIBC)
      {
        TARGET_MCHP_SMARTIO = 0;
        mchp_io_size_val = 0;
      }
  }
#undef PIC32_EXPIRED_LICENSE
#undef PIC32_ACADEMIC_LICENSE
#undef PIC32_VALID_STANDARD_LICENSE
#undef PIC32_VALID_PRO_LICENSE
#endif /* TARGET_MCHP_PIC32MX */
}
#if defined(TARGET_MCHP_PIC32MX)
#undef NULLIFY
#endif

#if 0
/* Moved to cci.c */

/* Verify the header record for the configuration data file
 */
static int
verify_configuration_header_record (FILE *fptr)
{
  char header_record[MCHP_CONFIGURATION_HEADER_SIZE + 1];
  /* the first record of the file is a string identifying
     file and its format version number. */
  if (get_line (header_record, MCHP_CONFIGURATION_HEADER_SIZE + 1, fptr)
      == NULL)
    {
      warning (0, "malformed configuration word definition file.");
      return 1;
    }
  /* verify that this file is a daytona configuration word file */
  if (strncmp (header_record, MCHP_CONFIGURATION_HEADER_MARKER,
               sizeof (MCHP_CONFIGURATION_HEADER_MARKER) - 1) != 0)
    {
      warning (0, "malformed configuration word definition file.");
      return 1;
    }
  /* verify that the version number is one we can deal with */
  if (strncmp (header_record + sizeof (MCHP_CONFIGURATION_HEADER_MARKER) - 1,
               MCHP_CONFIGURATION_HEADER_VERSION,
               sizeof (MCHP_CONFIGURATION_HEADER_VERSION) - 1))
    {
      warning (0, "configuration word definition file version mismatch.");
      return 1;
    }
  return 0;
}

/* Load the configuration word definitions from the data file
 */
int
mchp_load_configuration_definition (const char *fname)
{
  int retval = 0;
  FILE *fptr;
  char line [MCHP_MAX_CONFIG_LINE_LENGTH];

  if ((fptr = fopen (fname, "rb")) == NULL)
    return 1;

  if (verify_configuration_header_record (fptr))
    return 1;

  while (get_line (line, sizeof (line), fptr) != NULL)
    {
      /* parsing the file is very straightforward. We check the record
         type and transition our state based on it:

          CWORD       Add a new word to the word list and make it the
                        current word
          SETTING     If there is no current word, diagnostic and abort
                      Add a new setting to the current word and make
                        it the current setting
          VALUE       If there is no current setting, diagnostic and abort
                      Add a new value to the current setting
          other       Diagnostic and abort
        */
      if (!strncmp (MCHP_WORD_MARKER, line, MCHP_WORD_MARKER_LEN))
        {
          struct mchp_config_specification *spec;

          /* This is a fixed length record. we validate the following:
              - total record length
              - delimiters in the expected locations */
          if (strlen (line) != (MCHP_WORD_MARKER_LEN
                                + 24   /* two 8-byte hex value fields */
                                + 2)   /* two ':' delimiters */
              || line [MCHP_WORD_MARKER_LEN + 8] != ':'
              || line [MCHP_WORD_MARKER_LEN + 17] != ':')
            {
              warning (0, "malformed configuration word definition file. bad config word record");
              break;
            }

          spec = (struct mchp_config_specification *)xmalloc (sizeof (struct mchp_config_specification));
          spec->next = mchp_configuration_values;

          spec->word = (struct mchp_config_word *)xcalloc (sizeof (struct mchp_config_word), 1);
          spec->word->address = strtoul (line + MCHP_WORD_MARKER_LEN, NULL, 16);
          spec->word->mask = strtoul (line + MCHP_WORD_MARKER_LEN + 9, NULL, 16);
          spec->word->default_value =
            strtoul (line + MCHP_WORD_MARKER_LEN + 18, NULL, 16);

          /* initialize the value to the default with no bits referenced */
          spec->value = spec->word->default_value;
          spec->referenced_bits = 0;

          mchp_configuration_values = spec;
        }
      else if (!strncmp (MCHP_SETTING_MARKER, line, MCHP_SETTING_MARKER_LEN))
        {
          struct mchp_config_setting *setting;
          size_t len;

          if (!mchp_configuration_values)
            {
              warning (0, "malformed configuration word definition file. setting record without preceding word record");
              break;
            }

          /* Validate the fixed length portion of the record by checking
             that the record length is >= the size of the minimum valid
             record (empty description and one character name) and that the
             ':' delimiter following the mask is present. */
          if (strlen (line) < (MCHP_SETTING_MARKER_LEN
                               + 8     /* 8-byte hex mask field */
                               + 2     /* two ':' delimiters */
                               + 1)    /* non-empty setting name */
              || line [MCHP_SETTING_MARKER_LEN + 8] != ':')
            {
              warning (0, "malformed configuration word definition file. bad setting record");
              break;
            }

          setting = (struct mchp_config_setting *)xcalloc (sizeof (struct mchp_config_setting), 1);
          setting->next = mchp_configuration_values->word->settings;

          setting->mask = strtoul (line + MCHP_SETTING_MARKER_LEN, NULL, 16);
          len = strcspn (line + MCHP_SETTING_MARKER_LEN + 9, ":");
          /* Validate that the name is not empty */
          if (len == 0)
            {
              warning (0, "malformed configuration word definition file. bad setting record");
              break;
            }
          setting->name = (char*)xmalloc (len + 1);
          strncpy (setting->name, line + MCHP_SETTING_MARKER_LEN + 9, len);
          setting->name [len] = '\0';
          setting->description =
            (char*)xmalloc (strlen (line + MCHP_SETTING_MARKER_LEN + len + 10) + 2);
          strcpy (setting->description,
                  line + MCHP_SETTING_MARKER_LEN + len + 10);

          mchp_configuration_values->word->settings = setting;
        }
      else if (!strncmp (MCHP_VALUE_MARKER, line, MCHP_VALUE_MARKER_LEN))
        {
          struct mchp_config_value *value;
          size_t len;
          if (!mchp_configuration_values
              || !mchp_configuration_values->word->settings)
            {
              warning (0, "malformed configuration word definition file.");
              break;
            }
          /* Validate the fixed length portion of the record by checking
             that the record length is >= the size of the minimum valid
             record (empty description and one character name) and that the
             ':' delimiter following the mask is present. */
          if (strlen (line) < (MCHP_VALUE_MARKER_LEN
                               + 8     /* 8-byte hex mask field */
                               + 2     /* two ':' delimiters */
                               + 1)    /* non-empty setting name */
              || line [MCHP_VALUE_MARKER_LEN + 8] != ':')
            {
              warning (0, "malformed configuration word definition file. bad value record");
              break;
            }

          value = (struct mchp_config_value *)xcalloc (sizeof (struct mchp_config_value), 1);
          value->next = mchp_configuration_values->word->settings->values;

          value->value = strtoul (line + MCHP_VALUE_MARKER_LEN, NULL, 16);
          len = strcspn (line + MCHP_VALUE_MARKER_LEN + 9, ":");
          /* Validate that the name is not empty */
          if (len == 0)
            {
              warning (0, "malformed configuration word definition file. bad setting record");
              break;
            }
          value->name = (char*)xmalloc (len + 1);
          strncpy (value->name, line + MCHP_VALUE_MARKER_LEN + 9, len);
          value->name [len] = '\0';
          value->description =
            (char*)xmalloc (strlen (line + MCHP_VALUE_MARKER_LEN + len + 10) + 2);
          strcpy (value->description,
                  line + MCHP_VALUE_MARKER_LEN + len + 10);

          mchp_configuration_values->word->settings->values = value;
        }
      else
        {
          warning (0, "malformed configuration word definition file.");
          break;
        }
    }
  /* if we didn't exit the loop because of end of file, we have an
     error of some sort. */
  if (!feof (fptr))
    {
      warning (0, "malformed configuration word definition file.");
      retval = 1;
    }


  fclose (fptr);
  return retval;
}

void
mchp_handle_configuration_setting (const char *name, const unsigned char *value_name)
{
  struct mchp_config_specification *spec;

  /* Look up setting in the definitions for the configuration words */
  for (spec = mchp_configuration_values ; spec ; spec = spec->next)
    {
      struct mchp_config_setting *setting;
      for (setting = spec->word->settings ; setting ; setting = setting->next)
        {
          if (strcmp (setting->name, name) == 0)
            {
              struct mchp_config_value *value;

              /* If we've already specified this setting, that's an
                 error, even if the new value and the old value match */
              if (spec->referenced_bits & setting->mask)
                {
                  error ("multiple definitions for configuration setting '%s'",
                         name);
                  return;
                }

              /* look up the value */
              for (value = setting->values ;
                   value ;
                   value = value->next)
                {
                  if (strcmp (value->name, (const char*)value_name) == 0)
                    {
                      /* mark this setting as having been specified */
                      spec->referenced_bits |= setting->mask;
                      /* update the value of the word with the value
                         indicated */
                      spec->value = (spec->value & ~setting->mask)
                                    | value->value;
                      return;
                    }
                }
              /* If we got here, we didn't match the value name */
              error ("unknown value for configuration setting '%s': '%s'",
                     name, value_name);
              return;
            }
        }
    }
  /* if we got here, we didn't find the setting, which is an error */
  error ("unknown configuration setting: '%s'", name);
}

#endif /* Moved to cci */

static void
mchp_output_configuration_words (void)
{
  struct mchp_config_specification *spec;

  fputs ("# MCHP configuration words\n", asm_out_file);

  for (spec = mchp_configuration_values ; spec ; spec = spec->next)
    {
      /* if there are referenced bits in the word, output its value */
      if (spec->referenced_bits)
        {
          fprintf (asm_out_file, "# Configuration word @ 0x%08x\n", spec->word->address);
          fprintf (asm_out_file, "\t.section\t.config_%08X, code\n",
                   spec->word->address);
          fprintf (asm_out_file, "\t.type\t__config_%08X, @object\n",
                   spec->word->address);
          fprintf (asm_out_file, "\t.size\t__config_%08X, 4\n",
                   spec->word->address);
          fprintf (asm_out_file, "__config_%08X:\n", spec->word->address);
          fprintf (asm_out_file, "\t.word\t%u\n", spec->value);
        }
    }
}

void mchp_file_end (void)
{
  mchp_output_vector_dispatch_table();
  mchp_output_configuration_words ();
}


/* Callback when a vector attribute is recognized. 'node' points
   to the node to which the attribute is applied (which may not be a DECL).
   If it is a decl, we modify in place, otherwise we need to create a copy
   for any changes. 'name' is the identifier node specifying the attribute.
   'args' is a TREE_LIST of the arguments to the attribute. 'flags' gives
   us context information. We use 'no_add_attrs' to indicate whether the
   attribute should be added to the decl/type or not; in this case, we
   never want to keep the attribute since it's just an indicator to us to
   add the vector.

   Return is NULL_TREE since we're not modifying the attribute for other
   decls/types */
tree
mchp_vector_attribute (tree *node, tree name ATTRIBUTE_UNUSED, tree args,
                       int flags ATTRIBUTE_UNUSED, bool *no_add_attrs)
{
  tree decl = *node;
  /* If this attribute isn't on the actual function declaration, we
     ignore it */
  if (TREE_CODE (decl) != FUNCTION_DECL)
    return NULL_TREE;

  /* The vector attribute has a comma delimited list of vector #'s as
     arguments. At least one must be present. */
  gcc_assert (args);
  while (args)
    {
      if (TREE_CODE (TREE_VALUE (args)) == INTEGER_CST)
        {
          /* The argument must be an integer constant between 0 and 63 */
          if ((int)TREE_INT_CST_LOW (TREE_VALUE (args)) < 0 ||
              (int)TREE_INT_CST_LOW (TREE_VALUE (args)) > 63)
            {
              *no_add_attrs = 1;

              error ("Vector number must be an integer between 0 and 63");
              return NULL_TREE;
            }
          /* add the vector to the list of dispatch functions to emit */
          mchp_add_vector_dispatch_entry (
            IDENTIFIER_POINTER (DECL_NAME (*node)),
            (int)TREE_INT_CST_LOW (TREE_VALUE (args)));
        }
      else
        {
          if (TREE_CODE (TREE_VALUE (args)) == COMPOUND_EXPR)
            {
              mchp_vector_attribute_compound_expr (node, TREE_VALUE(args),
                                                   no_add_attrs);
            }
          else
            {
              *no_add_attrs = 1;
              error ("Vector number must be an integer between 0 and 63");
              return NULL_TREE;
            }
        }
      args = TREE_CHAIN (args);
    }

  return NULL_TREE;
}

/* Handles compound expressions within the vector attribute list.
   Called from mchp_vector_attribute(). */
static int
mchp_vector_attribute_compound_expr (tree *node, tree expr,
                                     bool *no_add_attrs)
{
  int len = 0;

  if (expr == NULL_TREE)
    return 0;
  for (; TREE_CODE (expr) == COMPOUND_EXPR; expr = TREE_OPERAND (expr, 1))
    {
      len += mchp_vector_attribute_compound_expr (node, TREE_OPERAND (expr, 0),
             no_add_attrs);
    }
  if (TREE_CODE (expr) == INTEGER_CST)
    {
      /* The argument must be an integer constant between 0 and 63 */
      if ((int)TREE_INT_CST_LOW (expr) < 0 ||
          (int)TREE_INT_CST_LOW (expr) > 63)
        {
          *no_add_attrs = 1;

          error ("Vector number must be an integer between 0 and 63");
          return 0;
        }
      /* add the vector to the list of dispatch functions to emit */
      mchp_add_vector_dispatch_entry (
        IDENTIFIER_POINTER (DECL_NAME (*node)),
        (int)TREE_INT_CST_LOW (expr));
    }
  ++len;
  return len;
}

/* Callback when a vector attribute is recognized. 'node' points
   to the node to which the attribute is applied (which may not be a DECL).
   If it is a decl, we modify in place, otherwise we need to create a copy
   for any changes. 'name' is the identifier node specifying the attribute.
   'args' is a TREE_LIST of the arguments to the attribute. 'flags' gives
   us context information. We use 'no_add_attrs' to indicate whether the
   attribute should be added to the decl/type or not; in this case, we
   never want to keep the attribute since it's just an indicator to us to
   add the vector.

   In effect, this is just a section attribute with a pre-defined section
   name.
   */
tree
mchp_at_vector_attribute (tree *node, tree name ATTRIBUTE_UNUSED, tree args,
                          int flags ATTRIBUTE_UNUSED, bool *no_add_attrs)
{
  tree decl = *node;
  char scn_name[11];

  /* If this attribute isn't on the actual function declaration, we
     ignore it */
  if (TREE_CODE (decl) != FUNCTION_DECL)
    return NULL_TREE;

  if (DECL_SECTION_NAME (decl) != NULL_TREE)
    {
      error ("the 'at_vector' attribute cannot be used with the 'section' attribute");
      *no_add_attrs = true;
      return NULL_TREE;
    }
  /* The argument must be an integer constant between 0 and 63 */
  if (TREE_CODE (TREE_VALUE (args)) != INTEGER_CST ||
      (int)TREE_INT_CST_LOW (TREE_VALUE (args)) < 0 ||
      (int)TREE_INT_CST_LOW (TREE_VALUE (args)) > 63)
    {
      *no_add_attrs = 1;

      error ("Interrupt vector number must be an integer between 0 and 63");
      return NULL_TREE;
    }
  /* now mark the decl as going into the section for the indicated vector */
  sprintf (scn_name, ".vector_%d", (int)TREE_INT_CST_LOW (TREE_VALUE (args)));
  DECL_SECTION_NAME (decl) = build_string (strlen (scn_name), scn_name);

  return NULL_TREE;
}


static void
mchp_output_vector_dispatch_table (void)
{
  struct vector_dispatch_spec *dispatch_entry;

  fputs ("# Begin MCHP vector dispatch table\n", asm_out_file);

  /* output the vector dispatch functions specified in this translation
     unit, if any */
  for (dispatch_entry = vector_dispatch_list_head ;
       dispatch_entry ;
       dispatch_entry = dispatch_entry->next)
    {
      fprintf (asm_out_file, "\t.section\t.vector_%d,code\n",
               dispatch_entry->vector_number);
      fprintf (asm_out_file, "\t.align\t2\n");
      fprintf (asm_out_file, "\t.set\tnomips16\n");
      fprintf (asm_out_file, "\t.ent\t__vector_dispatch_%d\n",
               dispatch_entry->vector_number);
      fprintf (asm_out_file, "__vector_dispatch_%d:\n",
               dispatch_entry->vector_number);
      fprintf (asm_out_file, "\tj\t%s\n", dispatch_entry->target);
      fprintf (asm_out_file, "\t.end\t__vector_dispatch_%d\n",
               dispatch_entry->vector_number);
      fprintf (asm_out_file, "\t.size\t__vector_dispatch_%d, .-"
               "__vector_dispatch_%d\n",
               dispatch_entry->vector_number,
               dispatch_entry->vector_number);
    }
  fputs ("# End MCHP vector dispatch table\n", asm_out_file);
}

struct interrupt_pragma_spec *interrupt_pragma_list_head;

/* Called when a decl is being created.

   This allows us to add attributes based on pragmas or other target
   specific stuff. In this case, we want to apply the interrupt attribute
   to decls of functions specified as interrupts via #pragma. If the
   handler function was specified to reside at the vector address, we
   will also apply a section attribute to the function to do that. */
void
mchp_target_insert_attributes (tree decl, tree *attr_ptr)
{
  if (TREE_CODE (decl) == FUNCTION_DECL)
    {
      const char *fname;
      struct interrupt_pragma_spec *p;

      /* Determine if an interrupt pragma is around for this function */
      fname = IDENTIFIER_POINTER (DECL_NAME (decl));
      gcc_assert (fname);
      for (p = interrupt_pragma_list_head ;
           p && strcmp (p->name, fname) ;
           p = p->next)
        ;
      /* if p != NULL, we have a match */
      if (p)
        {
          /* Apply the interrupt attribute to the decl.

             The attribute list is a TREE_LIST. We need to create a new
             TREE_LIST node with the existing attribute list as its
             TREE_CHAIN entry.

             The attribute itself has the purpose field being the name
             of the attribute and the parameters of the attribute being
             another TREE_LIST as the value of the attribute tree.  */
          *attr_ptr = tree_cons (get_identifier ("interrupt"),
                                 build_tree_list (NULL_TREE, p->ipl),
                                 *attr_ptr);
          /* If the interrupt goes directly at the vector address,
             add a section attribute to the function to place it in the
             dedicated vector section */
          if (p->vect_number)
            {
              char scn_name[11];
              gcc_assert (p->vect_number < 64);
              sprintf (scn_name, ".vector_%d", p->vect_number);
              *attr_ptr = tree_cons (get_identifier ("section"),
                                     build_tree_list (NULL_TREE,
                                                      build_string (strlen (scn_name), scn_name)),
                                     *attr_ptr);
            }
        }
    }
}

void
mchp_prepare_function_start (tree fndecl)
{
  tree x;

  if (!fndecl)
    return;

  /* Get the DECL of the top-most enclosing function. */
  /* XXX do we still need to do this? */
  while ((x = decl_function_context (fndecl)))
    fndecl = x;

  /* mips_set_mips16_mode (SYMBOL_REF_MIPS16_P (XEXP (DECL_RTL (fndecl), 0))); */

#ifdef TARGET_MCHP_PIC32MX
  /* If we're in MIPS16[e] mode for an interrupt function, that's an error */
  mchp_function_interrupt_p (fndecl);
  if ((current_function_type != NON_INTERRUPT) && TARGET_MIPS16)
    {
      warning (0, "interrupt handler functions cannot be mips16, "
               "assuming nomips16 attribute");
      mips_set_mips16_micromips_mode (0,0);
    }
#endif
}
/* Check if the interrupt attribute is set for a function. If it is, return
   the IPL identifier, else NULL */

static tree
mchp_function_interrupt_p (tree decl)
{
  tree attrlist = TYPE_ATTRIBUTES(TREE_TYPE(decl));
  tree attr;
  attr = lookup_attribute ("interrupt", attrlist);
  if (attr)
    {
      /* Behavior for default (unspecified) IPL value */
      if ((TREE_VALUE(attr)) == NULL )
        {
          cfun->machine->current_function_type = current_function_type = DEFAULT_CONTEXT_SAVE;
          mchp_interrupt_priority = -1;
          cfun->machine->interrupt_priority = -1;
        }
      else
        {
          current_function_type = UNKNOWN_CONTEXT_SAVE;
        }
      attr = TREE_VALUE (attr);
    }
  else
    {
      current_function_type = NON_INTERRUPT;
    }
  return attr;
}

static int ignore_attribute(const char *attribute, const char *attached_to,
                            tree node)
{
  tree scope;

  if (TREE_CODE(node) == PARM_DECL)
    {
      warning(0, "ignoring %s attribute applied to parameter %s", attribute,
              attached_to);
      return 1;
    }
  else if (TREE_CODE(node) == FIELD_DECL)
    {
      warning(0, "ignoring %s attribute applied to member %s", attribute,
              attached_to);
      return 1;
    }

  /* DECL_CONTEXT is not set up by the time we process the attributes */
  scope = current_function_decl;

  if (scope && (TREE_CODE(scope) == FUNCTION_DECL) &&
      (!TREE_STATIC(node)) &&
      ((TREE_CODE(node) != VAR_DECL) || !TREE_PUBLIC(node)))
    {
      warning(0, "ignoring %s attribute applied to automatic %s", attribute,
              attached_to);
      return 1;
    }
  return 0;
}

/* Callback when an interrupt attribute is recognized. 'node' points
   to the node to which the attribute is applied (which may not be a DECL).
   If it is a decl, we modify in place, otherwise we need to create a copy
   for any changes. 'name' is the identifier node specifying the attribute.
   'args' is a TREE_LIST of the arguments to the attribute. 'flags' gives
   us context information. We use 'no_add_attrs' to indicate whether the
   attribute should be added to the decl/type or not; in this case, on error.

   Return is NULL_TREE since we're not modifying the attribute for other
   decls/types */
tree
mchp_interrupt_attribute (tree *node ATTRIBUTE_UNUSED,
                          tree name ATTRIBUTE_UNUSED, tree args,
                          int flags ATTRIBUTE_UNUSED, bool *no_add_attrs)
{
  /* we want to validate that the argument isn't bogus. There should
     be one and only one argument in the args TREE_LIST and it should
     be an identifier of the form "ipl[0-7]". */

  /* we can assert one argument since that should be enforced by
     the parser from the attribute table */

  if (args == NULL)
    {
      return NULL_TREE;
    }

  gcc_assert (TREE_CHAIN (args) == NULL);

  if (TREE_CODE (TREE_VALUE (args)) != IDENTIFIER_NODE
      || (((strcmp ("single", IDENTIFIER_POINTER (TREE_VALUE (args))) != 0)
           && (strcmp ("SINGLE", IDENTIFIER_POINTER (TREE_VALUE (args))) != 0)
           && (strcmp ("ripl", IDENTIFIER_POINTER (TREE_VALUE (args))) != 0)
           && (strcmp ("RIPL", IDENTIFIER_POINTER (TREE_VALUE (args))) != 0))
          && (((strncmp ("ipl", IDENTIFIER_POINTER (TREE_VALUE (args)),3) != 0)
               && (strncmp ("IPL", IDENTIFIER_POINTER (TREE_VALUE(args)),3)!= 0))
              || (IDENTIFIER_POINTER (TREE_VALUE (args))[3] > '7')
              || (IDENTIFIER_POINTER (TREE_VALUE (args))[3] < '0'))))
    {
      error ("Interrupt priority must be specified as 'single' or 'IPLn[AUTO|SOFT|SRS]', "
             "where n is in the range of 0..7, inclusive.");
      *no_add_attrs = 1;
      return NULL_TREE;
    }

  return NULL_TREE;
}


/*
** Return nonzero if IDENTIFIER is a valid attribute.
*/
tree mchp_address_attribute(tree *decl, tree identifier ATTRIBUTE_UNUSED,
                            tree args, int flags ATTRIBUTE_UNUSED,
                            bool *no_add_attrs)
{
  const char *attached_to = 0;
  if (args == NULL)
    {
      return NULL_TREE;
    }

  if (DECL_P(*decl))
    {
      attached_to = IDENTIFIER_POINTER(DECL_NAME(*decl));
    }

  /* we can assert one argument since that should be enforced by
     the parser from the attribute table */

  gcc_assert (TREE_CHAIN (args) == NULL);

  if (DECL_P(*decl))
    {
      tree address;

      if (ignore_attribute("address", attached_to, *decl))
        {
          *no_add_attrs = 1;
          return NULL_TREE;
        }
      address = TREE_VALUE(args);
      if (TREE_CODE(address) != INTEGER_CST)
        {
          error("invalid address argument for '%s'", attached_to);
          *no_add_attrs = 1;
        }
      else
        /* currently the assembler will not accept an unaligned address */
        if (TREE_INT_CST_LOW(address) % 4)
          {
            warning(0, "invalid address argument for '%s'", attached_to);
            warning(0, "unaligned addresses are not yet permitted, ignoring attribute");
            *no_add_attrs = 1;
          }

    }

  return NULL_TREE;
}


/*
** Return nonzero if IDENTIFIER is a valid attribute.
*/
tree mchp_unsupported_attribute(tree *node, tree identifier ATTRIBUTE_UNUSED,
                                tree args, int flags ATTRIBUTE_UNUSED,
                                bool *no_add_attrs)
{
  tree type = NULL_TREE;
  int warn = 0;
  tree what = NULL_TREE;
  const char *attached_to = 0;

  if (DECL_P(*node))
    {
      attached_to = IDENTIFIER_POINTER(DECL_NAME(*node));
    }

  if (!args)
    *no_add_attrs = true;
  else if (TREE_CODE (TREE_VALUE (args)) != STRING_CST)
    {
      error("invalid argument to 'unsupported' attribute applied to '%s',"
            " literal string expected", attached_to);
      *no_add_attrs = true;
    }

  if (DECL_P (*node))
    {
      tree decl = *node;
      type = TREE_TYPE (decl);

      if (TREE_CODE (decl) == TYPE_DECL
          || TREE_CODE (decl) == PARM_DECL
          || TREE_CODE (decl) == VAR_DECL
          || TREE_CODE (decl) == FUNCTION_DECL
          || TREE_CODE (decl) == FIELD_DECL)
        TREE_DEPRECATED (decl) = 1;
      else
        warn = 1;
    }
  else if (TYPE_P (*node))
    {
      if (!(flags & (int) ATTR_FLAG_TYPE_IN_PLACE))
        *node = build_variant_type_copy (*node);
      TREE_DEPRECATED (*node) = 1;
      type = *node;
    }
  else
    warn = 1;

  if (warn)
    {
      *no_add_attrs = true;
      if (type && TYPE_NAME (type))
        {
          if (TREE_CODE (TYPE_NAME (type)) == IDENTIFIER_NODE)
            what = TYPE_NAME (*node);
          else if (TREE_CODE (TYPE_NAME (type)) == TYPE_DECL
                   && DECL_NAME (TYPE_NAME (type)))
            what = DECL_NAME (TYPE_NAME (type));
        }
      if (what)
        warning (OPT_Wattributes, "%qE attribute ignored for %qE", identifier, what);
      else
        warning (OPT_Wattributes, "%qE attribute ignored", identifier);
    }

  return NULL_TREE;
}

/*
** Return nonzero if IDENTIFIER is a valid space attribute.
*/
tree mchp_space_attribute(tree *decl, tree identifier ATTRIBUTE_UNUSED,
                          tree args, int flags ATTRIBUTE_UNUSED,
                          bool *no_add_attrs)
{
  const char *attached_to = 0;
  const char *ident = NULL
                      ;
  if (args == NULL)
    {
      return NULL_TREE;
    }

  if (DECL_P(*decl))
    {
      attached_to = IDENTIFIER_POINTER(DECL_NAME(*decl));
    }

  /* we can assert one argument since that should be enforced by
     the parser from the attribute table */

  gcc_assert (TREE_CHAIN (args) == NULL);

  ident = IDENTIFIER_POINTER(DECL_NAME(*decl));

  if (DECL_P(*decl))
    {
      tree space;

      if (ignore_attribute("space", attached_to, *decl))
        {
          *no_add_attrs = 1;
          return NULL_TREE;
        }
      space = lookup_attribute("space",
                               DECL_ATTRIBUTES(*decl));

      if (space)
        {
          warning(0, "ignoring previous space attribute");
        }
      if (TREE_CODE(*decl) == FUNCTION_DECL)
        {
          warning (0, "space attribute does not apply to functions");
        }
      if (TREE_VALUE(args) == get_identifier("prog"))
        {
          return space;
        }
      else if (TREE_VALUE(args) == get_identifier("data"))
        {
          return space;
        }
      else if ((TREE_VALUE(args) == get_identifier("psv")) ||
               (TREE_VALUE(args) == get_identifier("auto_psv")))
        {
          /* Accept for C30 compatibility */
          warning (0, "Ignoring unavailable space(psv) attribute for '%s'. ", ident);
          inform (input_location, "Suggest space(prog) for this device instead.");
          TREE_VALUE(args) = get_identifier("prog");
          return NULL_TREE;
        }
    }
  if (TYPE_P(*decl))
    {
      if (TREE_VALUE(args) == get_identifier("prog"))
        {
          return NULL_TREE;
        }
      else if (TREE_VALUE(args) == get_identifier("data"))
        {
          return NULL_TREE;
        }
      else if ((TREE_VALUE(args) == get_identifier("psv")) ||
               (TREE_VALUE(args) == get_identifier("auto_psv")))
        {
          /* Accept for C30 compatibility */
          warning (0, "Ignoring unavailable space(psv) attribute for '%s'. ", ident);
          inform (input_location, "Suggest space(prog) for this device instead.");
          TREE_VALUE(args) = get_identifier("prog");
          return NULL_TREE;
        }
    }
  warning (0, "invalid space argument for '%s', ignoring attribute", attached_to);
  *no_add_attrs = 1;
  return NULL_TREE;
}

/* Don't emit a function prologue. */
bool
mchp_suppress_prologue (void)
{
  /* if this function is specified as a naked function, just return without
     expanding any code */
  if (mchp_function_naked_p (current_function_decl))
    {
      return true;
    }
  return false;
}

/* Don't emit a function epilogue. */
bool
mchp_suppress_epilogue(void)
{
  /* if this function is specified as a naked function, just return without
     expanding any code */
  if (mchp_function_naked_p (current_function_decl))
    {
      return true;
    }
  return false;
}

void
mchp_expand_epilogue_return(rtx ret_insn)
{
  if (current_function_type == NON_INTERRUPT)
    {
      emit_jump_insn (ret_insn);
    }
  /* interrupt functions need to emit a placeholder instruction
     so that this pattern will return a non-empty expansion.
     we don't want anything below this (there shouldn't be any
     RTL following this, anyway) moved above it, so we'll use a
     blockage. */
  else
    {
      emit_insn (gen_blockage ());
    }
}

/* Expand the prologue into a bunch of separate insns at the end of the prologue.  */
void
mchp_expand_prologue_end (const struct mips_frame_info *frame)
{
  if ((current_function_type == AUTO_CONTEXT_SAVE) ||
      ((current_function_type != NON_INTERRUPT) && frame->has_hilo_context))
    {
      /* Don't allow instructions from the function to be moved into the
         software context saving code. */
      emit_insn (gen_blockage ());
    }
}

void
mchp_expand_epilogue_restoreregs (HOST_WIDE_INT step1 ATTRIBUTE_UNUSED,
                                  HOST_WIDE_INT step2)
{
  const struct mips_frame_info *frame;
  int savecount = 0;
  unsigned int regno;

  HOST_WIDE_INT mchp_save_srsctl;
  mchp_save_srsctl = (((cfun->machine->interrupt_priority < 7)
                       && (0 == mchp_isr_backcompat))
                      || (current_function_type == AUTO_CONTEXT_SAVE)
                      || (current_function_type == DEFAULT_CONTEXT_SAVE));

  frame = &cfun->machine->frame;
  cfun->machine->frame.savedgpr = 0;

  if (GENERATE_MIPS16E_SAVE_RESTORE && frame->mask != 0)
    {
      unsigned int mask;
      HOST_WIDE_INT offset;
      rtx restore;

      /* Generate the restore instruction.  */
      mask = frame->mask;
      restore = mips16e_build_save_restore (true, &mask, &offset, 0, step2);

      /* Restore any other registers manually.  */
      for (regno = GP_REG_FIRST; regno < GP_REG_LAST; regno++)
        if (BITSET_P (mask, regno - GP_REG_FIRST))
          {
            offset -= UNITS_PER_WORD;
            mips_save_restore_reg (word_mode, regno, offset, mips_restore_reg);
          }

      /* Restore the remaining registers and deallocate the final bit
      of the frame.  */
      emit_insn (restore);
    }
  else
    {
      if (cfun->machine->interrupt_handler_p)
        {
          HOST_WIDE_INT offset;
          rtx mem;

          emit_insn (gen_blockage ());

          offset = frame->cop0_sp_offset - (frame->total_size - step2);

          if (SOFTWARE_CONTEXT_SAVE == cfun->machine->current_function_type)
            {
              /* Restore the registers.  */
              mips_for_each_saved_acc (frame->total_size - step2, mips_restore_reg);
              mips_for_each_saved_gpr_and_fpr (frame->total_size - step2,
                                               mips_restore_reg);
              if (!cfun->machine->keep_interrupts_masked_p
                  && (cfun->machine->interrupt_priority < 7))
                {
                  /* Load the original EPC.  */
                  gcc_assert (mchp_offset_epc != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_epc));
                  mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }

              /* Load the original Status.  */
              gcc_assert (mchp_offset_status >= 0);
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx, mchp_offset_status));
              mips_emit_move (gen_rtx_REG (word_mode, K1_REG_NUM), mem);
              offset -= UNITS_PER_WORD;

              if (!cfun->machine->keep_interrupts_masked_p
                  && (cfun->machine->interrupt_priority < 7))
                {
                  /* Restore the original EPC.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_EPC_REG_NUM),
                                            gen_rtx_REG (SImode, K0_REG_NUM)));
                }

              if (mchp_save_srsctl)
                {
                  /* Load the original SRSCTL.  */
                  gcc_assert (mchp_offset_srsctl != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
                  mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }
              /* If we don't use shadow register set, we need to update SP.  */
              if (step2 > 0)
                {
                  emit_insn (gen_add3_insn (stack_pointer_rtx,
                                            stack_pointer_rtx,
                                            GEN_INT (step2)));
                }

              if (mchp_save_srsctl)
                {
                  /* Restore previously loaded SRSCTL.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_SRSCTL_REG_NUM),
                                            gen_rtx_REG (SImode, K0_REG_NUM)));
                }
              emit_insn (gen_mips_wrpgpr (stack_pointer_rtx, stack_pointer_rtx));
              /* Restore previously loaded Status.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_STATUS_REG_NUM),
                                        gen_rtx_REG (SImode, K1_REG_NUM)));

            } /* SOFTWARE_CONTEXT_SAVE */

          else if (SRS_CONTEXT_SAVE == cfun->machine->current_function_type)
            {
              gcc_assert (true == cfun->machine->use_shadow_register_set_p);
              /* Restore the registers.  */
              mips_for_each_saved_acc (frame->total_size - step2, mips_restore_reg);
              mips_for_each_saved_gpr_and_fpr (frame->total_size - step2,
                                               mips_restore_reg);
              if (7 == cfun->machine->interrupt_priority)
                {
                  if (mchp_save_srsctl)
                    {
                      /* Load the original SRSCTL.  */
                      /* Since we are in IPL7, we can use K0/K1 without executing a DI first. */
                      gcc_assert (mchp_offset_srsctl != 0);
                      mem = gen_frame_mem (word_mode,
                                           plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
                      mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                      offset -= UNITS_PER_WORD;
                    }
                  /* Load the original Status.  */
                  gcc_assert (mchp_offset_status != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_status));
                  mips_emit_move (gen_rtx_REG (word_mode, K1_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }
              /* We will insert a DI here later. */
              if (cfun->machine->interrupt_priority < 7)
                {
                  if (mchp_save_srsctl)
                    {
                      /* Load the original SRSCTL to K1.  */
                      gcc_assert (mchp_offset_srsctl != 0);
                      mem = gen_frame_mem (word_mode,
                                           plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
                      mips_emit_move (gen_rtx_REG (word_mode, K1_REG_NUM), mem);
                      offset -= UNITS_PER_WORD;
                    }
                  if (!cfun->machine->keep_interrupts_masked_p)
                    {
                      /* Load the original EPC to K0.  */
                      gcc_assert (mchp_offset_epc != 0);
                      mem = gen_frame_mem (word_mode,
                                           plus_constant (stack_pointer_rtx, mchp_offset_epc));
                      mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                      offset -= UNITS_PER_WORD;
                    }
                  if (mchp_save_srsctl)
                    {
                      /* Restore previously loaded SRSCTL.  */
                      emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_SRSCTL_REG_NUM),
                                                gen_rtx_REG (SImode, K1_REG_NUM)));
                    }
                  /* Load the original Status.  */
                  gcc_assert (mchp_offset_status != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_status));
                  mips_emit_move (gen_rtx_REG (word_mode, K1_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                  if (!cfun->machine->keep_interrupts_masked_p)
                    {
                      /* Restore the original EPC.  */
                      emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_EPC_REG_NUM),
                                                gen_rtx_REG (SImode, K0_REG_NUM)));
                    }
                }
              else /* (interrupt_priority == 7) */
                {
                  /* Do not preserve EPC for IPL7 */
                  /* k1 already holds STATUS */
                  /* k0 already holds SRSCTL */
                  if (mchp_save_srsctl)
                    {
                      /* Restore the original SRSCTL, which was loaded into $k0 above. */
                      emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_SRSCTL_REG_NUM),
                                                gen_rtx_REG (SImode, K0_REG_NUM)));
                    }
                }
              /* Update SP.  */
              if (step2 > 0)
                {
                  emit_insn (gen_add3_insn (stack_pointer_rtx,
                                            stack_pointer_rtx,
                                            GEN_INT (step2)));
                }
              emit_insn (gen_mips_wrpgpr (stack_pointer_rtx, stack_pointer_rtx));
              /* Restore previously loaded Status.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_STATUS_REG_NUM),
                                        gen_rtx_REG (SImode, K1_REG_NUM)));
            } /* SRS_CONTEXT_SAVE */
          else if (AUTO_CONTEXT_SAVE == cfun->machine->current_function_type)
            {
              rtx skip_save_label;
              rtx do_save_label;
              rtx jumpskip;
              rtx cond;

              /* Restore the registers.  */
              mips_for_each_saved_acc (frame->total_size - step2, mips_restore_reg);

              /* Load the original SRSCTL.  */
              gcc_assert (mchp_offset_srsctl != 0);
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
              mips_emit_move (gen_rtx_REG (word_mode, V0_REGNUM), mem);
              emit_insn (gen_andsi3 (gen_rtx_REG (SImode, V0_REGNUM),
                                     gen_rtx_REG (SImode, V0_REGNUM), GEN_INT((unsigned)0x0F) ));
              do_save_label = gen_label_rtx ();
              skip_save_label = gen_label_rtx ();

              cond = gen_rtx_NE(SImode,gen_rtx_REG(SImode, V0_REGNUM),const0_rtx);
              jumpskip =  emit_jump_insn (gen_condjump (cond, skip_save_label));
              JUMP_LABEL (jumpskip) = skip_save_label;

              JUMP_LABEL (jumpskip) = skip_save_label;
              LABEL_NUSES (skip_save_label) = 1;

              emit_label (do_save_label);
              mips_for_each_saved_gpr_and_fpr (frame->total_size - step2,
                                               mips_restore_reg);
              emit_label (skip_save_label);

              if (!cfun->machine->keep_interrupts_masked_p
                  && (cfun->machine->interrupt_priority < 7))
                {
                  /* Load the original EPC.  */
                  gcc_assert (mchp_offset_epc != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_epc));
                  mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }

              /* Load the original Status.  */
              gcc_assert (mchp_offset_status != 0);
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx, mchp_offset_status));
              mips_emit_move (gen_rtx_REG (word_mode, K1_REG_NUM), mem);
              offset -= UNITS_PER_WORD;

              if (!cfun->machine->keep_interrupts_masked_p
                  && (cfun->machine->interrupt_priority < 7))
                {
                  /* Restore the original EPC.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_EPC_REG_NUM),
                                            gen_rtx_REG (SImode, K0_REG_NUM)));
                }

              if (mchp_save_srsctl)
                {
                  /* Load the original SRSCTL.  */
                  gcc_assert (mchp_offset_srsctl != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
                  mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }
              /* we need to update SP.  */
              if (step2 > 0)
                {
                  emit_insn (gen_add3_insn (stack_pointer_rtx,
                                            stack_pointer_rtx,
                                            GEN_INT (step2)));
                }

              if (mchp_save_srsctl)
                {
                  /* Restore previously loaded SRSCTL.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_SRSCTL_REG_NUM),
                                            gen_rtx_REG (SImode, K0_REG_NUM)));
                }
              emit_insn (gen_mips_wrpgpr (stack_pointer_rtx, stack_pointer_rtx));
              /* Restore previously loaded Status.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_STATUS_REG_NUM),
                                        gen_rtx_REG (SImode, K1_REG_NUM)));
            } /* AUTO_CONTEXT_SAVE */
          else if (DEFAULT_CONTEXT_SAVE == cfun->machine->current_function_type)
            {
              /* TODO Determine IPL at runtime */
              rtx skip_save_label;
              rtx do_save_label;
              rtx jumpskip;
              rtx cond;

              /* Restore the registers.  */
              mips_for_each_saved_acc (frame->total_size - step2, mips_restore_reg);

              /* Load the original SRSCTL.  */
              gcc_assert (mchp_offset_srsctl != 0);
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
              mips_emit_move (gen_rtx_REG (word_mode, V0_REGNUM), mem);
              emit_insn (gen_andsi3 (gen_rtx_REG (SImode, V0_REGNUM),
                                     gen_rtx_REG (SImode, V0_REGNUM), GEN_INT((unsigned)0x0F) ));
              do_save_label = gen_label_rtx ();
              skip_save_label = gen_label_rtx ();

              /* Count the number of GP registers to save */
              savecount = 0;
              for (regno = GP_REG_LAST; regno > GP_REG_FIRST; regno--)
                if (BITSET_P (cfun->machine->frame.mask, regno - GP_REG_FIRST))
                  {
                    savecount++;
                  }

              /* Branch over the software context saving only if it will
                 save cycles */
              if (savecount > 3)
                {
                  cond = gen_rtx_NE(SImode,gen_rtx_REG(SImode, V0_REGNUM),const0_rtx);
                  jumpskip =  emit_jump_insn (gen_condjump (cond, skip_save_label));
                  JUMP_LABEL (jumpskip) = skip_save_label;
                }
              LABEL_NUSES (skip_save_label) = 1;

              emit_label (do_save_label);
              mips_for_each_saved_gpr_and_fpr (frame->total_size - step2,
                                               mips_restore_reg);
              emit_label (skip_save_label);

              if (!cfun->machine->keep_interrupts_masked_p
                  && (cfun->machine->interrupt_priority < 7))
                {
                  /* Load the original EPC.  */
                  gcc_assert (mchp_offset_epc != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_epc));
                  mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }

              /* Load the original Status.  */
              gcc_assert (mchp_offset_status != 0);
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx, mchp_offset_status));
              mips_emit_move (gen_rtx_REG (word_mode, K1_REG_NUM), mem);
              offset -= UNITS_PER_WORD;

              if (!cfun->machine->keep_interrupts_masked_p
                  && (cfun->machine->interrupt_priority < 7))
                {
                  /* Restore the original EPC.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_EPC_REG_NUM),
                                            gen_rtx_REG (SImode, K0_REG_NUM)));
                }

              if (mchp_save_srsctl)
                {
                  /* Load the original SRSCTL.  */
                  gcc_assert (mchp_offset_srsctl != 0);
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx, mchp_offset_srsctl));
                  mips_emit_move (gen_rtx_REG (word_mode, K0_REG_NUM), mem);
                  offset -= UNITS_PER_WORD;
                }
              /* If we don't use shadow register set, we need to update SP.  */
              if (step2 > 0)
                {
                  emit_insn (gen_add3_insn (stack_pointer_rtx,
                                            stack_pointer_rtx,
                                            GEN_INT (step2)));
                }

              if (mchp_save_srsctl)
                {
                  /* Restore previously loaded SRSCTL.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_SRSCTL_REG_NUM),
                                            gen_rtx_REG (SImode, K0_REG_NUM)));
                }
              emit_insn (gen_mips_wrpgpr (stack_pointer_rtx, stack_pointer_rtx));
              /* Restore previously loaded Status.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, COP0_STATUS_REG_NUM),
                                        gen_rtx_REG (SImode, K1_REG_NUM)));
            }
          else /* unknown context-saving mechanism */
            {
              gcc_assert(0);
            }

        } /* (cfun->machine->interrupt_handler_p) */
      else /* not an interrupt */
        {
          /* Restore the registers.  */
          mips_for_each_saved_acc (frame->total_size - step2, mips_restore_reg);
          mips_for_each_saved_gpr_and_fpr (frame->total_size - step2,
                                           mips_restore_reg);
          /* Deallocate the final bit of the frame.  */
          if (step2 > 0)
            emit_insn (gen_add3_insn (stack_pointer_rtx,
                                      stack_pointer_rtx,
                                      GEN_INT (step2)));
        }
    }

  return;
}

void
mchp_output_function_epilogue (FILE *file ATTRIBUTE_UNUSED,
                               HOST_WIDE_INT size ATTRIBUTE_UNUSED)
{
  fprintf (file, "# Begin mchp_output_function_epilogue\n");
  if (cfun->machine->interrupt_handler_p && (0 < mips_noat.nesting_level))
    {
      mips_pop_asm_switch (&mips_noat);
    }

  fprintf (file, "# End mchp_output_function_epilogue\n");
}

/* Returns true if regno is a register ordinarilly not callee saved which
   must nevertheless be preserved by an interrupt handler function. */
inline int
mchp_register_interrupt_context_p (unsigned regno)
{
  if ((current_function_type == AUTO_CONTEXT_SAVE) ||
      (current_function_type == DEFAULT_CONTEXT_SAVE))
    {
      /* return true for at, a0-a3, t0-t9 and ra */
      /* Don't save v0-v1 because we save these in asm */
      if ((regno >= 4 && regno <= 15) /* a0-a3, t0-t7 */
          || regno == 1  /* at */
          || regno == 24 /* t8 */
          || regno == 25 /* t9 */
          || regno == 31) /* ra */
        {
          return 1;
        }
    }
  else if (current_function_type == SOFTWARE_CONTEXT_SAVE)
    {
      /* return true for at, a0-a3, t0-t9 and ra */
      /* Don't save v0-v1 because we save these in asm */
      if ((regno >= 4 && regno <= 15) /* a0-a3, t0-t7 */
          || regno == 1  /* at */
          || regno == 24 /* t8 */
          || regno == 25 /* t9 */
          || regno == 31) /* ra */
        {
          return 1;
        }
    }

  else
    {
      /* return true for v0, v1, a0-a3, t0-t9 and ra */
      if ((regno >= 1 && regno <= 15) /* v0, v1, a0-a3, t0-t7 */
          || regno == 24 /* t8 */
          || regno == 25 /* t9 */
          || regno == 31) /* ra */
        {
          return 1;
        }
    }

  return 0;
}

HOST_WIDE_INT
mchp_compute_frame_info (void)
{
  HOST_WIDE_INT num_intreg;   /* # words needed for interrupt context regs */
  bool has_interrupt_context;   /* true if interrupt context is saved */
  bool has_hilo_context;        /* true if hi and lo registers are saved */

  tree ipl_tree;
  unsigned ipl_len;

  /* Determine what type of interrupt was specified. */
  ipl_tree = mchp_function_interrupt_p (current_function_decl);
  if (current_function_type == UNKNOWN_CONTEXT_SAVE)
    {
      cfun->machine->use_shadow_register_set_p = false;
      cfun->machine->interrupt_handler_p = true;
      /* the priority can be either "single" or "ipl[0..7]"
         When the interrupt handler is for single interrupt mode, we
         treat it as a software context save handler. */
      gcc_assert (ipl_tree != NULL);

      if ((strcmp (IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)), "single") == 0)
          || (strcmp (IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)), "SINGLE") == 0)
          || (strcmp (IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)), "ripl") == 0)
          || (strcmp (IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)), "RIPL") == 0))
        {
          cfun->machine->current_function_type = current_function_type = DEFAULT_CONTEXT_SAVE;
          mchp_interrupt_priority = -1; /* Need to set IPL from RIPL */
          cfun->machine->interrupt_priority = -1;
          mchp_isr_backcompat = 0;
        }
      else
        {
          cfun->machine->interrupt_priority = mchp_interrupt_priority =
                                                IDENTIFIER_POINTER (TREE_VALUE (ipl_tree))[3] - '0';

          /* When the context-saving mode is not specified, assume that IPL7 uses
             SRS and other IPL levels use software. This assumption comes from the
             original Daytona family. The Talladega family introduces configurable
             shadow registers. You can map your shadow registers to an IPL level
             using configuration fuses. */
          ipl_len = strlen(IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)));
          if (ipl_len == (sizeof("ipl7")-1))
            {
              if (cfun->machine->interrupt_priority == 7)
                {
                  cfun->machine->current_function_type = current_function_type = SRS_CONTEXT_SAVE;
                  cfun->machine->use_shadow_register_set_p = true;
                  mchp_isr_backcompat = 1; /* No need to save SRSCTL */
                }
              else
                {
                  cfun->machine->current_function_type = current_function_type = SOFTWARE_CONTEXT_SAVE;
                  mchp_isr_backcompat = 1; /* No need to save SRSCTL */
                }
            }
          else if ((ipl_len > sizeof("ipl7")) && (ipl_len < (sizeof("ipl7software"))))
            {
              mchp_isr_backcompat = 0; /* Might need to save SRSCTL */
              if ((NULL != strstr(IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)),"SRS")) ||
                  (NULL != strstr(IDENTIFIER_POINTER (TREE_VALUE (ipl_tree)),"srs")))
                {
                  cfun->machine->current_function_type = current_function_type = SRS_CONTEXT_SAVE;
                  cfun->machine->use_shadow_register_set_p = true;
                  if (ipl_len > 7)
                    {
                      if (0 == mchp_invalid_ipl_warning)
                        {
                          warning(0, "Invalid ISR context-saving mode, assuming IPL"
                                  HOST_WIDE_INT_PRINT_DEC "SRS ",
                                  cfun->machine->interrupt_priority);
                          mchp_invalid_ipl_warning++;
                        }
                    }
                }
              else if ((NULL != strstr(IDENTIFIER_POINTER
                                       (TREE_VALUE (ipl_tree)),"SOFT")) ||
                       (NULL != strstr(IDENTIFIER_POINTER
                                       (TREE_VALUE (ipl_tree)),"soft"))
                      )
                {
                  cfun->machine->current_function_type = current_function_type = SOFTWARE_CONTEXT_SAVE;
                  if (ipl_len > sizeof("IPLnSOFT"))
                    {
                      if (0 == mchp_invalid_ipl_warning)
                        {
                          warning(0, "Invalid ISR context-saving mode, assuming IPL"
                                  HOST_WIDE_INT_PRINT_DEC "SOFT ",
                                  cfun->machine->interrupt_priority);
                          mchp_invalid_ipl_warning++;
                        }
                    }
                }
              else if ((NULL != strstr(IDENTIFIER_POINTER
                                       (TREE_VALUE (ipl_tree)),"STACK")) ||
                       (NULL != strstr(IDENTIFIER_POINTER
                                       (TREE_VALUE (ipl_tree)),"stack"))
                      )
                {
                  cfun->machine->current_function_type = current_function_type = SOFTWARE_CONTEXT_SAVE;
                  if (ipl_len > sizeof("IPLnSTACK"))
                    {
                      if (0 == mchp_invalid_ipl_warning)
                        {
                          warning(0, "Invalid ISR context-saving mode, assuming IPL"
                                  HOST_WIDE_INT_PRINT_DEC "SOFT ", cfun->machine->interrupt_priority);
                          mchp_invalid_ipl_warning++;
                        }
                    }
                }
              else if ((NULL != strstr(IDENTIFIER_POINTER
                                       (TREE_VALUE (ipl_tree)),"AUTO")) ||
                       (NULL != strstr(IDENTIFIER_POINTER
                                       (TREE_VALUE (ipl_tree)),"auto"))
                      )
                {
                  /* Determine shadow or SRS context save at runtime. */
                  cfun->machine->current_function_type = current_function_type = AUTO_CONTEXT_SAVE;
                }
              else
                {
                  if (0 == mchp_invalid_ipl_warning)
                    {
                      warning(0, "Invalid ISR context-saving mode, assuming IPL"
                              HOST_WIDE_INT_PRINT_DEC "AUTO", cfun->machine->interrupt_priority);
                      mchp_invalid_ipl_warning++;
                    }
                  cfun->machine->current_function_type = current_function_type = AUTO_CONTEXT_SAVE;
                }
            }
          else
            {
              if (0 == mchp_invalid_ipl_warning)
                {
                  warning(0, "Invalid ISR context-saving mode, assuming IPL"
                          HOST_WIDE_INT_PRINT_DEC "AUTO", cfun->machine->interrupt_priority);
                  mchp_invalid_ipl_warning++;
                }
              cfun->machine->current_function_type = current_function_type = AUTO_CONTEXT_SAVE;
            }
        }
      if (mchp_function_naked_p (current_function_decl))
        error ("interrupt handler functions cannot also be naked functions");
    }

  /* has_interrupt_context tells us whether we're saving any interrupt
     specific data */
  has_interrupt_context = (cfun->machine->current_function_type != NON_INTERRUPT);
  /* has_hilo_context is true if we need to push/pop HI and LO */
  has_hilo_context = 0;
  num_intreg = 0;

  /* add in space for the interrupt context information */
  if (has_interrupt_context)
    {
      gcc_assert (cfun->machine->current_function_type != UNKNOWN_CONTEXT_SAVE);
      df_set_regs_ever_live (K0_REGNUM, true);
      fixed_regs[K0_REGNUM] = call_really_used_regs[K0_REGNUM] =
                                call_used_regs[K0_REGNUM] = 1;
      df_set_regs_ever_live (K1_REGNUM, true);
      fixed_regs[K1_REGNUM] = call_really_used_regs[K1_REGNUM] =
                                call_used_regs[K1_REGNUM] = 1;

      /* all AUTO and SRS interrupt context functions need space
         to preserve SRSCTL. */
      if ((current_function_type == AUTO_CONTEXT_SAVE) ||
          (current_function_type == DEFAULT_CONTEXT_SAVE))
        {
          num_intreg++;
          df_set_regs_ever_live (V1_REGNUM, true);
          fixed_regs[V1_REGNUM] = call_really_used_regs[V1_REGNUM] =
                                    call_used_regs[V1_REGNUM] = 1;
        }
      else if ((cfun->machine->current_function_type == SRS_CONTEXT_SAVE) ||
               (cfun->machine->current_function_type == SOFTWARE_CONTEXT_SAVE))
        {
          if ((cfun->machine->interrupt_priority < 7) && (0 == mchp_isr_backcompat))
            {
              /* If we are not in Daytona compatibility mode, save SRSCTL. */
              num_intreg++;
              df_set_regs_ever_live (V1_REGNUM, true);
              fixed_regs[V1_REGNUM] = call_really_used_regs[V1_REGNUM] =
                                        call_used_regs[V1_REGNUM] = 1;
            }
        }
      /* If HI/LO is defined in this function, we need to save them too.
         If the function is not a leaf function, we assume that the
         called function uses them. */
      if (df_regs_ever_live_p (LO_REGNUM) || df_regs_ever_live_p (HI_REGNUM)
          || !current_function_is_leaf)
        {
          has_hilo_context = 1;
        }
      /* Both AUTO and SOFTWARE reserve space to save v0/v1 if necessary */
      if ((cfun->machine->current_function_type == SRS_CONTEXT_SAVE) ||
          (cfun->machine->current_function_type == SOFTWARE_CONTEXT_SAVE) ||
          (cfun->machine->current_function_type == AUTO_CONTEXT_SAVE) ||
          (cfun->machine->current_function_type == DEFAULT_CONTEXT_SAVE) )
        {
          /* AUTO and SOFTWARE use v0/v1 to save hi/lo */
          if (has_hilo_context)
            {
              df_set_regs_ever_live (V0_REGNUM, true);
              fixed_regs[V0_REGNUM] = call_really_used_regs[V0_REGNUM] =
                                        call_used_regs[V0_REGNUM] = 1;
              df_set_regs_ever_live (V1_REGNUM, true);
              fixed_regs[V1_REGNUM] = call_really_used_regs[V1_REGNUM] =
                                        call_used_regs[V1_REGNUM] = 1;
            }
        }
    }

  cfun->machine->frame.has_interrupt_context = has_interrupt_context;
  cfun->machine->frame.has_hilo_context = has_hilo_context;

  if ((num_intreg % 2) != 0)
    num_intreg++;

  return num_intreg;
}

void
mchp_output_function_prologue (FILE *file, HOST_WIDE_INT tsize ATTRIBUTE_UNUSED, HOST_WIDE_INT size ATTRIBUTE_UNUSED)
{
  fprintf (file, "# Begin mchp_output_function_prologue\n");
  if (cfun->machine->interrupt_handler_p && (0 == mips_noat.nesting_level))
    {
      mips_push_asm_switch (&mips_noat);
    }

  fprintf (file, "# End mchp_output_function_prologue\n");
}


static int
mchp_function_naked_p (tree func)
{
  tree a;
  /* according to the specification of the attribute, we shouldn't ever
     have it on a non-function declaration */
  gcc_assert (TREE_CODE (func) == FUNCTION_DECL);

  a = lookup_attribute ("naked", DECL_ATTRIBUTES (func));
  return a != NULL_TREE;
}

static int
mchp_function_persistent_p (tree decl)
{
  tree a;
  a = lookup_attribute ("persistent", DECL_ATTRIBUTES (decl));
  return a != NULL_TREE;
}

static tree
get_mchp_absolute_address (tree decl)
{
  return lookup_attribute ("address", DECL_ATTRIBUTES (decl));
}

static tree
get_mchp_space_attribute (tree decl)
{
  return lookup_attribute ("space", DECL_ATTRIBUTES (decl));
}

bool
mchp_ramfunc_type_p (tree decl)
{
  tree space = 0;
  if (TREE_CODE(decl) == FUNCTION_DECL)
    {
      if (lookup_attribute ("ramfunc", TYPE_ATTRIBUTES (TREE_TYPE (decl))) != NULL)
        return TRUE;
      space = lookup_attribute("space", DECL_ATTRIBUTES(decl));
      if (space && (get_identifier("data") ==
                    (TREE_VALUE(TREE_VALUE(space)))))
        return TRUE;
    }
  return FALSE;
}

/* Utility function to add an entry to the vector dispatch list */
void
mchp_add_vector_dispatch_entry (const char *target_name, int vector_number)
{
  struct vector_dispatch_spec *dispatch_entry;

  /* add the vector to the list of dispatch functions to emit */
  dispatch_entry = (struct vector_dispatch_spec *)ggc_alloc (sizeof (struct vector_dispatch_spec));
  dispatch_entry->next = vector_dispatch_list_head;
  dispatch_entry->target = target_name;
  dispatch_entry->vector_number = vector_number;
  vector_dispatch_list_head = dispatch_entry;
}

/* Expand the register-saving code in the function prologue */
HOST_WIDE_INT
mchp_expand_prologue_saveregs (HOST_WIDE_INT size, HOST_WIDE_INT step1)
{
  const struct mips_frame_info *frame;
  HOST_WIDE_INT nargs;
  rtx insn;
  int regno;
  frame = &cfun->machine->frame;
  cfun->machine->frame.savedgpr = 0;

  if (GENERATE_MIPS16E_SAVE_RESTORE)
    {
      HOST_WIDE_INT offset;
      unsigned int mask;

      /* Try to merge argument stores into the save instruction.  */
      nargs = mips16e_collect_argument_saves ();

      /* Build the save instruction.  */
      mask = frame->mask;
      insn = mips16e_build_save_restore (false, &mask, &offset,
                                         nargs, step1);
      RTX_FRAME_RELATED_P (emit_insn (insn)) = 1;
      size -= step1;

      /* Check that we need to save other registers.  */
      for (regno = GP_REG_FIRST; regno < GP_REG_LAST; regno++)
        if (BITSET_P (mask, regno - GP_REG_FIRST))
          {
            offset -= UNITS_PER_WORD;
            mips_save_restore_reg (word_mode, regno,
                                   offset, mips_save_reg);
          }
    }
  else
    {
      if (cfun->machine->interrupt_handler_p)
        {
          HOST_WIDE_INT offset;
          rtx mem;
          int interrupt_priority;
          enum mips_function_type_tag current_function_type;
          HOST_WIDE_INT mchp_save_srsctl;

          frame = &cfun->machine->frame;
          current_function_type = cfun->machine->current_function_type;
          interrupt_priority = cfun->machine->interrupt_priority;
          mchp_save_srsctl = (((interrupt_priority < 7)
                               && (0 == mchp_isr_backcompat))
                              || (current_function_type == AUTO_CONTEXT_SAVE)
                              || (current_function_type == DEFAULT_CONTEXT_SAVE));

          /* If this interrupt is using a shadow register set, we need to
          get the stack pointer from the previous register set. We want the
          first four instructions of the interrupt handler to be the same for
          all handler functions. This let's there be cache lines locked to
          those instructions, lowering the latency. */
          emit_insn (gen_mips_rdpgpr (stack_pointer_rtx,
                                      stack_pointer_rtx));

          if (SOFTWARE_CONTEXT_SAVE == current_function_type)
            {
              if (interrupt_priority < 7 || 1) /* Leave for cache purposes */
                {
                  /* Move from COP0 EPC to K0.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_EPC_REG_NUM)));
                }
              /* Move from COP0 STATUS to K1.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K1_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_STATUS_REG_NUM)));
              /* Allocate the first part of the frame.  */
              insn = gen_add3_insn (stack_pointer_rtx, stack_pointer_rtx,
                                    GEN_INT (-step1));
              RTX_FRAME_RELATED_P (emit_insn (insn)) = 1;
              size -= step1;

              /* Start at the uppermost location for saving.  */
              offset = frame->cop0_sp_offset - size;
              gcc_assert (offset > 0);

              /* Don't save EPC if we know we won't get a nested interrupt. */
              if ((interrupt_priority < 7) && !cfun->machine->keep_interrupts_masked_p)
                {
                  /* Push EPC into its stack slot.  */
                  gcc_assert (offset > 0);
                  mchp_offset_epc = offset;
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx,
                                                      mchp_offset_epc));
                  mips_emit_move (mem, gen_rtx_REG (word_mode, K0_REG_NUM));
                  offset -= UNITS_PER_WORD;
                }

              if (mchp_save_srsctl)
                {
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_SRSCTL_REG_NUM)));
                }
              /* Push STATUS into its stack slot.  */
              gcc_assert (offset >= 0);
              mchp_offset_status = offset;
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx,
                                                  mchp_offset_status));
              mips_emit_move (mem, gen_rtx_REG (word_mode, K1_REG_NUM));
              offset -= UNITS_PER_WORD;

              if (mchp_save_srsctl)
                {
                  /* Push SRSCTL into its stack slot.  */
                  gcc_assert (offset > 0);
                  mchp_offset_srsctl = offset;
                  mips_save_restore_reg (word_mode, K0_REG_NUM, mchp_offset_srsctl, mips_save_reg);
                  offset -= UNITS_PER_WORD;
                }

              if ((interrupt_priority >= 0) || 1)
                {
                  gcc_assert (interrupt_priority >= 0);
                  gcc_assert (interrupt_priority <= 7);
                  /* Clear UM, ERL, EXL, IPL in STATUS */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (15),
                                         GEN_INT (SR_EXL),
                                         gen_rtx_REG (SImode, GP_REG_FIRST)));
                  /* Set the IPL */
                  emit_insn (gen_iorsi3 (gen_rtx_REG (SImode, K1_REG_NUM),
                                         gen_rtx_REG (SImode, K1_REG_NUM),GEN_INT((unsigned)interrupt_priority << SR_IPL)));
                }
              /* We will move K1 to STATUS later in the generic MIPS code */
              emit_insn (gen_blockage ());
              mips_for_each_saved_gpr_and_fpr (size, mips_save_reg);
              /* Save HI/LO as late as possible to minimize stalls */
              mips_for_each_saved_acc (size, mips_save_reg);

            } /* End SOFT context save */
          else if (SRS_CONTEXT_SAVE == current_function_type)
            {
              cfun->machine->use_shadow_register_set_p = true;

              if (interrupt_priority < 7 || 1) /* Leave for cache purposes */
                {
                  /* Move from COP0 EPC to K0.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_EPC_REG_NUM)));
                }
              /* Move from COP0 STATUS to K1.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K1_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_STATUS_REG_NUM)));
              /* Allocate the first part of the frame.  */
              insn = gen_add3_insn (stack_pointer_rtx, stack_pointer_rtx,
                                    GEN_INT (-step1));
              RTX_FRAME_RELATED_P (emit_insn (insn)) = 1;
              size -= step1;

              /* Start at the uppermost location for saving.  */
              offset = frame->cop0_sp_offset - size;
              gcc_assert (offset > 0);
              if ((interrupt_priority < 7)
                  &&  !cfun->machine->keep_interrupts_masked_p)
                {
                  /* Push EPC into its stack slot.  */
                  gcc_assert (offset > 0);
                  mchp_offset_epc = offset;
                  mips_save_restore_reg (word_mode, K0_REG_NUM, mchp_offset_epc, mips_save_reg);
                  offset -= UNITS_PER_WORD;

                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_SRSCTL_REG_NUM)));
                }

              /* Push STATUS into its stack slot.  */
              gcc_assert (offset > 0);
              mchp_offset_status = offset;
              mips_save_restore_reg (word_mode, K1_REG_NUM, mchp_offset_status, mips_save_reg);
              offset -= UNITS_PER_WORD;

              if ((interrupt_priority < 7)
                  &&  !cfun->machine->keep_interrupts_masked_p)
                {
                  /* Push SRSCTL into its stack slot.  */
                  /*
                  gcc_assert (offset > 0);
                  */
                  mchp_offset_srsctl = offset;
                  mips_save_restore_reg (word_mode, K0_REG_NUM, mchp_offset_srsctl, mips_save_reg);
                  offset -= UNITS_PER_WORD;
                }

              if ((interrupt_priority >= 0) || 1)
                {
                  gcc_assert (interrupt_priority >= 0);
                  gcc_assert (interrupt_priority <= 7);
                  /* Clear UM, ERL, EXL, IPL in STATUS (K1) */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (15),
                                         GEN_INT (SR_EXL),
                                         gen_rtx_REG (SImode, GP_REG_FIRST)));
                  /* Set the IPL */
                  emit_insn (gen_iorsi3 (gen_rtx_REG (SImode, K1_REG_NUM),
                                         gen_rtx_REG (SImode, K1_REG_NUM),GEN_INT((unsigned)interrupt_priority << SR_IPL)));
                }
              /* Should not save anything because we are using a shadow register set. */
              mips_for_each_saved_gpr_and_fpr (size, mips_save_reg);
              /* Save HI/LO as late as possible to minimize stalls */
              mips_for_each_saved_acc (size, mips_save_reg);
            }
          else if (AUTO_CONTEXT_SAVE == current_function_type)
            {
              rtx skip_save_label;
              rtx do_save_label;
              rtx jumpskip;
              rtx cond;
              int savecount = 0;

              if (interrupt_priority < 7 || 1) /* Leave for cache purposes */
                {
                  /* Move from COP0 EPC to K1.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K1_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_EPC_REG_NUM)));
                }
              /* Move from COP0 SRSCTL to K0.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_SRSCTL_REG_NUM)));

              /* Allocate the first part of the frame.  */
              insn = gen_add3_insn (stack_pointer_rtx, stack_pointer_rtx,
                                    GEN_INT (-step1));
              RTX_FRAME_RELATED_P (emit_insn (insn)) = 1;
              size -= step1;

              /* Start at the uppermost location for saving.  */
              offset = frame->cop0_sp_offset - size;

              /* Don't save EPC if we know we won't get a nested interrupt. */
              if ((interrupt_priority < 7) && !cfun->machine->keep_interrupts_masked_p)
                {
                  /* Push EPC into its stack slot.  */
                  mchp_offset_epc = offset;
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx,
                                                      mchp_offset_epc));
                  mips_emit_move (mem, gen_rtx_REG (word_mode, K1_REG_NUM));
                  offset -= UNITS_PER_WORD;
                }

              /* Move from COP0 STATUS to K1.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K1_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_STATUS_REG_NUM)));

              /* Push SRSCTL into its stack slot.  */
              mchp_offset_srsctl = offset;
              mips_save_restore_reg (word_mode, K0_REG_NUM, mchp_offset_srsctl, mips_save_reg);
              offset -= UNITS_PER_WORD;

              /* TODO: Do we need to do this if interrupts are masked? */
              if (interrupt_priority < 0)
                {
                  /* Move from COP0 Cause to K0.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_CAUSE_REG_NUM)));
                }


              /* Push STATUS into its stack slot.  */
              mchp_offset_status = offset;
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx,
                                                  mchp_offset_status));
              mips_emit_move (mem, gen_rtx_REG (word_mode, K1_REG_NUM));
              offset -= UNITS_PER_WORD;

              if (interrupt_priority < 0)
                {

                  if (!cfun->machine->keep_interrupts_masked_p)
                    {
                      /* Right justify the CAUSE RIPL in k0.  */
                      emit_insn (gen_lshrsi3 (gen_rtx_REG (SImode, K0_REG_NUM),
                                              gen_rtx_REG (SImode, K0_REG_NUM),
                                              GEN_INT (CAUSE_IPL)));
                      /* Insert the RIPL into our copy of SR (k1) as the new IPL.  */
                      emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                             GEN_INT (6),
                                             GEN_INT (SR_IPL),
                                             gen_rtx_REG (SImode, K0_REG_NUM)));
                    }
                }

              if (interrupt_priority >= 0)
                {
                  gcc_assert (interrupt_priority <= 7);
                  /* Clear UM, ERL, EXL, IPL in STATUS */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (15),
                                         GEN_INT (SR_EXL),
                                         gen_rtx_REG (SImode, GP_REG_FIRST)));
                  /* Set the IPL */
                  emit_insn (gen_iorsi3 (gen_rtx_REG (SImode, K1_REG_NUM),
                                         gen_rtx_REG (SImode, K1_REG_NUM),GEN_INT((unsigned)interrupt_priority << SR_IPL)));
                }
              else
                {
                  /* Clear UM, ERL, EXL, IPL in STATUS */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (4),
                                         GEN_INT (SR_EXL),
                                         gen_rtx_REG (SImode, GP_REG_FIRST)));
                }

              /* We will move K1 to STATUS later in the generic MIPS code */
              emit_insn (gen_blockage ());

              /* Save v0 and v1 here, but on the proper stack location */
              cfun->machine->frame.mask |= (1 << V0_REGNUM);
              cfun->machine->frame.mask |= (1 << V1_REGNUM);

              offset = cfun->machine->frame.gp_sp_offset - size;
              savecount = 0;
              for (regno = GP_REG_LAST; regno > GP_REG_FIRST; regno--)
                if (BITSET_P (cfun->machine->frame.mask, regno - GP_REG_FIRST))
                  {
                    if ((regno == V1_REGNUM) || (regno == V0_REGNUM))
                      {
                        mips_save_restore_reg (word_mode, regno,
                                               offset, mips_save_reg);
                        cfun->machine->frame.savedgpr |= (1 << regno);
                      }
                    savecount++;
                    offset -= UNITS_PER_WORD;
                  }

              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx,
                                                  mchp_offset_srsctl));
              mips_emit_move (gen_rtx_REG (word_mode, V1_REGNUM), mem);
              emit_insn (gen_andsi3 (gen_rtx_REG (SImode, V1_REGNUM), gen_rtx_REG (SImode, V1_REGNUM), GEN_INT((unsigned)0x0F) ));
              do_save_label = gen_label_rtx ();
              skip_save_label = gen_label_rtx ();

              if (savecount > 3)
                {
                  cond = gen_rtx_NE(SImode,gen_rtx_REG(SImode, V1_REGNUM),const0_rtx);
                  jumpskip =  emit_jump_insn (gen_condjump (cond, skip_save_label));
                  JUMP_LABEL (jumpskip) = skip_save_label;
                }
              LABEL_NUSES (skip_save_label) = 1;

              emit_insn (gen_blockage ());
              emit_label (do_save_label);
              mips_for_each_saved_gpr_and_fpr (size, mips_save_reg);
              emit_label (skip_save_label);
              emit_insn (gen_blockage ());

              /* Save HI/LO as late as possible to minimize stalls */
              mips_for_each_saved_acc (size, mips_save_reg);
            } /* AUTO_CONTEXT_SAVE */
          else if (DEFAULT_CONTEXT_SAVE == cfun->machine->current_function_type)
            {
              rtx skip_save_label;
              rtx do_save_label;
              rtx jumpskip;
              rtx cond;
              int savecount = 0;

              if (interrupt_priority < 7 || 1) /* Leave for cache purposes */
                {
                  /* Move from COP0 EPC to K1.  */
                  emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K1_REG_NUM),
                                            gen_rtx_REG (SImode,
                                                         COP0_EPC_REG_NUM)));
                }

              /* Move from COP0 SRSCTL to K0.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_SRSCTL_REG_NUM)));


              /* Allocate the first part of the frame.  */
              insn = gen_add3_insn (stack_pointer_rtx, stack_pointer_rtx,
                                    GEN_INT (-step1));
              RTX_FRAME_RELATED_P (emit_insn (insn)) = 1;
              size -= step1;

              /* Start at the uppermost location for saving.  */
              offset = frame->cop0_sp_offset - size;

              /* Don't save EPC if we know we won't get a nested interrupt. */
              if ((interrupt_priority < 7) && !cfun->machine->keep_interrupts_masked_p)
                {
                  /* Push EPC into its stack slot.  */
                  mchp_offset_epc = offset;
                  mem = gen_frame_mem (word_mode,
                                       plus_constant (stack_pointer_rtx,
                                                      mchp_offset_epc));
                  mips_emit_move (mem, gen_rtx_REG (word_mode, K1_REG_NUM));
                  offset -= UNITS_PER_WORD;
                }

              /* Move from COP0 STATUS to K1.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K1_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_STATUS_REG_NUM)));

              /* Push SRSCTL into its stack slot.  */
              mchp_offset_srsctl = offset;
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx,
                                                  mchp_offset_srsctl));
              mips_emit_move (mem, gen_rtx_REG (word_mode, K0_REG_NUM));
              offset -= UNITS_PER_WORD;

              /* Move from COP0 Cause to K0.  */
              emit_insn (gen_cop0_move (gen_rtx_REG (SImode, K0_REG_NUM),
                                        gen_rtx_REG (SImode,
                                                     COP0_CAUSE_REG_NUM)));

              /* Push STATUS into its stack slot.  */
              mchp_offset_status = offset;
              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx,
                                                  mchp_offset_status));
              mips_emit_move (mem, gen_rtx_REG (word_mode, K1_REG_NUM));
              offset -= UNITS_PER_WORD;

              /* Right justify the CAUSE RIPL in k0.  */
              if (!cfun->machine->keep_interrupts_masked_p)
                {
                  emit_insn (gen_lshrsi3 (gen_rtx_REG (SImode, K0_REG_NUM),
                                          gen_rtx_REG (SImode, K0_REG_NUM),
                                          GEN_INT (CAUSE_IPL)));

                  /* Insert the RIPL into our copy of SR (k1) as the new IPL.  */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (6),
                                         GEN_INT (SR_IPL),
                                         gen_rtx_REG (SImode, K0_REG_NUM)));

                  /* Enable interrupts by clearing the KSU ERL and EXL bits.
                     IE is already the correct value, so we don't have to do
                     anything explicit.  */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (4),
                                         GEN_INT (SR_EXL),
                                         gen_rtx_REG (SImode, GP_REG_FIRST)));
                  /* We will move K1 to STATUS later in the generic MIPS code */
                }
              else /* cfun->machine->keep_interrupts_masked_p */
                {
                  /* Disable interrupts by clearing the KSU, ERL, EXL,
                     and IE bits.  */
                  emit_insn (gen_insvsi (gen_rtx_REG (SImode, K1_REG_NUM),
                                         GEN_INT (5),
                                         GEN_INT (SR_IE),
                                         gen_rtx_REG (SImode, GP_REG_FIRST)));
                }

              /* We will move K1 to STATUS later in the generic MIPS code */
              emit_insn (gen_blockage ());

              /* Save v0 and v1 here, but on the proper stack location */
              cfun->machine->frame.mask |= (1 << V0_REGNUM);
              cfun->machine->frame.mask |= (1 << V1_REGNUM);

              offset = cfun->machine->frame.gp_sp_offset - size;
              savecount = 0;
              for (regno = GP_REG_LAST; regno > GP_REG_FIRST; regno--)
                if (BITSET_P (cfun->machine->frame.mask, regno - GP_REG_FIRST))
                  {
                    if ((regno == V1_REGNUM) || (regno == V0_REGNUM))
                      {
                        mips_save_restore_reg (word_mode, regno,
                                               offset, mips_save_reg);
                        cfun->machine->frame.savedgpr |= (1 << regno);
                      }
                    savecount++;
                    offset -= UNITS_PER_WORD;
                  }

              mem = gen_frame_mem (word_mode,
                                   plus_constant (stack_pointer_rtx,
                                                  mchp_offset_srsctl));
              mips_emit_move (gen_rtx_REG (word_mode, V1_REGNUM), mem);
              emit_insn (gen_andsi3 (gen_rtx_REG (SImode, V1_REGNUM), gen_rtx_REG (SImode, V1_REGNUM), GEN_INT((unsigned)0x0F) ));
              do_save_label = gen_label_rtx ();
              skip_save_label = gen_label_rtx ();

              if (savecount > 3)
                {
                  cond = gen_rtx_NE(SImode,gen_rtx_REG(SImode, V1_REGNUM),const0_rtx);
                  jumpskip =  emit_jump_insn (gen_condjump (cond, skip_save_label));
                  JUMP_LABEL (jumpskip) = skip_save_label;
                }

              emit_insn (gen_blockage ());
              emit_label (do_save_label);
              mips_for_each_saved_gpr_and_fpr (size, mips_save_reg);
              emit_label (skip_save_label);

              emit_insn (gen_blockage ());

              /* Save HI/LO as late as possible to minimize stalls */
              mips_for_each_saved_acc (size, mips_save_reg);
            }
        }
      else /* not an interrupt */
        {
          insn = gen_add3_insn (stack_pointer_rtx,
                                stack_pointer_rtx,
                                GEN_INT (-step1));
          RTX_FRAME_RELATED_P (emit_insn (insn)) = 1;
          size -= step1;


          mips_for_each_saved_acc (size, mips_save_reg);
          mips_for_each_saved_gpr_and_fpr (size, mips_save_reg);
        }
    }
  return size;
}

bool mchp_subtarget_mips16_enabled (const_tree decl)
{
  static const_tree first_disabled_decl = NULL;
  static const_tree last_disabled_decl = NULL;
  static bool suppress_further_warnings = false;

  if (mchp_pic32_license_valid < 2)
    {
      if ((decl == first_disabled_decl) ||
          (decl == last_disabled_decl))
        {
          suppress_further_warnings = true;
        }

      if (false == suppress_further_warnings)
        {
          warning (0, "The current compiler license does not support the %<mips16%>"
                       " attribute on %qs, attribute ignored",
                       IDENTIFIER_POINTER (DECL_NAME (decl)));
          if (NULL == first_disabled_decl)
            {
              first_disabled_decl = decl;
            }
          last_disabled_decl = decl;
        }

      return false;
    }
  else
    {
      return true;
    }
}

#if defined(C32_SMARTIO_RULES) || 1

#define CCS_FLAG_MASK (~(conv_c-1))
#define CCS_STATE_MASK (conv_c-1)
#define CCS_FLAG(X) ((X) & CCS_FLAG_MASK)
#define CCS_STATE(X) ((X) & CCS_STATE_MASK)

/* Must be sorted */
static mchp_interesting_fn mchp_fn_list[] =
{
  /*  name         map_to        style          arg c, conv_flags */
  { "_dasprintf",  "_dasprintf", info_dbl,    5,  0, 0, NULL },
  { "_dfprintf",   "_dfprintf",  info_dbl,    5,  0, 0, NULL },
  { "_dfscanf",    "_dfscanf",   info_dbl,    5,  0, 0, NULL },
  { "_dprintf",    "_dprintf",   info_dbl,    4,  0, 0, NULL },
  { "_dscanf",     "_dscanf",    info_dbl,    4,  0, 0, NULL },
  { "_dsnprintf",  "_dsnprintf", info_dbl,    6,  0, 0, NULL },
  { "_dsprintf",   "_dsprintf",  info_dbl,    5,  0, 0, NULL },
  { "_dsscanf",    "_dsscanf",   info_dbl,    5,  0, 0, NULL },
  { "_dvasprintf", "_dvasprintf",info_dbl,    5,  0, 0, NULL },
  { "_dvfprintf",  "_dvfprintf", info_dbl,    5,  0, 0, NULL },
  { "_dvfscanf",   "_dvfscanf",  info_dbl,    5,  0, 0, NULL },
  { "_dvprintf",   "_dvprintf",  info_dbl,    4,  0, 0, NULL },
  { "_dvsprintf",  "_dvsprintf", info_dbl,    5,  0, 0, NULL },
  { "_dvsscanf",   "_dvsscanf",  info_dbl,    5,  0, 0, NULL },
  { "asprintf",  "_asprintf",  info_O,        5,  0, 0, NULL },
  { "fprintf",   "_fprintf",   info_O,        5,  0, 0, NULL },
  { "fscanf",    "_fscanf",    info_I,        5,  0, 0, NULL },
  { "printf",    "_printf",    info_O,        4,  0, 0, NULL },
  { "scanf",     "_scanf",     info_I,        4,  0, 0, NULL },
  { "snprintf",  "_snprintf",  info_O,        6,  0, 0, NULL },
  { "sprintf",   "_sprintf",   info_O,        5,  0, 0, NULL },
  { "sscanf",    "_sscanf",    info_I,        5,  0, 0, NULL },
  { "vasprintf", "_vasprintf", info_O,        5,  0, 0, NULL },
  { "vfprintf",  "_vfprintf",  info_O,        5,  0, 0, NULL },
  { "vfscanf",   "_vfscanf",   info_I,        5,  0, 0, NULL },
  { "vprintf",   "_vprintf",   info_O,        4,  0, 0, NULL },
  { "vsnprintf", "_vsnprintf", info_O,        6,  0, 0, NULL },
  { "vsprintf",  "_vsprintf",  info_O,        5,  0, 0, NULL },
  { "vsscanf",   "_vsscanf",   info_I,        5,  0, 0, NULL },
  { 0,           0,            0,            -1,  0, 0, NULL }
};

/*
 *  strings values are thrown away after they are generated, but the
 *    a reference to the string will always return the same rtx... keep
 *    track of them here and they're conversion state
 */
enum { status_output = 0,
       status_input = 1
     };

typedef struct mchp_conversion_cache_
{
  rtx rtl;
  mchp_conversion_status valid[2];
  struct mchp_conversion_cache_ *l,*r;
} mchp_conversion_cache;

int mchp_clear_fn_list=1;

static mchp_conversion_cache *mchp_saved_conversion_info;

static const char *mchp_strip_name_encoding_helper(const char *symbol_name)
{
  const char *var;
  int sz = 0;

  var = symbol_name;
  while ((sz = ENCODED_NAME_P(var)))
    {
      var = var + ENCODED_NAME_P(symbol_name);
      var += (*var == '*');
    }
  return var;
}

/* By default, we do nothing for encode_section_info, so we need not
   do anything but discard the '*' marker.  */

const char *
mchp_strip_name_encoding (const char *symbol_name)
{
  const char *var;
  mchp_interesting_fn *match;
  var = mchp_strip_name_encoding_helper(symbol_name);

  if (mchp_io_size_val > 0)
    {
      match = mchp_match_conversion_fn(var);
      while (match)
        {
          if (match->function_convertable)
            {

#define CCS_ADD_FLAG(FLAG) \
        if (match->conv_flags & JOIN(conv_,FLAG)) { \
          *f++=#FLAG[0]; \
          added |=  JOIN(conv_,FLAG); }

#define CCS_ADD_FLAG_ALT(FLAG,ALT) \
        if ((match->conv_flags & JOIN(conv_,FLAG)) && \
            ((added & JOIN(conv_,ALT)) == 0)) {\
          *f++=#ALT[0]; \
          added |=  JOIN(conv_,ALT); }

              {
                char extra_flags[sizeof("_aAcdeEfFgGnopsuxX0")] = "_";
                char *f = &extra_flags[1];
                mchp_conversion_status added;
                /*
                 * order is important here
                 *  add new flags alphabetically with lower case preceding uppercase
                 *    ie _aAcdEfgG not
                 *       _acdfgAEG
                 */

                added = 0;
                /*
                 * we don't implement all 131K unique combinations, only
                 * a subset...
                */

                /* a | A -> aA */
                CCS_ADD_FLAG(a);
                CCS_ADD_FLAG_ALT(A,a);
                CCS_ADD_FLAG(A);
                CCS_ADD_FLAG_ALT(a,A);

                /* c | d | n | o | p | u | x | X -> cdnopuxX */
                CCS_ADD_FLAG(c);
                CCS_ADD_FLAG_ALT(d,c);
                CCS_ADD_FLAG_ALT(n,c);
                CCS_ADD_FLAG_ALT(o,c);
                CCS_ADD_FLAG_ALT(p,c);
                CCS_ADD_FLAG_ALT(u,c);
                CCS_ADD_FLAG_ALT(x,c);
                CCS_ADD_FLAG_ALT(X,c);

                /* c | d | n | o | p | u | x | X -> cdnopuxX */
                CCS_ADD_FLAG(d);
                CCS_ADD_FLAG_ALT(c,d);
                CCS_ADD_FLAG_ALT(n,d);
                CCS_ADD_FLAG_ALT(o,d);
                CCS_ADD_FLAG_ALT(p,d);
                CCS_ADD_FLAG_ALT(u,d);
                CCS_ADD_FLAG_ALT(x,d);
                CCS_ADD_FLAG_ALT(X,d);

                /* e | E -> eE */
                CCS_ADD_FLAG(e);
                CCS_ADD_FLAG_ALT(E,e);
                CCS_ADD_FLAG(E);
                CCS_ADD_FLAG_ALT(e,E);

                /* f | F -> fF */
                CCS_ADD_FLAG(f);
                CCS_ADD_FLAG_ALT(F,f);
                CCS_ADD_FLAG(F);
                CCS_ADD_FLAG_ALT(f,F);

                /* g | G -> gG */
                CCS_ADD_FLAG(g);
                CCS_ADD_FLAG_ALT(G,g);
                CCS_ADD_FLAG(G);
                CCS_ADD_FLAG_ALT(g,G);

                /* c | d | n | o | p | u | x | X -> cdnopuxX */
                CCS_ADD_FLAG(n);
                CCS_ADD_FLAG_ALT(c,n);
                CCS_ADD_FLAG_ALT(d,n);
                CCS_ADD_FLAG_ALT(n,n);
                CCS_ADD_FLAG_ALT(o,n);
                CCS_ADD_FLAG_ALT(p,n);
                CCS_ADD_FLAG_ALT(u,n);
                CCS_ADD_FLAG_ALT(x,n);
                CCS_ADD_FLAG_ALT(X,n);

                /* c | d | n | o | p | u | x | X -> cdnopuxX */
                CCS_ADD_FLAG(o);
                CCS_ADD_FLAG_ALT(c,o);
                CCS_ADD_FLAG_ALT(d,o);
                CCS_ADD_FLAG_ALT(n,o);
                CCS_ADD_FLAG_ALT(o,o);
                CCS_ADD_FLAG_ALT(p,o);
                CCS_ADD_FLAG_ALT(u,o);
                CCS_ADD_FLAG_ALT(x,o);
                CCS_ADD_FLAG_ALT(X,o);

                CCS_ADD_FLAG(p);
                CCS_ADD_FLAG_ALT(c,p);
                CCS_ADD_FLAG_ALT(d,p);
                CCS_ADD_FLAG_ALT(n,p);
                CCS_ADD_FLAG_ALT(o,p);
                CCS_ADD_FLAG_ALT(p,p);
                CCS_ADD_FLAG_ALT(u,p);
                CCS_ADD_FLAG_ALT(x,p);
                CCS_ADD_FLAG_ALT(X,p);

                CCS_ADD_FLAG(s);

                CCS_ADD_FLAG(u);
                CCS_ADD_FLAG_ALT(c,u);
                CCS_ADD_FLAG_ALT(d,u);
                CCS_ADD_FLAG_ALT(n,u);
                CCS_ADD_FLAG_ALT(o,u);
                CCS_ADD_FLAG_ALT(p,u);
                CCS_ADD_FLAG_ALT(u,u);
                CCS_ADD_FLAG_ALT(x,u);
                CCS_ADD_FLAG_ALT(X,u);

                CCS_ADD_FLAG(x);
                CCS_ADD_FLAG_ALT(c,x);
                CCS_ADD_FLAG_ALT(d,x);
                CCS_ADD_FLAG_ALT(n,x);
                CCS_ADD_FLAG_ALT(o,x);
                CCS_ADD_FLAG_ALT(p,x);
                CCS_ADD_FLAG_ALT(u,x);
                CCS_ADD_FLAG_ALT(x,x);
                CCS_ADD_FLAG_ALT(X,x);

                CCS_ADD_FLAG(X);
                CCS_ADD_FLAG_ALT(c,X);
                CCS_ADD_FLAG_ALT(d,X);
                CCS_ADD_FLAG_ALT(n,X);
                CCS_ADD_FLAG_ALT(o,X);
                CCS_ADD_FLAG_ALT(p,X);
                CCS_ADD_FLAG_ALT(u,X);
                CCS_ADD_FLAG_ALT(x,X);
                CCS_ADD_FLAG_ALT(X,X);
                *f++=0;

                if (strlen(extra_flags) > 1)
                  {
                    if (match->encoded_name = NULL)
                      free(match->encoded_name);
                    match->encoded_name = (char*)xmalloc(strlen(match->map_to) +
                    strlen(extra_flags) + 1);
                    sprintf(match->encoded_name,"%s%s", match->map_to, extra_flags);
                  }
                else
                  {
                    /* we have no flags */
                    match->encoded_name = (char*)xmalloc(strlen(match->map_to) + 3);
                    sprintf(match->encoded_name,"%s_0", match->map_to);
                  }
              }
              if (match->encoded_name) return match->encoded_name;
            }
          if (match[1].name &&
              (strcmp(match[1].name,var) == 0)) match++;
          else match = 0;
        }
    }
  return var;
}

static int mchp_bsearch_compare(const void *va, const void *vb)
{
  const mchp_interesting_fn *a = (const mchp_interesting_fn *)va;
  const mchp_interesting_fn *b = (const mchp_interesting_fn *)vb;

  return strcmp(a->name, b->name);
}

static mchp_interesting_fn *mchp_match_conversion_fn(const char *name)
{
  mchp_interesting_fn a,*res;
  a.name = name;

  res = (mchp_interesting_fn*)
        bsearch(&a, mchp_fn_list,
                sizeof(mchp_fn_list)/sizeof(mchp_interesting_fn)-1,
                sizeof(mchp_interesting_fn), mchp_bsearch_compare);
  while (res && (res != mchp_fn_list)  && (strcmp(name, res[-1].name) == 0))
    res--;
  return res;
}

static void conversion_info(mchp_conversion_status state,
                            mchp_interesting_fn *fn_id)
{
  /* dependant upon the conversion status and the setting of the smart-io
     option, set up the mchp_fn_list table. */

  fn_id->conv_flags = CCS_FLAG(fn_id->conv_flags) | state;
  if (mchp_io_size_val== 0)
    {
      if (fn_id->encoded_name) free(fn_id->encoded_name);
      fn_id->encoded_name = 0;
      fn_id->function_convertable = 0;
    }
  else if ((mchp_io_size_val == 1) && (CCS_STATE(state) != conv_possible))
    {
      if (fn_id->encoded_name) free(fn_id->encoded_name);
      fn_id->encoded_name = 0;
      fn_id->function_convertable = 0;
    }
  else if ((mchp_io_size_val == 2) &&
           (CCS_STATE(state) == conv_not_possible))
    {
      if (fn_id->encoded_name) free(fn_id->encoded_name);
      fn_id->encoded_name = 0;
      fn_id->function_convertable = 0;
    }
}

static mchp_conversion_status
mchp_convertable_output_format_string(const char *string)
{
  const char *c = string;
  enum mchp_conversion_status_ status = 0;

  for ( ; *c; c++)
    {
      /* quickly deal with the un-interesting cases */
      if (*c != '%') continue;
      if (*(++c) == '%')
        {
          continue;
        }
      /* zero or more flags */
      while (1)
        {
          switch (*c)
            {
            case '-':
            case '+':
            case ' ':
            case '#':
            case '0':
              c++;
              continue;
            default:
              break;
            }
          break;
        }
      /* optional field width or * */
      if (*c == '*') c++;
      else
        while (ISDIGIT(*c)) c++;
      /* optional precision or * */
      if (*c == '.')
        {
          c++;
          /* an illegal conversion sequence %.g, for example - give up and
             start looking from the g onwards */
          if (*c == '*') c++;
          else
            {
              if (!ISDIGIT(*c))
                {
                  c--;
                }
              while (ISDIGIT(*c)) c++;
            }
        }
      /* optional conversion modifier */
      switch (*c)
        {
        case 'h':
        case 'l':
        case 'L':
          c++;
          break;
        default:
          break;
        }
      /* c should point to the conversion character */
      switch (*c)
        {
        case 'a':
          status |= conv_a;
          break;
        case 'A':
          status |= conv_A;
          break;
        case 'c':
          status |= conv_c;
          break;
        case 'd':
          status |= conv_d;
          break;
        case 'i':
          status |= conv_d;
          break;
        case 'e':
          status |= conv_e;
          break;
        case 'E':
          status |= conv_E;
          break;
        case 'f':
          status |= conv_f;
          break;
        case 'F':
          status |= conv_F;
          break;
        case 'g':
          status |= conv_g;
          break;
        case 'G':
          status |= conv_G;
          break;
        case 'n':
          status |= conv_n;
          break;
        case 'o':
          status |= conv_o;
          break;
        case 'p':
          status |= conv_p;
          break;
        case 's':
          status |= conv_s;
          break;
        case 'u':
          status |= conv_u;
          break;
        case 'x':
          status |= conv_x;
          break;
        case 'X':
          status |= conv_X;
          break;
        default:   /* we aren't checking for legal format strings */
          break;
        }
    }
  return conv_possible | status;
}

static mchp_conversion_status
mchp_convertable_input_format_string(const char *string)
{
  const char *c = string;
  enum mchp_conversion_status_ status = 0;

  for ( ; *c; c++)
    {
      /* quickly deal with the un-interesting cases */
      if (*c != '%') continue;
      if (*(++c) == '%')
        {
          continue;
        }
      /* optional assignment suppression */
      if (*c == '*') c++;
      /* optional field width */
      while (ISDIGIT(*c)) c++;
      /* optional conversion modifier */
      switch (*c)
        {
        case 'h':
        case 'l':
        case 'L':
          c++;
          break;
        default:
          break;
        }
      /* c should point to the conversion character */
      switch (*c)
        {
        case 'a':
          status |= conv_a;
          break;
        case 'A':
          status |= conv_A;
          break;
        case 'c':
          status |= conv_c;
          break;
        case 'd':
          status |= conv_d;
          break;
        case 'i':
          status |= conv_d;
          break;
        case 'e':
          status |= conv_e;
          break;
        case 'E':
          status |= conv_E;
          break;
        case 'f':
          status |= conv_f;
          break;
        case 'F':
          status |= conv_F;
          break;
        case 'g':
          status |= conv_g;
          break;
        case 'G':
          status |= conv_G;
          break;
        case 'n':
          status |= conv_n;
          break;
        case 'o':
          status |= conv_o;
          break;
        case 'p':
          status |= conv_p;
          break;
        case 's':
          status |= conv_s;
          break;
        case 'u':
          status |= conv_u;
          break;
        case 'x':
          status |= conv_x;
          break;
        case 'X':
          status |= conv_X;
          break;
          /* string selection expr */
        case '[':
        {
          /* [^]...] or []...] or [...] ; get to the end of the conversion */
          c++;
          if (*c == '^') c++;
          if (*c == ']') c++;
          while (*c++ != ']');
        }
        default:   /* we aren't checking for legal format strings */
          break;
        }
    }
  return conv_possible | status;
}

/*
 *   Check or set the conversion status for a particular rtl -
 *     to check the current state pass conv_state_unknown (always 0)
 *     This will create an entry if it doesn't exist or return the current
 *     state.
 */
static mchp_conversion_status
cache_conversion_state(rtx val, int variant, mchp_conversion_status s)
{
  mchp_conversion_cache *parent = 0;
  mchp_conversion_cache *save;

  save = mchp_saved_conversion_info;
  while (save && save->rtl != val)
    {
      parent = save;
      if ((HOST_WIDE_INT)val & sizeof(void *)) save = save->l;
      else save = save->r;
    }
  if (save)
    {

      /* we can only increase the current status */
      if (CCS_STATE(s) > CCS_STATE(save->valid[variant]))
        {
          save->valid[variant] &= CCS_FLAG_MASK;
          save->valid[variant] |= (s & CCS_STATE_MASK);
        }
      save->valid[variant] = save->valid[variant] | CCS_FLAG(s);
      return save->valid[variant];
    }
  save = (mchp_conversion_cache *) xcalloc(sizeof(mchp_conversion_cache),1);
  save->rtl = val;
  save->valid[variant] = s;
  if (parent)
    {
      if ((HOST_WIDE_INT)val & sizeof(void *)) parent->l = save;
      else parent->r = save;
    }
  else mchp_saved_conversion_info = save;
  return s;
}

/* call-back to make sure all constant strings get seen */
void mchp_cache_conversion_state(rtx val, tree sym)
{
  mchp_conversion_status s;

  s = cache_conversion_state(val, status_output, conv_state_unknown);
  if (s == conv_state_unknown)
    {
      if (sym && STRING_CST_CHECK(sym))
        {
          const char *string = TREE_STRING_POINTER(sym);

          s = mchp_convertable_output_format_string(string);
          cache_conversion_state(val, status_output, s);
        }
    }
  s = cache_conversion_state(val, status_input, conv_state_unknown);
  if (s == conv_state_unknown)
    {
      if (sym && STRING_CST_CHECK(sym))
        {
          const char *string = TREE_STRING_POINTER(sym);

          s = mchp_convertable_input_format_string(string);
          cache_conversion_state(val, status_input, s);
        }
    }
}

/* return the DECL for a constant string denoted by x, if found */
/* this function has disappeared from later sources :( */
static tree constant_string(rtx x)
{
  if (GET_CODE(x) == SYMBOL_REF)
    {
      if (TREE_CONSTANT_POOL_ADDRESS_P (x)) return SYMBOL_REF_DECL (x);
    }
  return 0;
}

/* given an rtx representing a possible string, validate that the string is
   convertable */
static void mchp_handle_conversion(rtx val,
                                   mchp_interesting_fn *matching_fn)
{
  tree sym;
  int style;

  if (val == 0)
    {
      conversion_info(conv_indeterminate, matching_fn);
      return;
    }
  /* a constant string will be given a symbol name, and so will a
     symbol ... */
  sym = constant_string(val);
  if (!(sym && STRING_CST_CHECK(sym))) sym = 0;
  mchp_cache_conversion_state(val, sym);
  style = matching_fn->conversion_style == info_I ? status_input:status_output;
  conversion_info(cache_conversion_state(val, style, conv_state_unknown),
                  matching_fn);
}

static void mchp_handle_io_conversion(rtx call_insn,
                                      mchp_interesting_fn *matching_fn)
{
  rtx format_arg;

  gcc_assert((matching_fn->conversion_style == info_I) ||
             (matching_fn->conversion_style == info_O));
             
  format_arg = PREV_INSN(call_insn);
             
  if (format_arg == NULL)
    return;

  for (format_arg = PREV_INSN(call_insn);
       !(NOTE_INSN_BASIC_BLOCK_P(format_arg) ||
         NOTE_INSN_FUNCTION_BEG_P(format_arg) ||
         (INSN_P(format_arg) && (GET_CODE(PATTERN(format_arg)) == CALL_INSN)));
       format_arg = PREV_INSN(format_arg))
    {
      if (INSN_P(format_arg))
        {
          if ((GET_CODE(PATTERN(format_arg)) == SET) &&
              (GET_CODE(XEXP(PATTERN(format_arg),0)) == REG))
            {

              int arg_reg = (REGNO(XEXP(PATTERN(format_arg),0)));
              rtx val = XEXP(PATTERN(format_arg),1);

              rtx assignment = format_arg;
              if (arg_reg == matching_fn->interesting_arg)
                {
                  if ((GET_CODE(val) == LO_SUM))
                    {
                      val = XEXP(val,1);
                    }
                  else if ((GET_CODE(val) == REG) || (GET_CODE(val) == SUBREG))
                    {
                      val = find_last_value(val, &assignment, 0, /* allow hw reg */ 1);
                    }
                  else if (GET_CODE(val) == MEM)
                    {
                      val = XEXP(val,0);
                    }
                  mchp_handle_conversion(val, matching_fn);
                  return;
                }
            }
        }
    }
  conversion_info(conv_indeterminate, matching_fn);
}

/*
 *  This function always returns true
 */
int mchp_check_for_conversion(rtx call_insn)
{
  const char *name;
  const char *real_name;
  rtx fn_name;
  mchp_interesting_fn *match;

  if (GET_CODE(call_insn) != CALL_INSN) abort();
  /* (call_insn (set () (call (name) (size)))) for call returning value, and
     (call_insn (call (name) (size)))          for void call */
  if (GET_CODE(PATTERN(call_insn)) == PARALLEL)
    {
      if (GET_CODE(XVECEXP(PATTERN(call_insn),0,0)) == SET)
        fn_name = XEXP(XEXP(XVECEXP(PATTERN(call_insn),0,0),1),0);
      else fn_name = XEXP(XVECEXP(PATTERN(call_insn),0,0),0);
    }
  else
    {
      if (GET_CODE(PATTERN(call_insn)) == SET)
        fn_name = XEXP(XEXP(PATTERN(call_insn),1),0);
      else fn_name = XEXP(PATTERN(call_insn),0);
    }
  if (mchp_clear_fn_list)
    {
      int i;
      for (i = 0; mchp_fn_list[i].name; i++)
        {
          if (mchp_fn_list[i].encoded_name) free(mchp_fn_list[i].encoded_name);
          mchp_fn_list[i].encoded_name = 0;
          mchp_fn_list[i].function_convertable=1;
        }
      mchp_clear_fn_list = 0;
    }
  switch (GET_CODE(fn_name))
    {
    default:
      return 1;

    case MEM:
      if (GET_CODE(XEXP(fn_name,0)) == SYMBOL_REF)
        {
          name = XSTR(XEXP(fn_name,0),0);
        }
      else
        {
          /* not calling a function directly, fn pointer or other such
             - give up */
          return 1;
        }
      real_name = mchp_strip_name_encoding_helper(name);
      match = mchp_match_conversion_fn(real_name);
      break;
    }
  /* function name not interesting or it is already proven to
     be not-convertable */
  while (match)
    {
      switch (match->conversion_style)
        {
        default:
          abort();  /* illegal conversion style */

        case info_I:
          mchp_handle_io_conversion(call_insn, match);
          break;
        case info_O:
          mchp_handle_io_conversion(call_insn, match);
          break;
        case info_dbl:
          break;

        }
      if (match[1].name &&
          (strcmp(match[1].name, real_name) == 0)) match++;
      else match = 0;
    }
  return 1;
}
#endif  /* defined(C32_SMARTIO_RULES) */

static int mchp_build_prefix(tree decl, int fnear, char *prefix)
{
  char *f = prefix;

  tree address_attr = 0;
  tree space_attr = 0;
  bool is_ramfunc = FALSE;
  int const_rodata = 0;

  SECTION_FLAGS_INT flags = 0;
  const char *ident;
  int section_type_set = 0;
  tree paramtype;

  if (fnear == -1)
    {
      section_type_set = 1;
      fnear = 0;
    }

  address_attr = get_mchp_absolute_address (decl);
  space_attr = get_mchp_space_attribute (decl);
  is_ramfunc = mchp_ramfunc_type_p (decl);

  if (space_attr)
    {
      if (get_identifier("psv") == (TREE_VALUE(TREE_VALUE(space_attr))))
        {
          const_rodata++;
        }
      if (get_identifier("auto_psv") == (TREE_VALUE(TREE_VALUE(space_attr))))
        {
          const_rodata++;
        }
    }

  if (DECL_SECTION_NAME(decl))
    {
      const char *name = TREE_STRING_POINTER(DECL_SECTION_NAME(decl));
      flags = mchp_section_type_flags(0, name, 1);
      if (((flags & SECTION_WRITE) && (!DECL_INITIAL(decl))) ||
          ((flags & SECTION_WRITE) && bss_initializer_p(decl)))
        {
          flags &= ~SECTION_WRITE;
          flags |= SECTION_BSS;
        }
    }
  else
    {
      if ((address_attr) /* || (reverse_attr) */)
        {
          DECL_SECTION_NAME(decl) = build_string(2,"*");
          if (TREE_CODE (decl) == VAR_DECL
              && DECL_SECTION_NAME (decl) != NULL_TREE
              && DECL_INITIAL (decl) == NULL_TREE
              && DECL_COMMON (decl))
            DECL_COMMON (decl) = 0;
        }
      if (TREE_CODE(decl) == STRING_CST)
        flags |= SECTION_READ_ONLY;
    }
  if (TREE_CODE(decl) == VAR_DECL)
    {
      if (!space_attr && TREE_READONLY(decl) && TARGET_EMBEDDED_DATA &&
          (DECL_INITIAL(decl) || (DECL_EXTERNAL(decl))))
        flags |= SECTION_READ_ONLY;
    }
  if (address_attr)
    {
      if (flags & SECTION_ADDRESS)
        {
            if (DECL_NAME(decl) != NULL_TREE)
              {
                ident = IDENTIFIER_POINTER(DECL_NAME(decl));
                warning(0, "address attribute conflicts with section attribute for '%s'",
                        ident);
              }
            else
              {
                warning(0, "address attribute conflicts with section attribute");
              }
        }
      else f += sprintf(f, MCHP_ADDR_FLAG);
    }
  if ((flags & SECTION_PERSIST) || (mchp_function_persistent_p(decl)))
    {
      f += sprintf(f, MCHP_PRST_FLAG);
      section_type_set = 1;
      DECL_COMMON (decl) = 0;
      if (DECL_INITIAL(decl))
        {
            if (DECL_NAME(decl) != NULL_TREE)
              {
                ident = IDENTIFIER_POINTER(DECL_NAME(decl));
                warning(0, "Persistent variable '%s' will not be initialized",
                        ident);
              }
            else
              {
                warning(0, "Persistent variable will not be initialized");
              }
        }
    }
  if (1)
    {
      fnear |= (flags & SECTION_NEAR);
      if ((flags & SECTION_CODE) ||
          (space_attr && (get_identifier("prog") == (TREE_VALUE(TREE_VALUE(space_attr))))))
        {
          if (TREE_CODE(decl) == VAR_DECL)
            f += sprintf(f, MCHP_CONST_FLAG);
          else
            f += sprintf(f, MCHP_PROG_FLAG);
          fnear = 0;
          DECL_COMMON (decl) = 0;
          section_type_set = 1;
        }
      if ((flags & SECTION_WRITE) ||
          is_ramfunc ||
          (space_attr && (get_identifier("data") ==
                          (TREE_VALUE(TREE_VALUE(space_attr))))))
        {
          if (TREE_CODE(decl) == FUNCTION_DECL)
            f += sprintf(f, MCHP_RAMFUNC_FLAG);
          else
            f += sprintf(f, MCHP_DATA_FLAG);
          section_type_set = 1;
        }
      /* we can't ask for a BSS section apart from by using the old naming
       convention or flags in a section directive - but if it is there, we
       should honour it */
      if (flags & SECTION_BSS)
        {
          f += sprintf(f, MCHP_BSS_FLAG);
          section_type_set = 1;
        }
      if ((flags & SECTION_READ_ONLY) || const_rodata)
        {
          f += sprintf(f, MCHP_CONST_FLAG);
          fnear = 0;
          section_type_set = 1;
        }

      if ((!section_type_set) && (!DECL_EXTERNAL(decl)))
        {
          if (!DECL_INITIAL(decl) || bss_initializer_p(decl))
            f += sprintf(f, MCHP_BSS_FLAG);
          else
            f += sprintf(f, MCHP_DATA_FLAG);
        }
      if ((fnear) && !(flags & (SECTION_INFO)))
        {
          f += sprintf(f, MCHP_NEAR_FLAG);
        }
    }

  return fnear;
}

static SECTION_FLAGS_INT validate_identifier_flags(const char *id);

void mchp_subtarget_encode_section_info (tree decl, rtx rtl,
    int first_seen ATTRIBUTE_UNUSED)
{
  char prefix[120] = { 0 };
  int fNear;
  const char *fn_name;
  char *f = prefix;

  switch (TREE_CODE(decl))
    {
    case FUNCTION_DECL:
      fNear = 0;
      fn_name = IDENTIFIER_POINTER(DECL_NAME(decl));
      f += sprintf(f,MCHP_FCNN_FLAG);
      mchp_build_prefix (decl, -1, f);
      break;
    case VAR_DECL:
      fNear = 0;
      if (TREE_READONLY(decl))
        {
          /*
          ** If this is a constant declaration,
          ** and constants are located in code space,
          ** then it cannot be a near declaration.
          */
          fNear = 0;
        }
#if 0 /* Don't use 'near' for small data yet */
      else
        fNear = mips_in_small_data_p(decl);
#endif
      SYMBOL_REF_FLAG(XEXP(rtl, 0)) = mchp_build_prefix(decl, fNear, prefix);
      break;

    default:
      break;
    }
  if ((prefix[0] != 0) == 0) fNear = 0;
  {
    const char *str = XSTR(XEXP (rtl, 0), 0);
    int len = strlen(str);
    const char *stripped_str = mchp_strip_name_encoding_helper(str);
    char *newstr = (char*)xmalloc(len + strlen(prefix) + 1);
    sprintf(newstr, "%s%s", prefix, stripped_str);
    XSTR(XEXP(rtl, 0), 0) = newstr;
    /* previously allocated ? */
    if (stripped_str != str) free((void*)str);
  }
}

/* Return a nonzero value if DECL has a section attribute.  */
#ifndef IN_NAMED_SECTION
#define IN_NAMED_SECTION(DECL) \
  ((TREE_CODE (DECL) == FUNCTION_DECL || TREE_CODE (DECL) == VAR_DECL) \
   && DECL_SECTION_NAME (DECL) != NULL_TREE)
#endif
/*
** A C statement or statements to switch to the appropriate
** section for output of DECL.  DECL is either a `VAR_DECL' node
** or a constant of some sort.  RELOC indicates whether forming
** the initial value of DECL requires link-time relocations.
*/
section *
mchp_select_section (tree decl, int reloc,
                     unsigned HOST_WIDE_INT align ATTRIBUTE_UNUSED)
{
  extern section *
  mergeable_string_section (tree decl ATTRIBUTE_UNUSED,
                            unsigned HOST_WIDE_INT align ATTRIBUTE_UNUSED,
                            unsigned int flags ATTRIBUTE_UNUSED);
  const char *sname;
  const char *ident = 0; /* compiler can't tell that this is intialized */
  rtx rtl;
  SECTION_FLAGS_INT flags = 0;

  if ((TREE_CODE(decl) == FUNCTION_DECL) || (TREE_CODE(decl) == VAR_DECL))
    {
      if (IN_NAMED_SECTION (decl) ||
          lookup_attribute("address", DECL_ATTRIBUTES(decl)) ||
          lookup_attribute("space", DECL_ATTRIBUTES(decl)) ||
          lookup_attribute("persistent", DECL_ATTRIBUTES(decl)) ||
          lookup_attribute("ramfunc", DECL_ATTRIBUTES(decl))
         )
        {
          rtl = DECL_RTL(decl);
          ident = XSTR(XEXP(rtl, 0), 0);
          flags = validate_identifier_flags(ident);
          sname = default_section_name(decl, flags);
          if (flags)
            {
              if (sname)
                {
                  if (!DECL_P (decl))
                    decl = NULL_TREE;
                  return get_named_section (decl, sname, reloc);
                }
            }
        }
    }

  switch (categorize_decl_for_section (decl, reloc))
    {
    case SECCAT_TEXT:
      return text_section;
    case SECCAT_RODATA:
      return readonly_data_section;
    case SECCAT_RODATA_MERGE_STR:
      return mergeable_string_section (decl, align, 0);
    case SECCAT_RODATA_MERGE_STR_INIT:
      return mergeable_string_section (DECL_INITIAL (decl), align, 0);
    case SECCAT_RODATA_MERGE_CONST:
      return mergeable_constant_section (DECL_MODE (decl), align, 0);
    case SECCAT_SRODATA:
      sname = ".sdata2";
      break;
    case SECCAT_DATA:
      return data_section;
    case SECCAT_DATA_REL:
      sname = ".data.rel";
      break;
    case SECCAT_DATA_REL_LOCAL:
      sname = ".data.rel.local";
      break;
    case SECCAT_DATA_REL_RO:
      sname = ".data.rel.ro";
      break;
    case SECCAT_DATA_REL_RO_LOCAL:
      sname = ".data.rel.ro.local";
      break;
    case SECCAT_SDATA:
      sname = ".sdata";
      break;
    case SECCAT_TDATA:
      sname = ".tdata";
      break;
    case SECCAT_BSS:
      if (bss_section)
        return bss_section;
      sname = ".bss";
      break;
    case SECCAT_SBSS:
      sname = ".sbss";
      break;
    case SECCAT_TBSS:
      sname = ".tbss";
      break;
    case SECCAT_EMUTLS_VAR:
      sname = targetm.emutls.var_section;
      break;
    case SECCAT_EMUTLS_TMPL:
      sname = targetm.emutls.tmpl_section;
      break;
    default:
      gcc_unreachable ();
    }

  if (!DECL_P (decl))
    decl = NULL_TREE;
  return get_named_section (decl, sname, reloc);
}

static const char *default_section_name(tree decl, SECTION_FLAGS_INT flags)
{
  static char result[1024];
  char *f;
  int i;
  tree a,is_aligned;
  tree p;
  bool is_rf;

  const char *pszSectionName=0;
  int is_default = 0;
  int len_this_default_name;

  if (current_time == 0) current_time = time(0);
  /*
   * if we have a decl, use its address as the unique section name
   */
  if (decl)
    {
      len_this_default_name = sprintf(this_default_name,"*_%8.8lx%lx",
                                      (unsigned long) decl, current_time);
    }
  else
    {
      len_this_default_name = 1;
      this_default_name[0]='*';
      this_default_name[1]=0;
    }
  f = result;
  *f = 0;
  if (decl)
    {
      is_aligned = lookup_attribute("aligned",
                                    DECL_ATTRIBUTES(decl));
      a = lookup_attribute("address",
                           DECL_ATTRIBUTES(decl));
      p = get_mchp_space_attribute (decl);
      is_rf = mchp_ramfunc_type_p (decl);

      if (DECL_SECTION_NAME (decl))
        {
          pszSectionName = TREE_STRING_POINTER(DECL_SECTION_NAME(decl));
        }

      if (a)
        {
          if (!pszSectionName||(strcmp(pszSectionName,mchp_default_section) == 0))
            f += sprintf(result, "%s,%s(0x%lx)",
                         this_default_name,
                         SECTION_ATTR_ADDRESS,
                         (long unsigned int)TREE_INT_CST_LOW(TREE_VALUE(TREE_VALUE(a))));
          else
            {
              if (((TREE_CODE(decl) == VAR_DECL) && flag_data_sections) ||
                  ((TREE_CODE(decl) == FUNCTION_DECL) && flag_function_sections))
                f += sprintf(result, "%s.%s,%s(0x%lx)",
                             pszSectionName,
                             IDENTIFIER_POINTER(DECL_NAME(decl)),
                             SECTION_ATTR_ADDRESS,
                             (long unsigned int)TREE_INT_CST_LOW(TREE_VALUE(TREE_VALUE(a))));
              else
                f += sprintf(result, "%s,%s(0x%lx)",
                             pszSectionName,
                             SECTION_ATTR_ADDRESS,
                             (long unsigned int)TREE_INT_CST_LOW(TREE_VALUE(TREE_VALUE(a))));
            }
        }
      else if (TREE_CODE(decl) == VAR_DECL)
        {
          if (mchp_function_persistent_p(decl)) /* persist*/
            {
              pszSectionName = SECTION_NAME_PBSS;
            }
          else if (mips_in_small_data_p(decl))
            {
              if (pszSectionName == NULL)
                {
                  if (flags)
                    {
                      if (flags & SECTION_BSS)
                        {
                          pszSectionName = SECTION_NAME_SBSS;
                        }
                      else if (flags & SECTION_WRITE)
                        {
                          pszSectionName = SECTION_NAME_SDATA;
                        }
                    }
                  else
                    pszSectionName = this_default_name;
                }
            }
          if (pszSectionName)
            {
              if (flag_data_sections)
                {
                  f += sprintf (result, "%s.%s", pszSectionName, 
                                IDENTIFIER_POINTER(DECL_NAME(decl)));
                }
              else
                {
                  f += sprintf(result, "%s", pszSectionName);
                }
            }
          else
            {
              if (!is_aligned) is_default = 1;
              f+= sprintf(result,"%s", this_default_name);
            }
        }
      else if (TREE_CODE(decl) == FUNCTION_DECL)
        {
          if (pszSectionName)
            {
#if 1
              if (flag_function_sections && is_rf)
                {
                  f += sprintf(result, "%s.%s",
                               pszSectionName, IDENTIFIER_POINTER(DECL_NAME(decl)));
                }
              else
                {
                  f += sprintf(result, "%s",
                               pszSectionName);
                }
#else
              f += sprintf(result, "%s",
                           pszSectionName);
#endif
            }
          else
            {
              if (!is_aligned) is_default = 1;
              f+= sprintf(result,"%s", this_default_name);
            }
        }
      else
        {
          if (!is_aligned) is_default = 1;
          f+= sprintf(result,"%s", this_default_name);
        }

      if ((!is_default) ||
          (strncmp(result,this_default_name,len_this_default_name)))
        return result;
    }
  if (flags)
    {
      i = 0;
      if ((flags & SECTION_READ_ONLY) && (!TARGET_EMBEDDED_DATA))
        {
          if ((TREE_CODE(decl) == STRING_CST) ||
              (DECL_INITIAL(decl) && TREE_CONSTANT(DECL_INITIAL(decl))))
            {
              const char *name;
              name = SECTION_NAME_CONST;
              while (reserved_section_names[i].section_name)
                {
                  if (((flags ^ reserved_section_names[i].mask) == 0) &&
                      strstr(name, reserved_section_names[i].section_name) == 0)
                    return name;
                  i++;
                }
            }
        }
      else if (flags & SECTION_RAMFUNC)
        {
          if (TREE_CODE(decl) == FUNCTION_DECL)
            {
              const char *name;
              name = SECTION_NAME_RAMFUNC;
              while (reserved_section_names[i].section_name)
                {
                  if (((flags ^ reserved_section_names[i].mask) == 0) &&
                      strstr(name, reserved_section_names[i].section_name) == 0)
                    return name;
                  i++;
                }
            }
        }
      i = 0;
      while (reserved_section_names[i].section_name)
        {
          if ((flags ^ reserved_section_names[i].mask) == 0)
            {
              if (strcmp(reserved_section_names[i].section_name, ".text") == 0)
                {
                  const char *txt = mchp_text_scn;

                  if (!txt) txt = reserved_section_names[i].section_name;
                  if (!flag_function_sections || !decl)  return txt;
#if 1
                  else
                    {
                      char *retval;
                      retval = (char*)xmalloc(strlen(txt)+3+
                                              strlen(IDENTIFIER_POINTER(DECL_NAME(decl))));
                      /* if we are prepending .isr use that instead of the default name
                         of .text until keep attribute is implemented */
                      f +=sprintf(retval, "%s.%s", txt,
                                  IDENTIFIER_POINTER(DECL_NAME(decl)));
                      return retval;
                    }
#endif
                }
              else return reserved_section_names[i].section_name;
            }
          i++;
        }
    }
  return this_default_name;
}


/************************************************************************/
/* TARGET_ASM_NAMED_SECTION target hook.                */
/* Output assembly directives to switch to section pszSectionName.    */
/* The section name will have any user-specifed flags appended.        */
/* The section should have attributes as specified by flags, which is a    */
/* bit mask of the SECTION_* flags defined in output.h.         */
/************************************************************************/
void mchp_asm_named_section(const char *pszSectionName,
                            SECTION_FLAGS_INT flags,
                            tree decl ATTRIBUTE_UNUSED)
{
  if (set_section_stack(pszSectionName, flags) == 0) return;
  mchp_merged_asm_named_section(pszSectionName, flags);
}

static char * mchp_get_named_section_flags (const char *pszSectionName,
    SECTION_FLAGS_INT flags)
{
  char pszSectionFlag[100] = " # Invalid Section Attributes";
  char *f;

  if (pszSectionName == 0) return NULL;
#if 1
  if (strcmp("*", pszSectionName) == 0) return NULL;
#endif
  f = pszSectionFlag;
  lfInExecutableSection = FALSE;
  if (flags & SECTION_BSS)
    {
      f += sprintf(f, "," SECTION_ATTR_BSS);
    }
  if (flags & SECTION_WRITE)
    {
      f += sprintf(f, "," SECTION_ATTR_DATA);
    }
  if (flags & SECTION_CODE)
    {
      f += sprintf(f, "," SECTION_ATTR_CODE);
      lfInExecutableSection = TRUE;
    }
  if (flags & SECTION_READ_ONLY)
    {
      f += sprintf(f, "," SECTION_ATTR_CONST);
    }
  if (flags & SECTION_RAMFUNC)
    {
      f += sprintf(f, "," SECTION_ATTR_RAMFUNC);
    }
  if (flags & SECTION_NEAR)
    {
      f += sprintf(f, "," SECTION_ATTR_NEAR);
    }
  if (flags & SECTION_PERSIST)
    {
      f += sprintf(f, "," SECTION_ATTR_PERSIST);
    }
  if (flags & SECTION_NOLOAD)
    {
      f += sprintf(f, "," SECTION_ATTR_NOLOAD);
    }
  if (flags & SECTION_DEBUG)
    {
      f += sprintf(f, "," SECTION_ATTR_INFO);
    }
  return xstrdup(pszSectionFlag);
}

static void mchp_merged_asm_named_section(const char *pszSectionName,
    SECTION_FLAGS_INT flags)
{
  char* pszSectionFlag;
  pszSectionFlag = mchp_get_named_section_flags (pszSectionName, flags);
#if 1
  fprintf(asm_out_file, "\t.section\t%s%s\n", pszSectionName, pszSectionFlag);
#endif
}


static int mchp_bsearch_rsn_compare(const void *va, const void *vb)
{
  const char *a = (const char *)va;
  const struct reserved_section_names_ *n = (const struct reserved_section_names_ *)vb;

  if (n) return strcmp(a, n->section_name);
  else return 0;
}

static int mchp_bsearch_vsf_compare(const void *va, const void *vb)
{
  const char *a = (const char *)va;
  const struct valid_section_flags_ *f = (const struct valid_section_flags_ *)vb;

  if (f) return strncmp(a, f->flag_name, strlen(f->flag_name));
  else return 0;
}

/* validates a section declaration based on its name and any flags */
static SECTION_FLAGS_INT validate_section_flags(const char *name,
    SECTION_FLAGS_INT attr_flags)
{
  SECTION_FLAGS_INT set_flags = attr_flags;
  struct reserved_section_names_ *r_section = 0;
  struct valid_section_flags_ *v_flags = 0;
  char *f,*fe,comma=0;
  char *flags;
  int first_flag = 1;

  f = 0;
  flags = strchr(name, ',');
  if (flags)
    {
      *flags = 0;
      f = flags+1;
      comma = ',';
    }
  if (name) r_section = (struct reserved_section_names_*)
                          bsearch(name, reserved_section_names,
                                  (sizeof(reserved_section_names) /
                                   sizeof(struct reserved_section_names_)) - 1,
                                  sizeof(struct reserved_section_names_),
                                  mchp_bsearch_rsn_compare);
  if (r_section)
    {
      set_flags |= r_section->mask;
    }
  if (f) do
      {
        fe = strchr(f, ',');
        if (fe)
          {
            *fe = 0;
          }
        /* nasty safe-ctype.h means that we can't use isspace */
        while (*f && ISSPACE(*f)) f++;
        if (*f)
          {
            v_flags = (struct valid_section_flags_ *)
                      bsearch(f, valid_section_flags,
                              (sizeof(valid_section_flags) /
                               sizeof(struct valid_section_flags_)) -1,
                              sizeof(struct valid_section_flags_),
                              mchp_bsearch_vsf_compare);
            if (!v_flags)
              {
                if (first_flag)
                  {
                    char *s;

                    for (s = f; *s; s++)
                      {
                        for (v_flags = valid_section_flags; v_flags->flag_name; v_flags++)
                          {
                            if (*s == v_flags->single_letter_equiv)
                              {
                                if (v_flags->single_letter_equiv == 'b')
                                  {
                                    /* this may be .pbss,b for persistent */
                                    if ((strncmp(name, ".pbss", 5) == 0) &&
                                        ((v_flags->flag_mask & SECTION_PERSIST) == 0)) continue;
                                  }
                                else if (v_flags->single_letter_equiv == 'r')
                                  {
                                    /* 'r' used to be used for .eedata - don't set READ_ONLY for
                                           .eedata section */
                                    if (strncmp(name, ".eedata", 7) == 0) break;
                                  }
                                set_flags |= v_flags->flag_mask;
                                break;
                              }
                          }
                        if (!v_flags->flag_name)
                          {
                            warning(0, "'%c': unrecognized old-style section flag", *s);
                            break;
                          }
                        *s = ' ';
                        comma=' ';
                      }
                    first_flag = 0;
                  }
                else warning(0, "'%s': unrecognized section flag", f);
              }
            else
              {
                set_flags |= v_flags->flag_mask;
              }
            if (fe)
              {
                *fe = ',';
                f = fe+1;
              }
            else break;
          }
        else break;
      }
    while (1);
  if (flags) *flags = comma;
  for (v_flags = valid_section_flags; v_flags->flag_name; v_flags++)
    {
      if ((set_flags & v_flags->flag_mask) &&
          (set_flags & v_flags->incompatible_with))
        {
          error("incompatible section flags for section '%s'", name);
          return set_flags;
        }
    }
  return set_flags;
}

/*
** unsigned int
** TARGET_SECTION_TYPE_FLAGS(tree decl, const char *name, int reloc);
**
** A target hook to choose a set of section attributes for use by
** TARGET_ASM_NAMED_SECTION based on a variable or function decl,
** a section name, and whether or not the declaration's initializer
** may contain runtime relocations.
**
** <decl> is either a FUNCTION_DECL, a VAR_DECL or NULL_TREE.
** If <decl> is null, read-write data should be assumed.
** <reloc> indicates whether the initial value of exp requires
** link-time relocations.
*/
unsigned int
mchp_section_type_flags(tree decl, const char *name,
                        int reloc ATTRIBUTE_UNUSED)
{
  SECTION_FLAGS_INT flag = 0;
  rtx rtl;

  if (decl)
    {
      rtl = DECL_RTL(decl);
      if (rtl && XSTR(XEXP(rtl, 0), 0))
        flag = validate_identifier_flags(XSTR(XEXP(rtl, 0), 0));
    }
  if (name) flag = validate_section_flags(name,flag);
  return flag ;
}

/************************************************************************/
/* Save the current section name.                    */
/************************************************************************/
int set_section_stack(const char *pszSectionName,
                      SECTION_FLAGS_INT pszSectionFlag)
{
  if (!lSectionStack)
    {
      if (freeSectionStack)
        {
          lSectionStack = freeSectionStack;
          freeSectionStack = freeSectionStack->pop;
        }
      else lSectionStack =  (sectionStack *)xcalloc(sizeof(sectionStack),1);
      lSectionStack->pop = 0;
    }
  else if ((lSectionStack->pszFlag == pszSectionFlag) &&
           (pszSectionName[0] != '*') &&
           (strcmp(lSectionStack->pszName, pszSectionName) == 0))
    {
      if (lSectionStack->flags & ss_should_pop) lSectionStack->flags = ss_set;
      return 0;
    }
  else if (lSectionStack->flags & ss_should_pop)
    {
      sectionStack *s;

      s = lSectionStack;
      lSectionStack = s->pop;
      s->pop = freeSectionStack;
      freeSectionStack = s;
    }
  lSectionStack->pszName = xstrdup(pszSectionName);
  lSectionStack->pszFlag = pszSectionFlag;
  lSectionStack->flags |= ss_set;
  return 1;
}

#if 1
void mchp_push_section_name(const char *pszSectionName,
                            SECTION_FLAGS_INT pszSectionFlag)
{
  sectionStack *s;

  if (lSectionStack->flags & ss_should_pop)
    {
      if ((lSectionStack->pszFlag == pszSectionFlag) &&
          (pszSectionName[0] != '*') &&
          (strcmp(lSectionStack->pszName, pszSectionName) == 0))
        {
          /* pushing the section just popped */
          lSectionStack->flags &= ~ss_should_pop;
          return;
        }
      else s = lSectionStack;
    }
  else if (freeSectionStack)
    {
      s = freeSectionStack;
      if (s->pszName) free((void *)s->pszName);  /* avoid leak */
      s->pszName = 0;
      freeSectionStack = s->pop;
    }
  else
    {
      s = (sectionStack *) xcalloc(sizeof(sectionStack),1);
    }
  if (s != lSectionStack) s->pop = lSectionStack;
  s->pszName = xstrdup(pszSectionName);
  s->pszFlag = pszSectionFlag;
  s->flags = 0;
  lSectionStack = s;
  mchp_merged_asm_named_section(pszSectionName, pszSectionFlag);
}
#endif

#if 1
static tree mchp_push_pop_constant_section(tree decl, enum css push,
    const char **section_name)
{
  struct decl_stack
  {
    tree decl;
    struct decl_stack *next;
    int activated;
  };
  static struct decl_stack *my_decl_stack = 0;
  int activated = 0;

  if (push == css_push)
    {
      struct decl_stack *p;

      p = (struct decl_stack *)xcalloc(sizeof(struct decl_stack),1);
      p->next = my_decl_stack;
      p->decl = decl;
      my_decl_stack = p;
    }
  else if (push == css_activate /*activate */)
    {
      /* this can happen iff we are creating code to initialize */
      decl = my_decl_stack ? my_decl_stack->decl : 0;
    }
  else if (push == css_pop /*pop */)
    {
      if (my_decl_stack == 0) abort();
      if (decl != my_decl_stack->decl) abort();
      activated = my_decl_stack->activated;
      my_decl_stack = my_decl_stack->next;
    }
  else if (push == css_tos)
    {
      decl = my_decl_stack ? my_decl_stack->decl : 0;
    }
  if (push == css_push) return decl;
  if (!decl || !DECL_SECTION_NAME(decl))
    {
      const char *force_named_section = 0;
      SECTION_FLAGS_INT flags;
      /*
       * perhaps force a named section based upon boot or secure attributes
       */
      flags = SECTION_READ_ONLY;

      if (force_named_section)
        {
          if (push == css_activate)
            {
              mchp_push_section_name(force_named_section, flags);
              if (my_decl_stack) my_decl_stack->activated = 1;
            }
          else if ((push == css_pop) && (activated)) mchp_pop_section_name();
          else if ((push == css_tos) && (*section_name))
            *section_name = force_named_section;
          return decl;
        }
    }
  if (decl && DECL_SECTION_NAME(decl))
    {
      SECTION_FLAGS_INT flags;
      const char *name = TREE_STRING_POINTER(DECL_SECTION_NAME(decl));

      flags = mchp_section_type_flags(decl, name, 1);
      if (push == css_activate)
        {
          mchp_push_section_name(name, flags);
          my_decl_stack->activated = 1;
        }
      else if ((push == css_pop) && (activated))  mchp_pop_section_name();
      else if ((push == css_tos) && (section_name)) *section_name = name;
      return decl;
    }

  if (push == css_activate)
    {
      if (1)
        switch_to_section(const_section);
    }
  else if ((push == css_tos) && *section_name)
    {
      if (1)
        *section_name = SECTION_NAME_CONST;
    }
  return decl;
}

const char *mchp_pushed_constant_section(void)
{
  const char *name = 0;

  if (mchp_push_pop_constant_section(0, css_tos, &name) == 0)
    {
      name= lSectionStack->pszFlag & SECTION_CONST ? lSectionStack->pszName : name;
    }
  return name;
}

void mchp_push_constant_section(tree decl)
{
  (void) mchp_push_pop_constant_section(decl,css_push,0);
}

void mchp_pop_constant_section(tree decl)
{
  (void) mchp_push_pop_constant_section(decl,css_pop,0);
}


#endif
#if 1
/************************************************************************/
/* Restore a saved section name.                    */
/************************************************************************/
static void mchp_pop_section_name(void)
{
  if (lSectionStack->flags & ss_set)
    {
      /* popping back to a sectionStack item that was set using
         set_section_stack() as a result of a named section ... convert it
         back to the default section */
      lSectionStack->pszName = default_section.pszName;
      lSectionStack->pszFlag = default_section.pszFlag;
      lSectionStack->flags = default_section.flags;
      mchp_merged_asm_named_section(lSectionStack->pszName,
                                    lSectionStack->pszFlag);
    }
  else lSectionStack->flags |= ss_should_pop;
}
#endif

/************************************************************************/
/*
** A C statement (sans semicolon) to output to the stdio stream FILE the
** assembler definition of a local-common-label named NAME whose size is SIZE
** bytes. The variable ROUNDED is the size rounded up to whatever alignment the
** caller wants. Use the expression assemble_name (FILE, NAME) to output the
** name itself; before and after that, output the additional assembler syntax
** for defining the name, and a newline. This macro controls how the assembler
** definitions of uninitialized static variables are output.
*/
/************************************************************************/
void mchp_asm_output_local(FILE *file, char *name, int size ATTRIBUTE_UNUSED,
                           int rounded)
{
  const char *pszSectionName;

  SECTION_FLAGS_INT flags = validate_identifier_flags(name);

  /* if this is a data section, this is now a BSS section */
  if (flags & SECTION_WRITE)
    {
      flags &= ~SECTION_WRITE;
      flags |= SECTION_BSS;
    }
  pszSectionName = default_section_name(0, flags);
  mchp_push_section_name(pszSectionName, flags);

  assemble_name(file, name);
  fputs(":\t.space\t", file);
  fprintf(file, "%u\n", rounded);
  mchp_pop_section_name();
}

/************************************************************************/
/*
** Like ASM_OUTPUT_LOCAL except takes the required alignment as a separate,
** explicit argument. If you define this macro, it is used in place of
** ASM_OUTPUT_LOCAL, and gives you more flexibility in handling the required
** alignment of the variable. The alignment is specified as the number of bits.
**
** NB: this function is used in preference to mchp_asm_output_local
*/
/************************************************************************/
void mchp_asm_output_aligned_decl_local(FILE *file, tree decl, char *name,
                                        int size, int alignment)
{
  const char *pszSectionName;
  SECTION_FLAGS_INT flags = validate_identifier_flags(name);

  /* if this is a data sectino, this is now a BSS section */
  if (flags & SECTION_WRITE)
    {
      flags &= ~SECTION_WRITE;
      flags |= SECTION_BSS;
    }
  pszSectionName = default_section_name(decl, flags);
  mchp_push_section_name(pszSectionName, flags);

  if ((alignment > BITS_PER_UNIT))
    {
      fprintf(file, "\t.align\t%d\n", alignment / BITS_PER_UNIT);
    }
  assemble_name(file, name);
  fputs(":\t.space\t", file);
  fprintf(file, "%u\n", size);
  mchp_pop_section_name();
}

/************************************************************************/
/*
** mchp_text_section_asm_op()
** A C expression whose value is a string, including spacing, containing
** the assembler operation that should precede instructions and read-only
** data. Normally "\t.text" is right.
*/
/************************************************************************/
const char * mchp_text_section_asm_op(void)
{
  static char *pszSection;
  static unsigned int pszSection_len;
  const char *section_name;
  int ramfunc = 0;
  tree space;

  /* TODO */
  if (current_function_decl)
    {
      space = get_mchp_space_attribute(current_function_decl);
      ramfunc = ((get_identifier("data") == (TREE_VALUE(TREE_VALUE(space)))) ||
                 mchp_ramfunc_type_p(current_function_decl)) ;
      section_name = default_section_name(current_function_decl,
                                          ramfunc ? SECTION_RAMFUNC :
                                          SECTION_CODE);
      DECL_SECTION_NAME(current_function_decl) = section_name;
    }
  else
    {
      section_name = mchp_text_scn ? mchp_text_scn : ".text";
    }
  set_section_stack(section_name, ramfunc ? SECTION_RAMFUNC : SECTION_CODE);
  lfInExecutableSection = TRUE;
  if (pszSection == NULL)
    {
      pszSection_len = strlen(section_name);
      pszSection = (char *) xmalloc(pszSection_len+100);
    }
  else if (strlen(section_name) > pszSection_len)
    {
      pszSection_len = strlen(section_name);
      free(pszSection);
      pszSection = (char *)xmalloc(pszSection_len+100);
    }
  sprintf(pszSection, "\t.section\t%s,%s", lSectionStack->pszName,
          ramfunc ? SECTION_ATTR_RAMFUNC :
          SECTION_ATTR_CODE);
  return  (const char *)pszSection;
}

/************************************************************************/
/*
** mchp_data_section_asm_op()
** A C expression whose value is a string, including spacing, containing
** the assembler operation to identify the following data as writable
** initialized data. Normally "\t.data" is right.
*/
/************************************************************************/
const char * mchp_data_section_asm_op(void)
{
  set_section_stack(SECTION_NAME_DATA,SECTION_WRITE);
  lfInExecutableSection = FALSE;

  return((char *)"\t.section\t.data, data");
}

const char * mchp_bss_section_asm_op(void)
{
  set_section_stack(SECTION_NAME_BSS,SECTION_WRITE);
  lfInExecutableSection = FALSE;

  return((char *)"\t.section\t.bss,bss");
}

const char * mchp_sbss_section_asm_op(void)
{
  set_section_stack(SECTION_NAME_SBSS,SECTION_WRITE);
  lfInExecutableSection = FALSE;

  return((char *)"\t.section\t.sbss,bss,near");
}

const char * mchp_sdata_section_asm_op(void)
{
  set_section_stack(SECTION_NAME_SDATA,SECTION_WRITE);
  lfInExecutableSection = FALSE;

  return((char *)"\t.section\t.sdata,data,near");
}

/* validate prefix before an identifier */
static SECTION_FLAGS_INT validate_identifier_flags(const char *id)
{
  const char *f = id;
  SECTION_FLAGS_INT flags = 0;
  int add_section_code_flag = 0;
  struct valid_section_flags_ *v_flags = 0;

  while (f && *f == MCHP_EXTENDED_FLAG[0])
    {
      if (strncmp(f, MCHP_PROG_FLAG, sizeof(MCHP_PROG_FLAG)-1) == 0)
        {
          flags |= SECTION_CODE;
          f += sizeof(MCHP_PROG_FLAG)-1;
        }
      else if (strncmp(f, MCHP_RAMFUNC_FLAG, sizeof(MCHP_RAMFUNC_FLAG)-1) == 0)
        {
          flags |= SECTION_RAMFUNC;
          f += sizeof(MCHP_RAMFUNC_FLAG)-1;
        }
      else if (strncmp(f, MCHP_FCNN_FLAG, sizeof(MCHP_FCNN_FLAG)-1) == 0)
        {
          add_section_code_flag++;
          f += sizeof(MCHP_FCNN_FLAG)-1;
        }
      else if (strncmp(f, MCHP_FCNS_FLAG, sizeof(MCHP_FCNS_FLAG)-1) == 0)
        {
          add_section_code_flag++;
          f += sizeof(MCHP_FCNS_FLAG)-1;
        }
      else if (strncmp(f, MCHP_DATA_FLAG, sizeof(MCHP_DATA_FLAG)-1) == 0)
        {
          flags |= SECTION_WRITE;
          f += sizeof(MCHP_DATA_FLAG)-1;
        }
      else if (strncmp(f, MCHP_CONST_FLAG, sizeof(MCHP_CONST_FLAG)-1) == 0)
        {
          flags |= SECTION_READ_ONLY;
          f += sizeof(MCHP_DATA_FLAG)-1;
        }
      else if (strncmp(f, MCHP_PRST_FLAG, sizeof(MCHP_PRST_FLAG)-1) == 0)
        {
          flags |= SECTION_PERSIST;
          f += sizeof(MCHP_PRST_FLAG)-1;
        }
      else if (strncmp(f, MCHP_NEAR_FLAG, sizeof(MCHP_NEAR_FLAG)-1) == 0)
        {
          flags |= SECTION_NEAR;
          f += sizeof(MCHP_NEAR_FLAG)-1;
        }
      else if (strncmp(f, MCHP_ADDR_FLAG, sizeof(MCHP_ADDR_FLAG)-1) == 0)
        {
          flags |= SECTION_ADDRESS;
          f += sizeof(MCHP_ADDR_FLAG)-1;
        }
      else if (strncmp(f, MCHP_NOLOAD_FLAG, sizeof(MCHP_NOLOAD_FLAG)-1) == 0)
        {
          flags |= SECTION_NOLOAD;
          f += sizeof(MCHP_NOLOAD_FLAG)-1;
        }
      else if (strncmp(f, MCHP_BSS_FLAG, sizeof(MCHP_BSS_FLAG)-1) == 0)
        {
          flags |= SECTION_BSS;
          f += sizeof(MCHP_BSS_FLAG)-1;
        }
      else
        {
          error("Could not determine flags for: '%s'", id);
          return flags;
        }
    }
  if (add_section_code_flag && !(flags & SECTION_RAMFUNC))
    flags |= SECTION_CODE;
  for (v_flags = valid_section_flags; v_flags->flag_name; v_flags++)
    {
      if ((flags & v_flags->flag_mask) && (flags & v_flags->incompatible_with))
        {
          error("incompatible section flags for identifier '%s'",
                mchp_strip_name_encoding(id));
          return flags;
        }
    }
  return flags;
}

/************************************************************************/
/*
** mchp_const_section_asm_op()
**
** Constants go in the code/data window, hence the .const section
** is marked as executable or data (depending on the command-line),
** so that the assembler knows the word width.
*/
/************************************************************************/
const char *mchp_rdata_section_asm_op(void)
{
  static char szSection[32];
#if 1
  lfInExecutableSection = TRUE;

  set_section_stack(SECTION_NAME_CONST, SECTION_READ_ONLY);

  sprintf(szSection, "\t.section\t%s,%s", lSectionStack->pszName,
          SECTION_ATTR_CODE);
#else
  sprintf(szSection, "\t.section\t%s,%s", ".rodata",
          SECTION_ATTR_CODE);
#endif
  return(szSection);
}

void pic32_system_include_paths (const char *sysroot, const char *iprefix,
                                 int cxx_stdinc)
{
  const struct default_include *p;
  size_t len;

  if (!TARGET_LEGACY_LIBC && !TARGET_XC32_LIBCPP)
    return;

  if (iprefix && (len = cpp_GCC_INCLUDE_DIR_len) != 0)
    {
      /* Look for directories that start with the standard prefix.
      "Translate" them, ie. replace /usr/local/lib/gcc... with
      IPREFIX and search them first.  */
      for (p = cpp_include_defaults; p->fname; p++)
        {
          if (/* !p->cplusplus || */ cxx_stdinc)
            {
              /* Should we be translating sysrooted dirs too?  Assume
              that iprefix and sysroot are mutually exclusive, for
              now.  */
              if (sysroot && p->add_sysroot)
                continue;
              if (!strncmp (p->fname, cpp_GCC_INCLUDE_DIR, len))
                {
                  char *str;
                  char *newfname;

                  if (TARGET_XC32_LIBCPP)
                    {
                      newfname = concat (p->fname, "/Cpp/c", NULL);
                      str = concat (iprefix, newfname + len, NULL);
                      free(newfname);
                      add_path (str, SYSTEM, p->cxx_aware, false);
                      newfname = concat (p->fname, "/Cpp", NULL);
                      str = concat (iprefix, newfname + len, NULL);
                      free(newfname);
                      add_path (str, SYSTEM, p->cxx_aware, false);
                    }
                  else if (TARGET_LEGACY_LIBC)
                    {
                      newfname = concat (p->fname, "/lega-c", NULL);
                      str = concat (iprefix, newfname + len, NULL);
                      free(newfname);
                      add_path (str, SYSTEM, p->cxx_aware, false);
                    }

                  str = concat (iprefix, p->fname + len, NULL);
                  add_path (str, SYSTEM, p->cxx_aware, false);

                }
            }
        }
    }

  for (p = cpp_include_defaults; p->fname; p++)
    {
      if (/* !p->cplusplus || */ cxx_stdinc)
        {
          char *str;
          char *str2;
          char *newfname;
          char *newfname2;

          /* Should this directory start with the sysroot?  */
          if (sysroot && p->add_sysroot)
            {
              if (TARGET_XC32_LIBCPP)
                {
                  newfname2 = concat (p->fname, "/Cpp/c", NULL);
                  str2 = concat (sysroot, newfname2, NULL);
                  add_path (str2, SYSTEM, p->cxx_aware, false);
                  free(newfname2);
                  newfname = concat (p->fname, "/Cpp", NULL);
                  str = concat (sysroot, newfname, NULL);
                  add_path (str, SYSTEM, p->cxx_aware, false);
                  free(newfname);
                }
              else if (TARGET_LEGACY_LIBC)
                {
                  newfname = concat (p->fname, "/lega-c", NULL);
                  str = concat (sysroot, newfname, NULL);
                  add_path (str, SYSTEM, p->cxx_aware, false);
                  free(newfname);
                }
              else
                {
                  str = concat (sysroot, p->fname, NULL);
                }
            }
          else
            {
              if (TARGET_XC32_LIBCPP)
                {
                  newfname2 = concat (p->fname, "/Cpp/c", NULL);
                  str2 = update_path (newfname2, p->component);
                  add_path (str2, SYSTEM, p->cxx_aware, false);
                  free(newfname2);
                  newfname = concat (p->fname, "/Cpp", NULL);
                  str = update_path (newfname, p->component);
                  add_path (str, SYSTEM, p->cxx_aware, false);
                  free(newfname);
                }
              else if (TARGET_LEGACY_LIBC)
                {
                  newfname = concat (p->fname, "/lega-c", NULL);
                  str = update_path (newfname, p->component);
                  add_path (str, SYSTEM, p->cxx_aware, false);
                  free(newfname);
                }
              else
                {
                  str = update_path (p->fname, p->component);
                  add_path (str, SYSTEM, p->cxx_aware, false);
                }
            }
        }
    }
}


void push_cheap_rtx(cheap_rtx_list **l, rtx x, tree t, int flag) {
  cheap_rtx_list *item;

  if (l == 0) return;
  item = (struct cheap_rtx_list*) xmalloc(sizeof(cheap_rtx_list));
  gcc_assert(item != NULL);
  item->x = x;
  item->t = t;
  item->flag = flag;
  item->next = *l;

  *l = item;
}

rtx pop_cheap_rtx(cheap_rtx_list **l, tree *t, int *flag) {
  cheap_rtx_list *item;
  rtx result;

  if (l == 0) return 0;
  item = (*l);
  if (item == 0) return 0;
  *l = item->next;
  if (t) *t = item->t;
  if (flag) *flag = item->flag;
  result = item->x;
  free(item);
  item = NULL;
  return result;
}

#endif

