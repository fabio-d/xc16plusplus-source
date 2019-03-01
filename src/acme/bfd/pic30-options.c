/*
** pic30-options.c
**
** Copyright (c) 2006 Microchip Technology, Inc.
**
** This file contains pic30-specifc options
** processing for the linker.
**
** It is included by the following target-specific
** emulation files:
**
**   ld/emultmpl/pic30_coff.em
**   ld/emultmpl/pic30_elf32.em
**
*/

#include <errno.h>

/*
** list_options()
**
** This function is called by the --help option.
*/
static void 
pic30_list_options (file) 
     FILE * file; 
{ 
  fprintf (file, _("  --boot LIST            Specify options for boot segment\n"));
  fprintf (file, _("  --data-init            Initialize data memory (default)\n")); 
  fprintf (file, _("  --no-data-init         Don't initialize data memory\n")); 
  fprintf (file, _("  -D,--debug             Produce linker debugging messages\n")); 
  fprintf (file, _("  --handles              Create jump table for"
                   " function pointers (default)\n")); 
  fprintf (file, _("  --no-handles           Don't create jump table for"
                   " function pointers\n")); 
  fprintf (file, _("  --fill-upper VALUE     Set fill value for upper byte of data"
                   " (default = 0)\n")); 
  fprintf (file, _("  --force-link           Force linking of objects that may not"
                   " be compatible\n")); 
  fprintf (file, _("  --no-force-link        Don't force linking (default)\n")); 
  fprintf (file, _("  --general LIST         Specify options for general segment\n")); 
  fprintf (file, _("  --heap SIZE            Create heap of SIZE bytes\n")); 
  fprintf (file, _("  --isr                  Create interrupt function for "
                     " unused vectors (default)\n"
                   "                         and fill unused slots wiht this "
                     "function\n")); 
  fprintf (file, _("  --no-isr               Don't create interrupt function"
                     " for unused vectors,\n"
                   "                         do not fill unused vector slots\n")); 
  fprintf (file, _("  --ivt                  Have the linker create an IVT/AIVT (default) \n"));
  fprintf (file, _("  --no-ivt               Do not have the linker create an IVT/AIVT\n"));
  fprintf (file, _("  -p,--processor PROC    Specify the target processor"
                   " (e.g., 30F2010)\n")); 
  fprintf (file, _("  --pack-data            Use upper byte of program memory"
                     " to store data (default)\n")); 
  fprintf (file, _("  --no-pack-data         Don't use upper byte of program memory"
                   " to store data\n")); 
  fprintf (file, _("  --report-mem           Report memory usage to console\n")); 
  fprintf (file, _("  --secure LIST          Specify options for secure segment\n"));
#if 1
  fprintf (file, _("  --select-objects       Select library objects based on"
                   " options (default)\n"));
  fprintf (file, _("  --no-select-objects    Don't select library objects based"
                   " on options\n")); 
#endif
  fprintf (file, _("  --smart-io             Merge I/O library functions (default)\n")); 
  fprintf (file, _("  --no-smart-io          Don't merge I/O library functions\n")); 
  fprintf (file, _("  --stack SIZE           Set minimum stack to SIZE bytes"
                   " (default=16)\n")); 
  fprintf (file, _("  --stackguard SIZE      Set stack guardband to SIZE bytes"
                   " (default=16)\n")); 
  fprintf (file, _("  --psv-override         Override PSV safegaurds when"
                   " allocating data memory\n"));
  fprintf (file, _("  --local-stack          Prevent allocating the stack in"
                   " extended data space memory (default)\n"));
  fprintf (file, _("  --no-local-stack       Allow allocating the stack in"
			  " extended data space memory\n"));
  fprintf (file, _("  --partition            Specify that a memory partition"
                   " is being used\n"));
#if PIC30ELF
  fprintf (file, _("  --application-id=name  duplicate external symbols for"
                   " application <name>\n"));
  fprintf (file, _("  --memory-usage         generate static tables with"
                   " memory usage for current application\n"));
  fprintf (file, _("  --reserve-const=size   reserve up to size bytes for"
                   " const section (max 32K)\n"));
  fprintf (file, _("  --pad-flash[=size]     pad output flash pages\n"));
  fprintf (file, _("  --coresident           link for coresident application\n"));
  fprintf (file, _("  --preserved=app        application from which to preserve data values\n"));
  fprintf (file, _("  --preserve-all         mark all data objects preserved, unless marked for update\n"));
#endif
  fprintf (file, _("  --no-psrd-psrd-check   Do not scan linked executable for psrd psrd violations\n"));
  fprintf (file, _("  --add-flags-code       Add section flags to a code section on link\n"));
  fprintf (file, _("  --add-flags-data       Add section flags to a data section on link\n"));

} /* static void pic30_list_options () */


