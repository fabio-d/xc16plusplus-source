/*
** pic30-options.h
**
** Copyright (c) 2006 Microchip Technology, Inc.
**
** This file contains data declarations and
** function prototypes related to pic30-specifc
** options processing for the linker.
**
** It is included by the following target-specific
** emulation files:
**
**   ld/emultmpl/pic30_coff.em
**   ld/emultmpl/pic30_elf32.em
**
*/

#include "../../c30_resource/src/c30/c30_flag_definitions.h"

/*
** Externals declared in bfd/coff-pic30.c
*/
extern bfd_boolean pic30_debug;
extern bfd_boolean pic30_data_init;
extern bfd_boolean pic30_has_data_init_option;
extern bfd_boolean pic30_handles;
extern bfd_boolean pic30_has_handles_option;
extern bfd_boolean pic30_pack_data;
extern bfd_boolean pic30_has_pack_data_option;
extern bfd_boolean pic30_has_stack_option;
extern unsigned int pic30_stack_size;
extern bfd_boolean pic30_has_stackguard_option;
extern unsigned int pic30_stackguard_size;
extern bfd_boolean pic30_has_heap_option;
extern bfd_boolean pic30_heap_required;
extern unsigned int pic30_heap_size;
extern bfd_boolean pic30_has_user_startup;
extern bfd_boolean pic30_smart_io;
extern bfd_boolean pic30_has_smart_io_option;
extern bfd_boolean pic30_has_user_default_interrupt;
extern bfd_boolean pic30_allocate;
extern bfd_boolean pic30_has_allocate_option;
extern bfd_boolean pic30_report_mem;
extern bfd_boolean pic30_mafrlcsj;
extern bfd_boolean pic30_mafrlcsj2;
extern bfd_boolean pic30_isr;
extern bfd_boolean pic30_has_isr_option;
extern bfd_boolean pic30_has_fill_upper_option;
extern unsigned int pic30_fill_upper;
extern bfd_boolean pic30_force_link;
extern bfd_boolean pic30_has_force_link_option;
extern bfd_boolean pic30_has_processor_option;
extern bfd_boolean pic30_has_boot_option;
extern bfd_boolean pic30_has_secure_option;
extern bfd_boolean pic30_has_general_option;
extern bfd_boolean pic30_has_user_boot;
extern unsigned int pic30_boot_flash_size;
extern unsigned int pic30_boot_ram_size;
extern bfd_boolean pic30_has_user_secure;
extern unsigned int pic30_secure_flash_size;
extern unsigned int pic30_secure_ram_size;
extern bfd_boolean pic30_select_objects;
extern bfd_boolean pic30_local_stack;
extern bfd_boolean pic30_psv_override;
extern bfd_boolean pic30_eds_stack;
extern bfd_boolean pic30_partition_flash;
extern bfd_boolean pic30_memory_summary;
extern char *memory_summary_arg;
#ifdef PIC30ELF
extern bfd_boolean pic30_memory_usage;
extern bfd_boolean pic30_reserve_const;
extern unsigned long reserve_const_arg;
extern bfd_boolean pic30_pad_flash_option;
extern bfd_vma pad_flash_arg;
extern bfd_boolean pic30_application_id;
extern char *application_id;
extern bfd_boolean pic30_coresident_app;
extern bfd_boolean pic30_inherit_application_info;
extern char *inherited_application;
extern bfd_boolean pic30_preserve_all;
#endif
/* --fill option specific definitions */
extern bfd_boolean pic30_has_fill_option;
extern struct pic30_fill_option *pic30_fill_option_list; 
extern bfd_boolean pic30_has_ivt_option;
extern bfd_boolean pic30_ivt;

extern bfd_boolean pic30_has_managed_psv;
extern bfd_boolean pic30_has_psv_trap_errata;

extern int pic30_boot_ram_flags;
extern int pic30_boot_flash_flags;
extern int pic30_boot_eeprom_flags;
extern int pic30_boot_code_protect_flags;
extern int pic30_boot_write_protect_flags;

extern int pic30_secure_ram_flags;
extern int pic30_secure_flash_flags;
extern int pic30_secure_eeprom_flags;
extern int pic30_secure_code_protect_flags;
extern int pic30_secure_write_protect_flags;

extern int pic30_general_code_protect_flags;
extern int pic30_general_write_protect_flags;

extern unsigned int global_signature_mask;
extern unsigned int global_signature_set;

extern bfd_boolean pic30_pagesize;
extern unsigned int pagesize_arg;

/* SSR# 26079 */
const char *icd2ram = "__ICD2RAM";
bfd_boolean pic30_has_icd2_option = 0;

bfd_boolean pic30_free_blocks_option = 0;

typedef struct cg_option {
  char *name;
  int *flag;
  int flag_val;
  unsigned int *arg;
} cg_option_type;

typedef struct cg_option_list {
  cg_option_type *opt;
  struct cg_option_list *next;
} cg_option_list_type;

cg_option_list_type *pic30_cg_options, *pic30_last_cg_option;

static int process_token PARAMS ((char *, char*, cg_option_type *));
static void parse_option_list PARAMS ((char *, cg_option_type *, char *));
static int  pic30_parse_args PARAMS((int, char **)); 
static void pic30_list_options PARAMS ((FILE *)); 
static void pic30_process_fill_argument PARAMS ((char *fill_arg));

/* Emulation-specific Options */
const char * shortopts = "-Dp:"; /* note: leading "-" is important */

/* Codes used for the long options with no short synonyms.  1000 isn't
   special; it's just an arbitrary non-ASCII char value that is
   different from the range used in lexsup.c  */