/*
** CodeGuard options for boot and secure segments
**
** These options may be specified on the command line.
** Options are collected and later validated against a
** device-specific list of supported settings loaded
** from the resource file.
*/
static cg_option_type boot_options[] = 
{ 
  { "ram_size",
     &pic30_has_user_boot,    1, &pic30_boot_ram_size }, 
  { "flash_size",
     &pic30_has_user_boot,    1, &pic30_boot_flash_size },

  { "no_ram",            0, BOOT | RAM | NONE, 0 }, 
  { "small_ram",         0, BOOT | RAM | SMALL, 0 }, 
  { "medium_ram",        0, BOOT | RAM | MEDIUM, 0 }, 
  { "large_ram",         0, BOOT | RAM | LARGE, 0 }, 

  { "no_flash",          0, BOOT | FLASH | NONE, 0 }, 
  { "small_flash_std",   0, BOOT | FLASH | SMALL | STANDARD, 0 }, 
  { "medium_flash_std",  0, BOOT | FLASH | MEDIUM | STANDARD, 0 }, 
  { "large_flash_std",   0, BOOT | FLASH | LARGE | STANDARD, 0 }, 
  { "small_flash_high",  0, BOOT | FLASH | SMALL | HIGH, 0 }, 
  { "medium_flash_high", 0, BOOT | FLASH | MEDIUM | HIGH, 0 }, 
  { "large_flash_high",  0, BOOT | FLASH | LARGE | HIGH, 0 },

  { "no_eeprom",         0, BOOT | EEPROM | NONE, 0 }, 
  { "eeprom",            0, BOOT | EEPROM | SMALL, 0 }, 

  { "no_write_protect",  0, BOOT | FLASH | WRITE_PROTECT | OFF, 0 }, 
  { "write_protect",     0, BOOT | FLASH | WRITE_PROTECT | ON, 0 }, 
  { NULL,   0,   0,  0  } 
};

static cg_option_type secure_options[] = 
{ 
  { "ram_size",
     &pic30_has_user_secure, 1, &pic30_secure_ram_size }, 
  { "flash_size",
     &pic30_has_user_secure, 1, &pic30_secure_flash_size }, 

  { "no_ram",            0, SECURE | RAM | NONE, 0 }, 
  { "small_ram",         0, SECURE | RAM | SMALL, 0 }, 
  { "medium_ram",        0, SECURE | RAM | MEDIUM, 0 }, 
  { "large_ram",         0, SECURE | RAM | LARGE, 0 }, 

  { "no_flash",          0, SECURE | FLASH | NONE, 0 }, 
  { "small_flash_std",   0, SECURE | FLASH | SMALL  | STANDARD, 0 }, 
  { "medium_flash_std",  0, SECURE | FLASH | MEDIUM | STANDARD, 0 }, 
  { "large_flash_std",   0, SECURE | FLASH | LARGE  | STANDARD, 0 }, 
  { "small_flash_high",  0, SECURE | FLASH | SMALL  | HIGH, 0 }, 
  { "medium_flash_high", 0, SECURE | FLASH | MEDIUM | HIGH, 0 }, 
  { "large_flash_high",  0, SECURE | FLASH | LARGE  | HIGH, 0 },

  { "no_eeprom",         0, SECURE | EEPROM | NONE, 0 }, 
  { "small_eeprom",      0, SECURE | EEPROM | SMALL, 0 }, 
  { "medium_eeprom",     0, SECURE | EEPROM | MEDIUM, 0 }, 
  { "large_eeprom",      0, SECURE | EEPROM | LARGE, 0 }, 

  { "no_write_protect",  0, SECURE | FLASH | WRITE_PROTECT | OFF, 0 }, 
  { "write_protect",     0, SECURE | FLASH | WRITE_PROTECT | ON, 0 }, 
  { NULL,   0,   0,  0  } 
};

static cg_option_type general_options[] = 
{ 
  { "no_write_protect",  0, GENERAL | FLASH | WRITE_PROTECT | OFF, 0 }, 
  { "write_protect",     0, GENERAL | FLASH | WRITE_PROTECT | ON, 0 }, 
  /* Code_protect options apply to general segment only.
     For consistency sake, they should have the GENERAL bit set, but
     c30_device.info is not built that way, so we leave it out. */
  { "no_code_protect",   0, FLASH | CODE_PROTECT  | NONE, 0 }, 
  { "code_protect_std",  0, FLASH | CODE_PROTECT  | ON | STANDARD, 0 }, 
  { "code_protect_high", 0, FLASH | CODE_PROTECT  | ON | HIGH, 0 }, 
  { NULL,   0,   0,  0  } 
};


/*
** add_cg_option
*/
static void add_cg_option(cg_option_type * opt)
{
  cg_option_list_type *next;

  if (!pic30_cg_options) {
    pic30_cg_options = xmalloc(sizeof(cg_option_list_type));
    memset(pic30_cg_options, 0, sizeof(cg_option_list_type));
    pic30_last_cg_option = pic30_cg_options;
  }

  next = xmalloc(sizeof(cg_option_list_type));
  next->opt = opt;
  next->next = 0;

  pic30_last_cg_option->next = next;
  pic30_last_cg_option = next;
}


/*
** process_token()
**
** look up a token in an options table
**
** return value: 1=success, 0=fail
*/
static int process_token(tok, list, opt)
  char *tok, *list;
  cg_option_type *opt;
{
  unsigned int i,result = 0;

  while (1) {
    if (strcmp( opt->name, tok) == 0) {
      result = 1;
/*       printf("token: %s\n", opt->name); */
      /*
      ** If a flag word is defined, set it.
      ** Otherwise add it to the option list.
      */
      if (opt->flag) *(opt->flag) = opt->flag_val;
      else add_cg_option(opt);
      if (opt->arg) {
        i = tok - list + strlen(tok) + 1;
        *(opt->arg) = strtol(&list[i],0,0);
/*         printf("arg: %d\n", *(opt->arg)); */
        (void) strtok(0, ",:");
      }
      break;
    }
    opt++;
    if (!opt->name) break;
  };
  return result;
}

/*
** parse_option_list()
**
** Parse the [boot,secure] option list
*/
#define MAX_OPTION_LIST_LEN 80
static void parse_option_list(name, opt, list)
  cg_option_type *opt;
  char *name,*list;
{
  char s[MAX_OPTION_LIST_LEN];
  char *lst,*tok;
  unsigned int i,len;

  /* make a local copy, lower case */
  lst = strncpy(s, list, sizeof(s));
  len = strlen(lst);
  for(i = 0; i < len; i++)
    s[i] = tolower(s[i]);

  tok = strtok(lst, "=,:");
  while (tok) {
    if (!process_token(tok, list, opt))
        einfo(_("%P%F: Error: %s is not a valid %s option\n"), tok, name);
    tok = strtok(0, "=,:");
  }
}