enum pic30_options {
  NO_HANDLES_OPTION = 1000,
  NO_DATA_INIT_OPTION,
  HEAP_OPTION,
  PACK_DATA_OPTION,
  STACK_OPTION,
  STACKGUARD_OPTION,
  DATA_INIT_OPTION,
  NO_PACK_DATA_OPTION,
  HANDLES_OPTION,
  SMART_IO_OPTION,
  NO_SMART_IO_OPTION,
  ALLOC_OPTION,
  NO_ALLOC_OPTION,
  REPORT_MEM_OPTION,
  REPORT_MAFRLCSJ_OPTION,
  REPORT_MAFRLCSJ2_OPTION,
  ISR_OPTION,
  NO_ISR_OPTION,
  FILL_UPPER_OPTION,
  FREE_BLOCKS_OPTION,
  DEFSYM_OPTION,
  FORCE_LINK_OPTION,
  NO_FORCE_LINK_OPTION,
#if 1
  SELECT_OBJECTS_OPTION,
  NO_SELECT_OBJECTS_OPTION,
#endif
  BOOT_OPTION,
  SECURE_OPTION,
  GENERAL_OPTION,
  FILL_OPTION,
  LOCAL_STACK_OPTION,
  NO_LOCAL_STACK_OPTION,
  PSV_OVERRIDE_OPTION,
  PARTITION_FLASH,
  MEMORY_SUMMARY,
  MEMORY_USAGE,
  RESERVE_CONST,
  PAD_FLASH,
  APPLICATION_ID,
  CORESIDENT,
  INHERIT_APPLICATION_INFO,
  PRESERVED,
  PRESERVE_ALL,
  NO_IVT_OPTION,
  IVT_OPTION,
  PAGESIZE
};

static struct option longopts[] = 
{ 
  { "data-init", no_argument, NULL, DATA_INIT_OPTION }, 
  { "debug", no_argument, NULL, 'D' }, 
  { "handles", no_argument, NULL, HANDLES_OPTION }, 
  { "heap", required_argument, NULL, HEAP_OPTION }, 
  { "no-data-init", no_argument, NULL, NO_DATA_INIT_OPTION },
  { "no-handles", no_argument, NULL, NO_HANDLES_OPTION }, 
  { "no-pack-data", no_argument, NULL, NO_PACK_DATA_OPTION }, 
  { "pack-data", no_argument, NULL, PACK_DATA_OPTION }, 
  { "stack", required_argument, NULL, STACK_OPTION }, 
  { "smart-io", no_argument, NULL, SMART_IO_OPTION },
  { "no-smart-io", no_argument, NULL, NO_SMART_IO_OPTION },
  { "alloc", no_argument, NULL, ALLOC_OPTION },
  { "no-alloc", no_argument, NULL, NO_ALLOC_OPTION },
  { "report-mem", no_argument, NULL, REPORT_MEM_OPTION },
  { "mafrlcsj", no_argument, NULL, REPORT_MAFRLCSJ_OPTION },
  { "mafrlcsj2", no_argument, NULL, REPORT_MAFRLCSJ2_OPTION },
  { "isr", no_argument, NULL, ISR_OPTION },
  { "no-isr", no_argument, NULL, NO_ISR_OPTION },
  { "ivt", no_argument, NULL, IVT_OPTION },
  { "no-ivt", no_argument, NULL, NO_IVT_OPTION },
  { "fill-upper", required_argument, NULL, FILL_UPPER_OPTION },
  { "free-blocks", no_argument, NULL, FREE_BLOCKS_OPTION },
  { "defsym", required_argument, NULL, DEFSYM_OPTION },
  { "force-link", no_argument, NULL, FORCE_LINK_OPTION },
  { "no-force-link", no_argument, NULL, NO_FORCE_LINK_OPTION },
#if 1
  { "select-objects", no_argument, NULL, SELECT_OBJECTS_OPTION },
  { "no-select-objects", no_argument, NULL, NO_SELECT_OBJECTS_OPTION },
#endif
  { "processor", required_argument, NULL, 'p' },
  { "boot", required_argument, NULL, BOOT_OPTION },
  { "secure", required_argument, NULL, SECURE_OPTION },
  { "general", required_argument, NULL, GENERAL_OPTION },
  { "stackguard", required_argument, NULL, STACKGUARD_OPTION },
  { "fill", required_argument, NULL, FILL_OPTION },
  { "local-stack", no_argument, NULL, LOCAL_STACK_OPTION},
  { "no-local-stack", no_argument, NULL, NO_LOCAL_STACK_OPTION},
  { "psv-override", no_argument, NULL, PSV_OVERRIDE_OPTION },
  { "partition", no_argument, NULL, PARTITION_FLASH },
  { "memorysummary", required_argument, NULL, MEMORY_SUMMARY },
  { "memory-usage",  no_argument, NULL, MEMORY_USAGE },
  { "reserve-const", optional_argument, NULL, RESERVE_CONST },
  { "pad-flash", optional_argument, NULL, PAD_FLASH },
  { "application-id", required_argument, NULL, APPLICATION_ID },
  { "coresident", no_argument, NULL, CORESIDENT },
  { "inherit-application-info", required_argument, NULL, INHERIT_APPLICATION_INFO },
  { "preserved", required_argument, NULL, PRESERVED },
  { "preserve-all", no_argument, NULL, PRESERVE_ALL },
  { "pagesize", required_argument, NULL, PAGESIZE },
  { NULL,        no_argument,       NULL, 0                } 
}; 