static void pic30_init_fill_option_list (struct pic30_fill_option **lst)
{
  *lst = ((struct pic30_fill_option *)
         xmalloc(sizeof(struct pic30_fill_option)));
  (*lst)->next = 0;
  (*lst)->expr.values_range = NULL;
  (*lst)->expr.base_value = 0;
  (*lst)->expr.addened = 0;
  (*lst)->loc.unused = TRUE;
  (*lst)->loc.address = 0;
  (*lst)->loc.end_address = 0;
  (*lst)->fill_section_list = NULL;
}

static void pic30_create_fill_option (struct pic30_fill_option *option)
{
  option->next = 0;
  option->expr.values_range = 0;
  option->expr.base_value = 0;
  option->expr.addened = 0;
  option->loc.unused = TRUE;
  option->loc.address = 0;
  option->loc.end_address = 0;
  option->fill_section_list = NULL;
  option->fill_width = 3;
  option->range_size = 0;
}


static void pic30_append_option_to_list (struct pic30_fill_option *lst,
                                         struct pic30_fill_option *option)
{
  struct pic30_fill_option *o, *tail;
  if (!(lst))
    return;
  /* find the tail */
  for (o = lst; o != NULL; o = o->next)
    tail = o;
  /* append the new option */
  tail->next = option;
}  

static void
pic30_process_fill_argument (char * fill_arg)
{
   char *expression = NULL;
   char *location = NULL;
   struct pic30_fill_option *option;
   char *LHS_operand = NULL;
   char *RHS_operand = NULL;
   char *addr = NULL;
   char *end_addr = NULL;
   char *width = NULL;
   int value = 0; 
   const char *fill_warn = "Incorrect format for fill argument\n";
      if (strncmp(fill_arg, "@", 1) == 0)
        {
           einfo(_("%P: Warning: %s"), fill_warn);
           return;}

      expression = strtok(fill_arg, "@");
      location = strtok(NULL, "@");
      if (expression)
        {
         if (strchr(expression, ':'))
           {
            width = strtok(expression, ":");
            expression = strtok(NULL,":");
           }
#if 0
         if (width && (*width == 'w'))
           (void)sscanf((width+1), "%i", &fill_width);
#endif
         /* create the list options */
         if (!pic30_fill_option_list)
             pic30_init_fill_option_list(&pic30_fill_option_list);
         option = ((struct pic30_fill_option *)
                  xmalloc(sizeof(struct pic30_fill_option)));
         pic30_create_fill_option(option);
         if (width && (*width == 'w'))
           (void)sscanf((width+1), "%i", &(option->fill_width));
#if 1      
         if ((option->fill_width != 3) && (option->fill_width != 1)){
           einfo(_("%P: Warning: You can't use a width_value of %d."
                   "You can only specify one byte or"
                   " one instruction word (3 bytes, the default)."
                   " The defult width will be used.\n"),
                   option->fill_width);
           option->fill_width = 3;}
#endif
         pic30_init_section_list(&option->fill_section_list);

         /* expression is a changing value */
         char *inc = strstr(expression, "+=");
         char *dec = strstr(expression, "-=");
         if (inc || dec)
           {
            RHS_operand = inc? inc + 2 : dec + 2;
            if (inc) *inc = '\0'; else *dec = '\0';
            LHS_operand = expression;
            (void)sscanf(LHS_operand, "%i", &(option->expr.base_value));
            (void)sscanf(RHS_operand, "%i", &(option->expr.addened));
            if (dec)
              option->expr.addened = -option->expr.addened;
            if (option->fill_width == 1){
              option->expr.base_value &= 0xFF;
              option->expr.addened &= 0xFF;}
           }
         /* expression is a range of values */
         else if (strchr(expression, ','))
           {
            int count = 0;
            char *token = (( char *) malloc(strlen(expression)));
            char * brkt;
            char *value_token;
            char *buff;
            strcpy(token, expression);
            for (value_token = strtok(token, ","); value_token;
                 value_token = strtok(NULL, ","))
               count++; /*get the range size*/
            option->range_size = count;
            free(token);
            buff = malloc((count * option->fill_width) * sizeof(char));
            option->expr.values_range = buff;
            for (value_token = strtok(expression, ","); value_token;
                 value_token = strtok(NULL, ","))
               {
                (void)sscanf(value_token, "%i", &value);
                if (option->fill_width == 1)
                  *buff++ = value & 0xFF;
                else {
                  *buff++ = value & 0xFF;
                  *buff++ = (value >> 8) & 0xFF;
                  *buff++ = (value >> 16) & 0xFF;}
               }
          
           }
        else {
          (void)sscanf(expression, "%i", &value);
          if (option->fill_width == 1)
            value &= 0xFF;
          option->expr.base_value = value;}
        }
     else {
           einfo(_("%P: Warning: %s"), fill_warn); 
           return;}
     if (location)
       {
        int read_val = 0;
        if (strcmp(location, "unused") != 0)
          { option->loc.unused = FALSE;
        
            addr = strtok(location, ":");
            end_addr = strtok(NULL, ":");
            read_val = sscanf(addr, "%i", &(option->loc.address));
            if (end_addr)
              read_val = sscanf(end_addr, "%i", &(option->loc.end_address)); 
            if ((read_val == 0) || 
                (option->loc.end_address < option->loc.address)) {
             einfo(_("%P: Warning: Bad location specified for fill option. "
                    "Option will be ignored.\n"));
             return;
            }
          }
       }
  pic30_append_option_to_list(pic30_fill_option_list, option);
  return;
}

/*
** parse_args()
**
** This function is called for each command line option.
*/
static int 
pic30_parse_args (argc, argv) 
     int     argc; 
     char ** argv; 
{ 
  int        longind; 
  int        optc; 
  int        prevoptind = optind; 
  int        prevopterr = opterr; 
  int        wanterror; 
  static int lastoptind = -1; 

  const char *data_init_option_err = "--data-init and --no-data-init";
  const char *handles_option_err   = "--handles and --no-handles";
  const char *pack_data_option_err = "--pack-data and --no-pack-data";
  const char *smart_io_option_err  = "--smart-io and --no-smart-io";
  const char *alloc_option_err     = "--alloc and --no-alloc";
  const char *isr_option_err       = "--isr and --no-isr";
  const char *ivt_option_err       = "--ivt and --no-ivt";
  const char *option_err = " options cannot be used together\n";
  const char *fill_upper_warn = "fill-upper value truncated to 8 bits\n";
  const char *force_link_option_err = "--force-link and --no-force-link";
  const char *proc_option_err = "unknown processor";
  const char *proc_option_warn = "multiple processor options specified\n";
/*   const char *boot_option_warn = "multiple boot options specified\n"; */
/*   const char *secure_option_warn = "multiple secure options specified\n"; */
/*   const char *general_option_warn = "multiple general options specified\n"; */
  char *endptr; /* endptr needed for strtol */
  if (lastoptind != optind) 
    opterr = 0; 
  
  wanterror  = opterr; 
  lastoptind = optind; 
  optc   = getopt_long_only (argc, argv, shortopts, longopts, & longind); 
  opterr = prevopterr; 
  switch (optc) 
    { 
    default: 
      if (wanterror) 
        xexit (1); 
      optind =  prevoptind; 
      return 0;
    case 'D':
      pic30_debug = TRUE;
      break;
    case HEAP_OPTION:
      pic30_has_heap_option = TRUE;
      if (strstr(optarg, "0x") == 0)
        pic30_heap_size = atoi(optarg);
      else
        (void) sscanf(optarg, "%x", &pic30_heap_size);
      break;
    case DATA_INIT_OPTION:
      if (pic30_has_data_init_option && (!pic30_data_init))
        einfo(_("%P%F: Error: %s%s"), data_init_option_err, option_err);
      pic30_data_init = TRUE;
      pic30_has_data_init_option = TRUE;
      break;
    case NO_DATA_INIT_OPTION:
      if (pic30_has_data_init_option && (pic30_data_init))
        einfo(_("%P%F: Error: %s%s"), data_init_option_err, option_err);
      pic30_data_init = FALSE;
      pic30_has_data_init_option = TRUE;
      break;
    case HANDLES_OPTION:
      if (pic30_has_handles_option && (!pic30_handles))
        einfo(_("%P%F: Error: %s%s"), handles_option_err, option_err);
      pic30_handles = TRUE;
      pic30_has_handles_option = TRUE;
      break;
    case NO_HANDLES_OPTION:
      if (pic30_has_handles_option && (pic30_handles))
        einfo(_("%P%F: Error: %s%s"), handles_option_err, option_err);
      pic30_handles = FALSE;
      pic30_has_handles_option = TRUE;
      break;
    case PACK_DATA_OPTION:
      if (pic30_has_pack_data_option && (!pic30_pack_data))
        einfo(_("%P%F: Error: %s%s"), pack_data_option_err, option_err);
      pic30_pack_data = TRUE;
      pic30_has_pack_data_option = TRUE;
      break;
    case NO_PACK_DATA_OPTION:
      if (pic30_has_pack_data_option && (pic30_pack_data))
        einfo(_("%P%F: Error: %s%s"), pack_data_option_err, option_err);
      pic30_pack_data = FALSE;
      pic30_has_pack_data_option = TRUE;
      break;
    case STACK_OPTION:
      pic30_has_stack_option = TRUE;
      if (strstr(optarg, "0x") == 0) {
        int i = atoi(optarg);

        if (i<0)
	  einfo(_("%P%F: Error: Invalid argument to --stack"));
        pic30_stack_size = atoi(optarg);
      } else
        (void) sscanf(optarg, "%x", &pic30_stack_size);
      break;
    case STACKGUARD_OPTION:
      pic30_has_stackguard_option = TRUE;
      if (strstr(optarg, "0x") == 0)
        pic30_stackguard_size = atoi(optarg);
      else
        (void) sscanf(optarg, "%x", &pic30_stackguard_size);
      break;
    case SMART_IO_OPTION:
      if (pic30_has_smart_io_option && (!pic30_smart_io))
        einfo(_("%P%F: Error: %s%s"), smart_io_option_err, option_err);
      pic30_smart_io = TRUE;
      pic30_has_smart_io_option = TRUE;
      break;
    case NO_SMART_IO_OPTION:
      if (pic30_has_smart_io_option && (pic30_smart_io))
        einfo(_("%P%F: Error: %s%s"), smart_io_option_err, option_err);
      pic30_smart_io = FALSE;
      pic30_has_smart_io_option = TRUE;
      break;
    case ALLOC_OPTION:
      if (pic30_has_allocate_option && (!pic30_allocate))
        einfo(_("%P%F: Error: %s%s"), alloc_option_err, option_err);
      pic30_allocate = TRUE;
      pic30_has_allocate_option = TRUE;
      break;
    case NO_ALLOC_OPTION:
      if (pic30_has_allocate_option && (pic30_allocate))
        einfo(_("%P%F: Error: %s%s"), alloc_option_err, option_err);
      pic30_allocate = FALSE;
      pic30_has_allocate_option = TRUE;
      break;
    case REPORT_MEM_OPTION:
      pic30_report_mem = TRUE;
      break;
    case REPORT_MAFRLCSJ_OPTION:
      pic30_mafrlcsj = TRUE;
      break;
    case REPORT_MAFRLCSJ2_OPTION:
      pic30_mafrlcsj2 = TRUE;
      break;
    case ISR_OPTION:
      if (pic30_has_isr_option && (!pic30_isr))
        einfo(_("%P%F: Error: %s%s"), isr_option_err, option_err);
      pic30_isr = TRUE;
      pic30_has_isr_option = TRUE;
      break;
    case NO_ISR_OPTION:
      if (pic30_has_isr_option && (pic30_isr))
        einfo(_("%P%F: Error: %s%s"), isr_option_err, option_err);
      pic30_isr = FALSE;
      pic30_has_isr_option = TRUE;
      break;
    case IVT_OPTION:
      if (pic30_has_ivt_option && (!pic30_ivt))
        einfo(_("%P%F: Error: %s%s"), ivt_option_err, option_err);
      pic30_ivt = TRUE;
      pic30_has_ivt_option = TRUE;
      break;
    case NO_IVT_OPTION:
      if (pic30_has_ivt_option && (pic30_ivt))
        einfo(_("%P%F: Error: %s%s"), ivt_option_err, option_err);
      pic30_ivt = FALSE;
      pic30_has_ivt_option = TRUE;
      break;
    case FILL_UPPER_OPTION:
      if (strstr(optarg, "0x") == 0)
        pic30_fill_upper = atoi(optarg);
      else
        (void) sscanf(optarg, "%x", &pic30_fill_upper);
      if (pic30_fill_upper > 255) {
        einfo(_("%P: Warning: %s"), fill_upper_warn);
        pic30_fill_upper &= 0xFF;
      }
      pic30_has_fill_upper_option = TRUE;
      break;
    case FORCE_LINK_OPTION:
      if (pic30_has_force_link_option && (!pic30_force_link))
        einfo(_("%P%F: Error: %s%s"), force_link_option_err, option_err);
      pic30_force_link = TRUE;
      pic30_has_force_link_option = TRUE;
      break;
    case NO_FORCE_LINK_OPTION:
      if (pic30_has_force_link_option && (pic30_force_link))
        einfo(_("%P%F: Error: %s%s"), force_link_option_err, option_err);
      pic30_force_link = FALSE;
      pic30_has_force_link_option = TRUE;
      break;
#if 1
    case SELECT_OBJECTS_OPTION:
      pic30_select_objects = TRUE;
      break;
    case NO_SELECT_OBJECTS_OPTION:
      pic30_select_objects = FALSE;
      break;
#endif
    case 'p':
      global_PROCESSOR = pic30_get_machine (optarg);
      if (global_PROCESSOR == 0)
        einfo(_("%P%F: Error: %s %s\n"), proc_option_err, optarg);
      if (pic30_has_processor_option)
        einfo(_("%P: Warning: %s"), proc_option_warn);
      pic30_has_processor_option = TRUE;
      break;
    case BOOT_OPTION:
      /* we allow mulitple boot options */
      pic30_has_boot_option = TRUE;
      parse_option_list("boot", boot_options, optarg);
      break;
    case SECURE_OPTION:
      /* we allow mulitple secure options */
      pic30_has_secure_option = TRUE;
      parse_option_list("secure", secure_options, optarg);
      break;
    case GENERAL_OPTION:
      /* we allow mulitple general options */
      pic30_has_general_option = TRUE;
      parse_option_list("general", general_options, optarg);
      break;
    case FREE_BLOCKS_OPTION:
      pic30_free_blocks_option = TRUE;
      break;
    case FILL_OPTION:
      pic30_process_fill_argument (optarg);
      pic30_has_fill_option = TRUE;
      break;
    case NO_LOCAL_STACK_OPTION:
      pic30_local_stack = FALSE;
      break;
    case LOCAL_STACK_OPTION:
      pic30_local_stack = TRUE;
      break;
    case DEFSYM_OPTION:
    /*
    ** SSR# BIN30-28: Check for out-of-range parameter
    */
      {
        char *p = strstr(optarg, "=");

        if (p) {
          errno = 0;
          (void) bfd_scan_vma(++p, NULL, 0);
          if (errno)
            einfo(_("%P%F: Error: --defsym parameter is out of range\n"));
        }
      }
    
    /*
    ** SSR# 26079: If __ICD2RAM is defined on the command line,
    ** make a note and let normal option processing continue.
    */
      if (strstr(optarg, icd2ram) != 0)
        pic30_has_icd2_option = 1;
      optind =  prevoptind; 
      return 0;
    case PSV_OVERRIDE_OPTION:
      pic30_psv_override = TRUE;
      break;
    case PARTITION_FLASH:
      pic30_partition_flash = TRUE;
      break;
    case MEMORY_SUMMARY:
      pic30_memory_summary = TRUE;
      memory_summary_arg = optarg;
      break;
#ifdef PIC30ELF
    case MEMORY_USAGE:
      pic30_memory_usage = TRUE;
      break;
    case RESERVE_CONST:
      pic30_reserve_const = TRUE;
      if (optarg)
      {
        if ((strstr(optarg, "0x") == 0) && (strstr(optarg, "0X") == 0))
          reserve_const_arg = atol(optarg);
        else
          (void) sscanf(optarg, "%x", &reserve_const_arg);
      }
      break;
    case PAD_FLASH:
      pic30_pad_flash_option = TRUE;
      if (optarg)
      {
        if ((strstr(optarg, "0x") == 0) && (strstr(optarg, "0X") == 0))
          pad_flash_arg = atol(optarg);
        else
          (void) sscanf(optarg, "%x", &pad_flash_arg);
      }
      break;
    case APPLICATION_ID:
      pic30_application_id = TRUE;
      application_id = optarg;
      break;
    case CORESIDENT:
      pic30_coresident_app = TRUE;
      break;
    case INHERIT_APPLICATION_INFO:
      pic30_inherit_application_info = TRUE;
      inherited_application = optarg;
      lang_add_input_file (optarg, lang_input_file_is_file_enum,
                               (char *) NULL);
      break;
    case PRESERVED:
      pic30_preserve_application_info = TRUE;
      preserved_application = optarg;
      lang_add_input_file (optarg, lang_input_file_is_file_enum,
                               (char *) NULL);
      break;
    case PRESERVE_ALL:
      pic30_preserve_all = TRUE;
      break;
#endif
    case PAGESIZE:
      pic30_pagesize = TRUE;
      if (optarg)
      {
        pagesize_arg = strtol(optarg, &endptr, 0);
        if (strcmp(endptr,"") != 0) {
	  einfo(_("%P%F: Error: Invalid argument to --pagesize\n"));
        }
      }
      break;
    case PSRD_PSRD_CHECK:
      pic30_psrd_psrd_check = TRUE;
      break;
    case NO_PSRD_PSRD_CHECK:
      pic30_psrd_psrd_check = FALSE;
      break;
    case ADD_CODE_FLAGS:
      if (pic30_add_code_flags) {
        char *f = malloc(strlen(pic30_add_code_flags) + strlen(optarg) + 2);
        sprintf(f, "%s,%s", pic30_add_code_flags, optarg);
        free(pic30_add_code_flags);
        pic30_add_code_flags = f;
      } else {
        pic30_add_code_flags = strdup(optarg);
      }
      break;
    case ADD_DATA_FLAGS:
      if (pic30_add_data_flags) {
        char *f = malloc(strlen(pic30_add_data_flags) + strlen(optarg) + 2);
        sprintf(f, "%s,%s", pic30_add_data_flags, optarg);
        free(pic30_add_data_flags);
        pic30_add_data_flags = f;
      } else {
        pic30_add_data_flags = strdup(optarg);
      }
      break;
    }
  return 1; 
} /* static int pic30_parse_args ()*/

