/* stackanalysis.c -- dump stack information about an object file. 
      using the bfd library. */

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include "bfd.h"
#include "bfdver.h"
#include "progress.h"
#include "bucomm.h"
#include "budemang.h"
#include "getopt.h"
#include "safe-ctype.h"
#include "dis-asm.h"
#include "libiberty.h"
#include "demangle.h"
#include "debug.h"
#include "budbg.h"

/* License manager for stack analysis */
#ifdef LICENSE_MANAGER_XCLM
#include "xclm_public.h"
#endif

#if PIC30
#include <ctype.h>
#include "../bfd/coff-pic30.h"
#include "opcode/pic30.h"
#include "../opcodes/pic30-opc.h"
#include "pic30-utils.h"

extern void pic30_set_extended_attributes
  PARAMS ((asection *, unsigned int, unsigned char ));
extern struct pic30_semantic_expr * pic30_analyse_semantics
  PARAMS ((struct disassemble_info *));

extern char *pic30_dfp;
extern char *program_name;
extern char *version_string;
#endif

/* Internal headers for the ELF .stab-dump code - sorry.  */
#define	BYTES_IN_WORD	32
#include "aout/aout64.h"

#define INFO 
#define ERROR "Error: "
#define ERRORNL "\n       "

/* a null terminated array of symbols that look like code addresses, 
 *   but aren't */
char *target_invalid_symbols[] = {
  ".dinit",
  0
};

/* a null terminated array of symbols that should be ignored in flow */
char *target_invalid_flow[] = {
  ".handle",
  0
};

static struct sa_block *sa_debug_check_deepest(struct sa_block *b);

volatile enum {
  dbg_off,
  dbg_symbol_scanning = 1,
  dbg_symbols_created = 2,
  dbg_insn_decode = 4,
  dbg_follow_flow = 8,
  dbg_dot = 16,
  dbg_check_deepest = 32,
  dbg_print_extra = 64,
} sa_debug = 0;

volatile int curr_block_id=0;

/* static analysis info */
#define MAX_FLOW_TRANSFERS 2
#define STARTING_LABEL_COUNT 2

enum sa_flow_kind {
  fk_none,
  fk_relative,
  fk_absolute,
  fk_do,
  fk_return,
  fk_fallsthrough,
  fk_reset,
  fk_skip,
  fk_switch,
  fk_switch_kase,
  fk_unknown,
};

static char *pretty_flow_kind[] = {
  "none",
  "rel",
  "abs",
  "do",
  "ret",
  "thru",
  "rset",
  "skp",
  "sbra",
  "kase",
  "???"
};

struct sa_raw_flow {
  enum sa_flow_kind flow;
  bfd_vma offset;
};

enum sa_block_flags {
  sbf_none                                = (1 << 0),
  sbf_ends_in_xfer                        = (1 << 1),
  sbf_branched_to                         = (1 << 2),
  sbf_visited                             = (1 << 3),
  sbf_visited_on_this_flow                = (1 << 4),
  sbf_unknown_stack_adjustment            = (1 << 5),
  sbf_visited_debug                       = (1 << 6),
  sbf_messaged                            = (1 << 7),
  sbf_matched_literal                     = (1 << 8),
  sbf_switch_branch                       = (1 << 9),
  sbf_switch_head                         = (1 << 10),
  sbf_switch_end                          = (1 << 11),
  sbf_interrupt_vector                    = (1 << 12),
  sbf_interrupt_fn                        = (1 << 13),
};

struct sa_stack_range {
  int minimal;
  int maximal;
};

struct sa_stack_lnk_info {
  int lnk_size;
  int has_lnk:1;
  int has_ulnk:1;
};

struct sa_switch_kase {
  struct sa_block *kase;
  struct sa_switch_kase *next;
};

struct sa_block {
  int block_id;
  enum sa_block_flags flags;
  int n_labels;
  asymbol **labels;
  bfd_vma start_pc;
  bfd_vma end_pc;
  bfd_byte *content;                          /* first byte of this block */
  struct sa_block *split_from;
  int visited_on_flow;
  int max_depth;
  struct sa_stack_range stack_info;
  struct sa_stack_lnk_info lnk_info;
  int local_stack[MAX_FLOW_TRANSFERS];        /* end stack on flow */
  struct sa_raw_flow flows[MAX_FLOW_TRANSFERS];
  struct sa_block *next[MAX_FLOW_TRANSFERS];  /* flow order */
  struct sa_switch_kase *swtch;
  struct sa_block *link_next, *link_prev;     /* sort order */
};

struct buffered_output_list {
  char *buffer;                   // 1 statement per buffer
  char *extra_info;               // sometimes printed after buffer
  struct buffered_output *next;
};

struct buffered_output {
  struct buffered_output_list *head;
  struct buffered_output_list *tail;
};

struct buffered_output recursion;
struct buffered_output unknown_stack_adjustment;
struct buffered_output indirect_calls;
struct buffered_output isrs;
struct buffered_output disconnected_fns;
struct buffered_output header;
struct buffered_output footer;

static struct sa_block *sa_first_block = 0;
int opb;

static void block_decode_flags(struct sa_block *b, char *indent) {
  if (b->flags) {
    fprintf(stderr,"%s    flags ",indent);
    if (b->flags & sbf_ends_in_xfer) fprintf(stderr,"XFER ");
    if (b->flags & sbf_branched_to) fprintf(stderr,"TGT ");
    if (b->flags & sbf_visited) fprintf(stderr,"SEEN ");
    if (b->flags & sbf_visited_on_this_flow) fprintf(stderr,"FLOW ");
    if (b->flags & sbf_unknown_stack_adjustment) fprintf(stderr,"XXXX ");
    if (b->flags & sbf_visited_debug) fprintf(stderr,"DBGSEEN ");
    if (b->flags & sbf_messaged) fprintf(stderr,"MSGD ");
    if (b->flags & sbf_matched_literal) fprintf(stderr,"LIT ");
    if (b->flags & sbf_switch_branch) fprintf(stderr,"SBRA ");
    if (b->flags & sbf_switch_head) fprintf(stderr,"SHD ");
    if (b->flags & sbf_switch_end) fprintf(stderr,"SEND ");
    if (b->flags & sbf_interrupt_vector) fprintf(stderr,"VEC ");
    if (b->flags & sbf_interrupt_fn) fprintf(stderr,"ISR ");
    fprintf(stderr,"\n");
  }
}

static char *indent_level(int in_list, int level) {
  static char spaces[80];
  char *indent;
  int len = sizeof(spaces) -1;

  memset(spaces,' ',len);
  spaces[len] = 0;
  if (level > len) {
    indent=spaces;
  } else if ((level > 2) && (in_list == 0)) {
    indent = spaces + (len - level);
    indent[0] = '0' + (level / 10);
    indent[1] = '0' + (level - (level / 10)*10);
  } else {
    indent=spaces + (len - level);
  }
  return indent;
}

static void block_dump(struct sa_block *b, int in_list, int level) {
  int i;
  char *indent = indent_level(in_list, level);

  fprintf(stderr,"%s*** block %d {\n",indent,b->block_id);
  block_decode_flags(b,indent);
  for (i = 0; i < b->n_labels; i++) {
    fprintf(stderr,"%s    %d: %s\n",indent,i,bfd_asymbol_name(b->labels[i]));
  }
  fprintf(stderr,"%s    start %x\n",indent,b->start_pc);
  fprintf(stderr,"%s    end %x\n",indent,b->end_pc);
  if (b->split_from) {
    fprintf(stderr,"%s    split_from block: %d\n",
            indent,b->split_from->block_id);
  }
  fprintf(stderr,"%s    vof %d\n",indent,b->visited_on_flow);
  fprintf(stderr,"%s    max_depth %d\n",indent,b->max_depth);
  fprintf(stderr,"%s    minimal %d\n",indent,b->stack_info.minimal);
  fprintf(stderr,"%s    maximal %d\n",indent,b->stack_info.maximal);
  if (b->lnk_info.has_lnk) {
    fprintf(stderr,"%s    lnk_info.lnk_size %d\n",indent,b->lnk_info.lnk_size);
  }
  if (b->lnk_info.has_ulnk) {
    fprintf(stderr,"%s    has ulnk\n",indent);
  }
  for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
    if (b->flows[i].flow) {
      fprintf(stderr,"%s    local_stack[%d] = %d\n",indent,i,b->local_stack[i]);
    }
  }
  for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
    if (b->flows[i].flow) {
      fprintf(stderr,"%s    %d) flow kind %s offset %x\n",
              indent,i,pretty_flow_kind[b->flows[i].flow], b->flows[i].offset);
    }
  }
  for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
    if (b->next[i]) {
      fprintf(stderr,"%s    flow edge %d -> %d\n",
              indent,i,b->next[i]->block_id);
    }
  }
  if (b->swtch) {
    int i = 0;
    struct sa_switch_kase *sc = b->swtch;
    while (sc) {
      fprintf(stderr,"%s    case %d -> block: %d\n",indent,
              i++, sc->kase->block_id);
      sc = sc->next;
    }
  }
  if (!in_list) {
    if (b->link_next) {
      fprintf(stderr,"%s    link next %x\n",indent,b->link_next->block_id);
    }
    if (b->link_prev) {
      fprintf(stderr,"%s    link prev %x\n",indent,b->link_prev->block_id);
    }
  }
  fprintf(stderr,"%s}\n",indent,b->block_id);
}

static void block_dump_list(const char *msg) {
  struct sa_block *b;
  fprintf(stderr,"%s [\n", msg);
  for (b = sa_first_block; b; b=b->link_next) {
    block_dump(b,1,3);
  }
  fprintf(stderr,"]\n");
}

static void buffer_output(struct buffered_output *to, char *message, 
                          char *extra_info) {
  struct buffered_output_list *item;

  item = xmalloc(sizeof(struct buffered_output_list));
  item->buffer = xstrdup(message);
  item->extra_info = NULL;
  if (extra_info && *extra_info) item->extra_info = xstrdup(extra_info);
  item->next = NULL;
  if (to->head == NULL) {
    to->head = item;
  }
  if (to->tail) {
    to->tail->next = item;
  }
  to->tail = item;
}

static void buffer_print(struct buffered_output *from, FILE *to, 
                         int with_extra_info, int bullet) {
  struct buffered_output_list *item;

  if (sa_debug & dbg_print_extra) with_extra_info = 1;
  fprintf(to,"\n");
  for (item = from->head; item; item = item->next) {
    if (bullet) {
      fprintf(to,"%d. ", bullet);
      bullet = 0;
    }
    if (with_extra_info && item->extra_info) {
      fprintf(to, "%s%s\n", item->buffer,item->extra_info);
    } else {
      fprintf(to, "%s\n", item->buffer);
    }
  }
}

static void buffer_clear(struct buffered_output *from) {
  struct buffered_output_list *item;
  struct buffered_output_list *next_item;

  for (item = from->head; item; item = next_item) {
    next_item = item->next;
    free(item->buffer);
    if (item->extra_info) free(item->extra_info);
    free(item);
  }
}

static void sa_output_messages(FILE *to) {
  int summary = 0;
  int bullet_no = 0;

  if (to == NULL) {
    summary = 1;
    to = stdout;
  }
  fprintf(to,
        "====================== STACK USAGE GUIDANCE ======================\n");
  buffer_print(&header,to,!summary,bullet_no++);
 
  if (recursion.head || unknown_stack_adjustment.head || isrs.head || 
      disconnected_fns.head) {
    fprintf(to,
            "However, the following cautions exist:\n");
  }
  if (recursion.head) {
    buffer_print(&recursion,to,!summary,bullet_no++);
    fprintf(to,"No stack usage predictions can be made.\n");
  }
  if (unknown_stack_adjustment.head) {
    buffer_print(&unknown_stack_adjustment,to,!summary,bullet_no++);
    fprintf(to,"No stack usage predictions can be made.\n");
  }
  if (isrs.head) {
    buffer_print(&isrs,to,!summary,bullet_no++);
    fprintf(to,"We cannot determine the stack impact of these events.\n"
               "Please adjust the guidance according to the application flow.\n"
           );
  }
  if (disconnected_fns.head) {
    buffer_print(&disconnected_fns,to,!summary,bullet_no++);
    fprintf(to,"We cannot determine the stack impact of these events.\n"
               "Please adjust the guidance according to the application flow.\n"
           );
  }
  if (!summary && indirect_calls.head) {
    buffer_print(&indirect_calls,to,!summary,bullet_no++);
    fprintf(to,"This information may help determine any additional stack adjustments that may\nbe required.\n");
  }
  buffer_print(&footer,to,!summary,0);
  fprintf(to,
        "==================================================================\n");
}

static struct sa_block *block_create(void) {
  struct sa_block *b;
  int i;

  b = xmalloc(sizeof(struct sa_block));
  if (b) {
    b->block_id = ++curr_block_id;
    b->flags = 0;
    b->n_labels = 0;
    b->labels = NULL;
    b->start_pc = -1;
    b->end_pc = -1;
    b->content = NULL;
    b->split_from = NULL;
    b->stack_info.maximal = 0;
    b->stack_info.minimal = 0;
    b->lnk_info.lnk_size = 0;
    b->lnk_info.has_lnk = 0;
    b->lnk_info.has_ulnk = 0;
    b->visited_on_flow = 0;
    b->max_depth = 0;
    for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
      b->local_stack[i] = 0;
      b->flows[i].flow = fk_none;
      b->next[i] = NULL;
    }
    b->swtch = 0;
    b->link_next = NULL;
    b->link_prev = NULL;
  } else {
    fatal (_("Out of memory"));
  }
  if (sa_debug & (dbg_symbol_scanning)) {
    fprintf(stderr,"Creating block: %d\n", b->block_id);
  }
  return b;
}

static block_clear_flags(int flag_mask) {
  struct sa_block *b;

  for (b = sa_first_block; b; b = b->link_next) {
    b->flags &= (~flag_mask);
  }
}

static int block_match_label(struct sa_block *b, asymbol *label) {
  int i;

  for (i = 0; i < b->n_labels; i++) {
    if (b->labels[i] == label) return i;
  }
  return -1;
}

static int block_match_label_name(struct sa_block *b, char *label) {
  int i;

  for (i = 0; i < b->n_labels; i++) {
    if (strcmp(bfd_asymbol_name(b->labels[i]),label)  == 0) return i;
  }
  return -1;
}
  
static int block_add_label(struct sa_block *b, asymbol *label) {
  int i;
  char *l;

  /* validate label is in block */
  if (b->start_pc != -1) {
    bfd_vma section_end = (label->section->vma + label->section->_raw_size/opb);
    bfd_vma addr = (label->section->vma + label->value);
   
    if ((addr < label->section->vma) || (addr >= section_end) || 
        (b->start_pc < label->section->vma) || (b->start_pc >= section_end)) {
      if (sa_debug & dbg_symbol_scanning) {
        fprintf(stderr,"Label '%s' is outside the bounds of section or block\n",
                label->name);
      }
      return b->n_labels;
    }
  }
  if (block_match_label(b,label) >= 0) return b->n_labels;
  /* not found */
  if (b->n_labels == 0) {
    b->labels = xcalloc(STARTING_LABEL_COUNT,sizeof(asymbol *));
    if (b->labels == NULL) fatal (_("Out of memory"));
    b->labels[b->n_labels++] = label;
  } else if (b->n_labels < STARTING_LABEL_COUNT) {
    b->labels[b->n_labels++] = label;
  } else {
    asymbol **new_labels = xmalloc((b->n_labels + 1) * sizeof(asymbol *));
    for (i = 0; i < b->n_labels; i++) {
      new_labels[i] = b->labels[i];
    }
    free(b->labels);
    b->labels = new_labels;
    b->labels[b->n_labels++] = label;
  }
  l = bfd_asymbol_name(label);
  if ((l[0] == '.') && (l[1] == 'S')) {
    /* maybe a switch label */
    if (l[2] == 'S') {
      b->flags |= sbf_switch_branch;
    } else if (l[2] == 'H') {
      b->flags |= sbf_switch_head;
    } else if (l[2] == 'E') {
      b->flags |= sbf_switch_end;
    }
  }
  if (sa_debug & dbg_symbol_scanning) {
    fprintf(stderr,"Adding label '%s' to block: %d\n",
            bfd_asymbol_name(label),  b->block_id);
  }
  return b->n_labels;
}

static char *block_pick_label(struct sa_block *b) {
  int i;
  char *l;

  while (b && (b->n_labels == 0)) {
    b = b->split_from;
  }
  if (b == NULL) return "Unknown label";
  for (i = 0; i < b->n_labels; i++) {
    l = bfd_asymbol_name(b->labels[i]);
    if (l[0] != '.') {
      return l;
    }
  }
  l = bfd_asymbol_name(b->labels[0]);
  return l;
}

static char *block_pick_function_label(struct sa_block *here) {
  int i;
  char *l;
  struct sa_block *b = here;

  while (b) {
    while (b && (b->n_labels == 0)) {
      b = b->split_from;
    }
    if (b == NULL) return "Unknown label";
    for (i = 0; i < b->n_labels; i++) {
      l = bfd_asymbol_name(b->labels[i]);
      if (l[0] != '.') {
        return l;
      }
    }
    // there must be one nearby
    b = b->link_prev;  // these are ordered by address...
  }
  // could not find anything with a funciton tag
  return block_pick_label(here);
}

int target_check_symbol(char **check_table, char *sym) {
  int invalid;

  for (invalid = 0; check_table[invalid]; invalid++) {
    if (strcmp(check_table[invalid], sym) == 0) return 0;
  }
  return 1;
}

/* lookup by label and/or start_pc -
 * create a new block if this doesn't exist, and we have start_pc
 */
static struct sa_block *block_lookup(asymbol *label, bfd_vma start_pc) {
  struct sa_block *b;
  struct sa_block *match = 0;
  struct sa_block *too_far = 0;
  struct sa_block *end = 0;
  int found = 0;

  for (b = sa_first_block; b; b = b->link_next) {
    found = 1;
    end = b;
    if ((start_pc > 0) && (b->start_pc != start_pc)) found = 0;
    /* exact match */
    if (found) {
      match = b;
      break;
    }
    if ((start_pc > 0) && (b->start_pc > start_pc)) {
      too_far = b;
      break;
    }
  }
  if (found) {
    if (label) block_add_label(match, label);
  } else if (start_pc) {
    match = block_create();
    if (sa_debug & dbg_symbol_scanning) {
      fprintf(stderr,"... start_pc %x\n", start_pc);
    }
    match->start_pc = start_pc;
    if (label) (void) block_add_label(match, label);
    if (sa_first_block == NULL) {
      sa_first_block = match;
    } else if (too_far) {
      if (sa_debug & dbg_symbol_scanning) {
        fprintf(stderr,"... inserting before block: %d\n", too_far->block_id);
      }
      match->link_prev = too_far->link_prev;
      if (too_far->link_prev) {
        too_far->link_prev->link_next = match;
      }
      match->link_next = too_far;
      too_far->link_prev = match;
      if (too_far == sa_first_block) sa_first_block = match;
    } else {
      if (sa_debug & dbg_symbol_scanning) {
        fprintf(stderr,"... add block to end\n");
      }
      end->link_next = match;
      match->link_prev = end;
    }
  }
  if (match) return match;
  return NULL;
}

static void block_split(struct sa_block *b, bfd_vma offset,
                        int copy_flow) {
  struct sa_block *new_block;
  int i;

  if (b->start_pc + offset == b->end_pc) return;
  if (sa_debug & dbg_symbol_scanning) {
    fprintf(stderr,"Spliting block: %d at offset %x\n",
                   b->block_id, offset);
    fprintf(stderr,"  prev block: %d\n", 
            b->link_prev ? b->link_prev->block_id : -1);
    fprintf(stderr,"  next block: %d\n",
            b->link_next ? b->link_next->block_id : -1);
  }
  new_block = block_create();
  new_block->start_pc = b->start_pc + offset;
  if (b->end_pc) {
    new_block->end_pc = b->end_pc;
    b->end_pc = b->start_pc + offset;
  }
  if (b->content) {
    new_block->content = b->content + (offset * opb);
  }
  if (b->split_from) {
    new_block->split_from = b->split_from;
  } else {
    new_block->split_from = b;
  }
  if (copy_flow) {
    for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
      if (b->flows[i].flow != fk_none) {
        new_block->flows[i].flow = b->flows[i].flow;
        new_block->flows[i].offset = b->flows[i].offset;
        new_block->next[i] = b->next[i];
        b->flows[i].flow = fk_none;
        b->flows[0].flow = fk_fallsthrough;
      }
    }
  }
  new_block->link_prev = b;
  new_block->link_next = b->link_next;
  if (new_block->link_next)
    new_block->link_next->link_prev = new_block;
  b->link_next = new_block;
}

static struct sa_block *block_lookup_by_name(char *symbol) {
  struct sa_block *b;
  struct sa_block *match = 0;

  for (b = sa_first_block; b; b = b->link_next) {
    if (block_match_label_name(b,symbol) >= 0) {
      match = b;
      break;
    }
  }
  if (match) return match;
  return NULL;
}

static struct sa_block *block_lookup_by_address(bfd_vma pc) {
  struct sa_block *b;
  struct sa_block *match = 0;

  for (b = sa_first_block; b; b = b->link_next) {
    if ((pc >= b->start_pc) && (pc < b->end_pc)) {
      match = b;
      break;
    }
  }
  if (match) return match;
  return NULL;
}

static int
is_config_word_section(bfd_vma address)
{
  fuse_setting_type *f;
  for (f = fuse_settings; f != NULL; f = f->next) {
     if (f->name && (f->address == address))
       return 1;
  }
  return 0;
}

void sa_gather_flash_symbols(asymbol **syms, long int symcount) {
  long int i;

  for (i = 0; i < symcount; i++) {
    /* check symbol/section information is valid */
    { asymbol *label;
      bfd_vma section_end, addr;

      label = syms[i];
      section_end = (label->section->vma + label->section->_raw_size/opb);
      addr = (label->section->vma + label->value);

      if ((addr < label->section->vma) || (addr >= section_end)) {
        if (sa_debug & dbg_symbol_scanning) {
          fprintf(stderr,"Label '%s' is outside the bounds of section\n",
                  label->name);
        }
        continue;
      }
    }
    if (syms[i]->section->flags & SEC_CODE) {
      if (syms[i]->flags & (BSF_SECTION_SYM | BSF_FILE | BSF_OBJECT)) {
        char *section_name = bfd_asymbol_name(syms[i]);

        if ((strstr(section_name,".ivt") == section_name) ||
            (strstr(section_name,".aivt") == section_name)) {
          // vector table section; we want to read this...
          struct sa_block *b;

          b = block_lookup(syms[i], bfd_asymbol_value(syms[i]));
          if (b) {
            b->flags |= sbf_interrupt_vector;
          }
        } else if (sa_debug & dbg_symbol_scanning) {
          fprintf(stderr,"(%d) skipping code symbol: %s\n",
                  i, bfd_asymbol_name(syms[i]));
        }
      } else if (is_config_word_section(bfd_asymbol_value(syms[i]))) {
        if (sa_debug & dbg_symbol_scanning) {
          fprintf(stderr,"(%d) skipping config word symbol: %s\n",
                  i, bfd_asymbol_name(syms[i]));
        }
      } else {
        if (sa_debug & dbg_symbol_scanning) {
          fprintf(stderr,"(%d) adding code symbol: %s\n",
                  i, bfd_asymbol_name(syms[i]));
        }
        if (target_check_symbol(target_invalid_symbols,
                                bfd_asymbol_name(syms[i])))
           (void) block_lookup(syms[i], bfd_asymbol_value(syms[i]));
      }
    } else if (sa_debug & dbg_symbol_scanning) {
      fprintf(stderr,"(%d) skipping 'other' symbol: %s\n",
              i, bfd_asymbol_name(syms[i]));
    }
  }
}

static void sa_fill_in_end_pc(void) {
  /* once we have an ordered list of symbols (and their blocks)
   * we can make an assumption about where this block ends --- it will end
   * at the next label. 
   *
   * where this will true:
   *   1) later we will split 'blocks' to end at a control flow statement,
   *      we will add new blocks as needed
   *   2) there may be an allocation gap between blocks. 
   */
  struct sa_block *b;

  for (b = sa_first_block; b->link_next; b = b->link_next) {
    b->end_pc = b->link_next->start_pc;
  }
}

static int targets_w15(struct pic30_private_data *private_data, int opnd) {
  if (private_data->reg[opnd] == 15) {
    if (private_data->mode[opnd] == P_OR_Q_REGISTER_DIRECT) return 1;
    if (private_data->mode[opnd] == -1*OPND_REGISTER_DIRECT) return 1;
  }
  return 0;
}

static int stack_adjustment(struct sa_block *b, bfd_vma offset,
                            struct pic30_private_data *private_data) {
  int opnd;
  int insn_stack_displacement = 0;  // adjustment caused by instruction
  int net_stack_displacement = 0;   // adjustment that flows into next insn
  int unknown = 0;
  static char info_buffer[1024];
  char *buffer = info_buffer;
  static char extra_info_buffer[1024];
  char *extra_buffer = extra_info_buffer;
  static int intro_printed = 0;


  if (private_data->opcode) {
    switch (private_data->opcode->baseop) {
      default: break;
      
      /* explicit stack operations */
      case OP_ADD_W:
        if (targets_w15(private_data, 2)) {
          b->flags |= sbf_unknown_stack_adjustment;
          unknown = 1;
        }
        break;

      case OP_ADDLS_W:
        if (targets_w15(private_data, 2)) {
          insn_stack_displacement = private_data->reg[1];
          net_stack_displacement = insn_stack_displacement;
        }
        break;
    
      case OP_ADDLW_W:
        if (targets_w15(private_data, 1)) {
          insn_stack_displacement = private_data->reg[0];
          net_stack_displacement = insn_stack_displacement;
        }
        break;

      case OP_DEC2_W:
        if (targets_w15(private_data, 1)) {
          if (targets_w15(private_data,0)) {
            insn_stack_displacement = -2;
            net_stack_displacement = insn_stack_displacement;
          } else {
            b->flags |= sbf_unknown_stack_adjustment;
            unknown = 1;
          }
        }
        break;

      case OP_INC2_W:
        if (targets_w15(private_data, 1)) {
          if (targets_w15(private_data,0)) {
            insn_stack_displacement = 2;
            net_stack_displacement = insn_stack_displacement;
          } else {
            b->flags |= sbf_unknown_stack_adjustment;
            unknown = 1;
          }
        }
        break;

      case OP_MOVL_W:
        { struct sa_block *tgt_block;

          tgt_block = block_lookup_by_address(private_data->reg[0]);
          if ((tgt_block) && (tgt_block->start_pc == private_data->reg[0])) {
            tgt_block->flags |= sbf_matched_literal;
          }
        }
        break;
         
      case OP_MOV_W:
        if (targets_w15(private_data, 1)) {
          b->flags |= sbf_unknown_stack_adjustment;
          unknown = 1;
        }
        break;

      case OP_SUB_W:
        if (targets_w15(private_data, 2)) {
          b->flags |= sbf_unknown_stack_adjustment;
          unknown = 1;
        }
        break;

      case OP_SUBLS_W:
        if (targets_w15(private_data, 2)) {
          insn_stack_displacement = private_data->reg[1] * -1;
          net_stack_displacement = insn_stack_displacement;
        }
        break;

      case OP_SUBLW_W:
        if (targets_w15(private_data, 1)) {
          insn_stack_displacement = private_data->reg[0] *-1;
          net_stack_displacement = insn_stack_displacement;
        }
        break;
       
      /* implicit stack operations */

      case OP_LNK:
        b->lnk_info.lnk_size = private_data->reg[0] + 2;
        b->lnk_info.has_lnk = 1;
        break;
        
      case OP_ULNK:
        b->lnk_info.has_ulnk = 1;
        break;

      case OP_RCALL:
      case OP_CALL:
      case OP_CALLW:
        insn_stack_displacement = 4;
        net_stack_displacement = 0;
        break;

      case OP_RETFIE:
      case OP_RETLW_B:
      case OP_RETLW_W:
      case OP_RETURN:
        insn_stack_displacement = -4;
        net_stack_displacement = insn_stack_displacement;
        break;

      case OP_PUSHF:
      case OP_PUSH_W:
        insn_stack_displacement = 2;
        net_stack_displacement = insn_stack_displacement;
        break;

      case OP_PUSH_D:
        insn_stack_displacement = 4;
        net_stack_displacement = insn_stack_displacement;
        break;

      case OP_POPF:
      case OP_POP_W:
        insn_stack_displacement = -2;
        net_stack_displacement = insn_stack_displacement;
        break;

      case OP_POP_D:
        insn_stack_displacement = -4;
        net_stack_displacement = insn_stack_displacement;
        break;
 
      case OP_RESET:
        break;
    }
  
    /* check each operand to see if it is a increment decrement of W15 */
    for (opnd = 0; opnd < private_data->opcode->number_of_operands; opnd++) {
      if (private_data->reg[opnd] == 15) {
        switch (private_data->mode[opnd]) {
          default:  break;

          case P_OR_Q_REGISTER_POST_DECREMENT:
          case P_OR_Q_REGISTER_PRE_DECREMENT:
            insn_stack_displacement -= 2;
            net_stack_displacement -=2;
            break;

          case P_OR_Q_REGISTER_POST_INCREMENT:
          case P_OR_Q_REGISTER_PRE_INCREMENT:
            insn_stack_displacement += 2;
            net_stack_displacement +=2;
            break;
        }
      }
    }

    if ((private_data->opcode->baseop == OP_LDDW) ||
        (private_data->opcode->baseop == OP_STDW)) {
      insn_stack_displacement *= 2;
      net_stack_displacement *= 2;
    }
  }
  if (insn_stack_displacement || net_stack_displacement) {
    b->local_stack[0] += net_stack_displacement;
    b->local_stack[1] += net_stack_displacement;
    if (insn_stack_displacement != net_stack_displacement) {
      /* we have a flow change where the taken path has a different stack
         level */
      b->local_stack[1] = b->local_stack[0] + insn_stack_displacement;
    }
    if (insn_stack_displacement > 0) {
      if (b->local_stack[1] > b->stack_info.maximal) 
        b->stack_info.maximal = b->local_stack[1];
    } else if (insn_stack_displacement < 0) {
      if (b->local_stack[1] < b->stack_info.minimal) 
        b->stack_info.minimal = b->local_stack[1];
    }
  }
  if (unknown) {
    if (intro_printed == 0) {
      buffer += sprintf(buffer,INFO "Indeterminate stack adjustment has been detected:\n");
      intro_printed = 1;
    }
    buffer += sprintf(buffer,INFO "   %s", block_pick_function_label(b));
    extra_buffer += sprintf(extra_buffer," (address 0x%x)", 
                            b->start_pc + offset);
    buffer_output(&unknown_stack_adjustment, info_buffer, extra_info_buffer);
    buffer = info_buffer;
    extra_buffer = extra_info_buffer;
    *extra_buffer = 0;
  }
  if (sa_debug & dbg_insn_decode) {
    if (insn_stack_displacement || net_stack_displacement) {
      fprintf(stderr,"*** insn @%x adjusts stack by (%d,%d)\n", 
              b->start_pc+offset,insn_stack_displacement,
              net_stack_displacement);
    }
    if (unknown) {
      fprintf(stderr,"*** insn @%x adjusts stack by ???\n", 
              b->start_pc+offset);
    }
  }
  return insn_stack_displacement;
}

enum sa_flow_kind flow_check_switch(struct sa_block *b) {
  struct sa_block *sh = NULL;

  if (b->flags & sbf_switch_branch) 
    return fk_switch;
  if ((b->split_from) && (b->split_from->flags & sbf_switch_branch))
    return fk_switch;
  if (b->flags & sbf_switch_head) {
    sh = b;
  } else if ((b->split_from) && (b->split_from->flags & sbf_switch_head)) {
    sh = b->split_from;
  }
  if (sh) {
    int i;
    char *branch_label = NULL;
    struct sa_block *sb;
    struct sa_switch_kase *sc;
  
    for (i = 0; i < sh->n_labels; i++) {
      char *l = bfd_asymbol_name(sh->labels[i]);
      if (strstr(l,".SH")) {
        branch_label = xmalloc(strlen(l)+1);
        strcpy(branch_label,l);
        branch_label[2] = 'S';
        break;
      }
    }
    if (branch_label == NULL) {
      fprintf(stderr,ERROR "cannot locate switch label for block: %d\n", 
              sh->block_id);
      return fk_unknown;
    }
    sb = block_lookup_by_name(branch_label);
    free(branch_label);
    if (sb == NULL) {
      fprintf(stderr,ERROR "cannot locate switch branch for block: %d\n", 
              sh->block_id);
      return fk_unknown;
    }
    sc = xmalloc(sizeof(struct sa_switch_kase));
    sc->kase = b;
    sc->next = sb->swtch;
    sb->swtch = sc;
    return fk_switch_kase;
  }
  return fk_unknown;
}

int flow_change(struct disassemble_info *info, struct sa_block *b) {
   /* fill in flows field in block - 
    * for instructions that never continue (bra/goto) there is 1 flow
    * for instructions that will or may continue (conditional branch/call) 
    *   there are 2 flows and the zeroth flow is the continuation
    */
  int opnd;
  int flow_change_count = 0;
  struct pic30_private_data *private_data = info->private_data;
  struct sa_raw_flow *flows = &b->flows;

  if (private_data->opcode) {
    switch (private_data->opcode->baseop) {
      default: return 0;

      case OP_BTSC_W:
      case OP_BTSCF_B:
      case OP_BTSS_W:
      case OP_BTSSF_B:
        /* skip instructions */
        flows[0].flow = fk_relative;
        flows[0].offset = 0;
        flows[1].flow = fk_skip;
        flows[1].offset = 1;
        flow_change_count = 2;
        break;

      case OP_BRA:
        /* we use absolute because we have worked out the answer */
        flows[0].flow = flow_check_switch(b);
	if (flows[0].flow == fk_unknown) flows[0].flow = fk_absolute;
        flows[0].offset = info->target;
        flow_change_count = 1;
        break;

      case OP_BRAW:
        /* could try to track this */
        flows[0].flow = flow_check_switch(b);
        flows[0].offset = private_data->reg[0];
        flow_change_count = 1;
        break;

      case OP_BRAWE:
        /* could try to track this */
        flows[0].flow = flow_check_switch(b);
        flows[0].offset = private_data->reg[0];
        flow_change_count = 1;
        break;

      case OP_BRA_CC:
      case OP_BRA_DSP:
        /* opnd 0 is the condition */
        flows[0].flow = fk_relative;
        flows[0].offset = 0;
        flows[1].flow = fk_absolute;
        flows[1].offset = info->target;
        flow_change_count = 2;
        break;

      case OP_CALL:
        flows[0].flow = fk_relative;
        flows[0].offset = 0;
        flows[1].flow = fk_absolute;
        flows[1].offset = info->target;
        flow_change_count = 2;
        break;

      case OP_CALLW:
        /* could try to track this */
        flows[0].flow = fk_relative;
        flows[0].offset = 0;
        flows[1].flow = fk_unknown;
        flows[1].offset = private_data->reg[0];
        flow_change_count = 2;
        break;

      case OP_BOOTSWP:
        /* could try to track this */
        flows[0].flow = fk_unknown;
        flows[0].offset = -1;
        flow_change_count = 1;
        break;

      case OP_DO:
      case OP_DOW:
#if 0
        flows[0].flow = fk_do;
        flows[0].offset = info->target;
        flow_change_count = 1;
        break;
#else
        /* a DO loop should not touch the stack in any wierd way;
         * that would be difficult to repair.  I think we should treat
         * this a straight line code since the stack usage at loop end should
         * match the stack usage at loop start */
        return 0;
#endif

      case OP_GOTO:
        flows[0].flow = fk_absolute;
        flows[0].offset = info->target;
        flow_change_count = 1;
        break;

      case OP_GOTOW:
        /* could try to track this */
        flows[0].flow = fk_unknown;
        flows[0].offset = private_data->reg[0];
        flow_change_count = 1;
        break;

      case OP_RCALL:
        flows[0].flow = fk_relative;
        flows[0].offset = 0;
        flows[1].flow = fk_absolute;
        flows[1].offset = info->target;
        flow_change_count = 2;
        break;

      case OP_RCALLW:
        /* could try to track this */
        flows[0].flow = fk_relative;
        flows[0].offset = 0;
        flows[1].flow = fk_unknown;
        flows[1].offset = private_data->reg[0];
        flow_change_count = 2;
        break;

      case OP_RESET:
        flows[0].flow = fk_reset;
        flow_change_count = 1;
        break;

      case OP_RETFIE:
      case OP_RETLW_B:
      case OP_RETLW_W:
      case OP_RETURN:
        flows[0].flow = fk_return;
        flow_change_count = 1;
        break;
    }
  }
  if (flow_change_count) b->flags |= sbf_ends_in_xfer;
  return flow_change_count;
}

static int noprintf(FILE *out,const char *fmt,...) {
  return 0;        
}

void sa_split_block(bfd *abfd, asymbol **syms, long int symcount, 
                    struct sa_block *b) {
  /* This process will break blocks - a control flow change will break the
     block */
  
  struct sa_block *skip_block = NULL;
  static int info_init=0;
  static struct disassemble_info info;
  bfd_vma insn_size;
  bfd_vma offset;
  bfd_vma end_offset;
  struct pic30_private_data private_data;
  int stack_displacement;
  int flow_changes;

  if (sa_debug & dbg_insn_decode) {
    fprintf(stderr,"*** block: %d\n",b->block_id);
  }
  /* check the last block for a skip flow; we don't know how far to skip
   * until we decode the next instruction... which we are about to do...
   */
  if (b->link_prev) {
    int i;
    for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
      if (b->link_prev->flows[i].flow == fk_skip) {
        skip_block = b->link_prev;
      }
    }
  }
  if (b->content == NULL) {
    bfd_vma section_end;
    struct sa_block *content_block = b;

    if (b->n_labels == 0) {
      content_block = b->split_from;
    }
    if ((content_block->content == NULL) && 
        (content_block->labels[0]->section->contents == NULL)) {
      bfd_size_type datasize;
      asection *section;
      bfd_byte *data;

      section = content_block->labels[0]->section;
      datasize = bfd_get_section_size_before_reloc(section);
      if (sa_debug & dbg_insn_decode) {
        fprintf(stderr,"*** reading %d bytes\n",datasize);
      }
      if (datasize == 0) {
        fprintf(stderr,ERROR "cannot locate section '%s'\n", 
                content_block->labels[0]->section->name);
        return;
      }
      data = (bfd_byte *)xmalloc((size_t) datasize);
      bfd_get_section_contents(abfd, section, data, 0, datasize);
      content_block->labels[0]->section->contents = data;
    }
    if (content_block != b) {
      bfd_vma offset = b->start_pc - content_block->start_pc;
      b->content = content_block->content + (offset*opb);
      section_end = b->end_pc;
    } else {
      b->content = b->labels[0]->section->contents + 
                   (b->labels[0]->value * opb);
      section_end = (b->labels[0]->section->vma + 
                     b->labels[0]->section->_raw_size/opb);
    }
    /* initially we guessed at the end of the section, based upon the start
     *  of the next block - now we have more information */
    if (b->end_pc > section_end) b->end_pc = section_end;
    if (b->end_pc == b->start_pc) {
      /* symbol at the end of a section, delete the block and move on */
      b->link_prev->link_next = b->link_next;
      if (b->link_next) {
        b->link_next->link_prev = b->link_prev;
      }
      return;
    }
  }

  if (b->flags & sbf_interrupt_vector) {
    /* This is a vector slot; mark the address as used */
    bfd_vma vector = 0;
    struct sa_block *target;

    vector = b->content[0] + (b->content[1] << 8) + (b->content[2] << 16);
    target = block_lookup_by_address(vector);
    if (target) {
      target->flags |= sbf_interrupt_fn;
      if (sa_debug & dbg_insn_decode) {
        fprintf(stderr,"*** vector %x\n",vector);
      }
      return;
    }
    if (sa_debug & dbg_insn_decode) {
      fprintf(stderr,"*** vector %x [block not found]\n",vector);
    }
    return;
  }
  if (info_init == 0) {
    if (sa_debug & dbg_insn_decode) {
      INIT_DISASSEMBLE_INFO (info, stderr, fprintf);
    } else {
      INIT_DISASSEMBLE_INFO (info, stdout, noprintf);
    }
    info.symbols = syms;
    info.num_symbols = symcount;
    info.private_data = &private_data;
    info.octets_per_byte = opb;
    info.flavour = bfd_get_flavour (abfd);
    info.arch = bfd_get_arch (abfd);
    info.mach = bfd_get_mach (abfd);
    info_init = 1;
  }
  info.buffer = b->content;
  info.buffer_vma = b->start_pc;
  info.buffer_length = (b->end_pc - b->start_pc) * opb;
  if (b->labels) {
    info.section = b->labels[0]->section; 
  } else if (b->split_from && b->split_from->labels) {
    info.section = b->split_from->labels[0]->section; 
  } else info.section = 0;
  end_offset = b->end_pc - b->start_pc;

  for (offset = 0; offset < end_offset; offset += insn_size) {
    if (sa_debug & dbg_insn_decode) {
      fprintf(stderr,"*** insn %x  ",b->start_pc + offset);
    }
    private_data.opcode = 0;
    private_data.opnd_no = 0;
    insn_size = pic30_print_insn(b->start_pc + offset, &info);
    if (sa_debug & dbg_insn_decode) {
      fprintf(stderr,"\n");
    }
    insn_size /= opb;
    if (insn_size <= 0) {
      fprintf(stderr,ERROR "cannot decode instruction at address 0x%x", 
              b->start_pc+offset);
      insn_size = PIC30_SIZE_OF_PROGRAM_WORD;
    }
    /* check for skip flow */
    if (skip_block) {
      int i;
      for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
        if (skip_block->flows[i].flow == fk_skip) {
          skip_block->flows[i].flow = fk_absolute;
          skip_block->flows[i].offset = b->start_pc + offset + insn_size;
          break;
        }
      }
    }
    /* calculate flow changes first */
    flow_changes = flow_change(&info, b);
    stack_displacement = stack_adjustment(b,offset,&private_data);
    if (flow_changes) {
      int i;

      if (sa_debug & dbg_insn_decode) {
        fprintf(stderr,"*** insn @%x has %d flow changes\n", 
                b->start_pc + offset, flow_changes);     
      }
      for (i = 0; i < flow_changes; i++) {
        if (b->flows[i].flow == fk_absolute) {
          struct sa_block *dst;
    
          dst = block_lookup_by_address(b->flows[i].offset);
          if (dst && (dst->start_pc != b->flows[i].offset)) {
            /* target not at start of block */
            block_split(dst,b->flows[i].offset - dst->start_pc,1);
          }
        }
      }
      if (flow_changes == 1) {
         /* we do not come back - if this is not the end of the block,
            split the block */
         if (offset + insn_size < end_offset) {
           block_split(b,offset+insn_size,0);
	 }
      } else {
        block_split(b,offset+insn_size,0);
      }
      return;
    } else if (offset + insn_size >= end_offset) {
      /* we have reached the end of the block without a flow change */
      b->flows[0].flow = fk_fallsthrough;
    }
    if (skip_block) {
      /* we need to make sure the block ends here... the next instruction
       * will be branched to as part of the previous skip instruction */
      if (offset + insn_size < end_offset) {
        block_split(b,offset+insn_size,0);
        return;
      }
    }
  }
}

void sa_split_blocks(bfd *abfd, asymbol **syms, long int symcount) {
  struct sa_block *b;

  for (b = sa_first_block; b; b = b->link_next) {
    sa_split_block(abfd, syms, symcount, b);
  }
}

void sa_build_flow_graph(void) {
  /* connect blocks by 'next' */

  struct sa_block *b;
  struct sa_block *next_block;
  int f;
  bfd_vma new_pc;
  int intro_printed = 0;
  static char info_buffer[1024];
  char *buffer = info_buffer;

  for (b = sa_first_block; b; b = b->link_next) {
    char *sym = block_pick_label(b);
    if (sym && (target_check_symbol(target_invalid_flow,sym) == 0)) continue;
    for (f = 0; f < MAX_FLOW_TRANSFERS; f++) {
      next_block = 0;
      switch (b->flows[f].flow) {
        case fk_none:  continue;

        case fk_fallsthrough:
          next_block = b->link_next;
          if (next_block) {
            new_pc = b->link_next->start_pc;
          } else new_pc = 0;
          break;

        case fk_relative:
          /* on this machine the destination is PC + insn_size + 2 * offset
           * however, 
           *   offset has already been adjusted and
           *   the end_pc represents the address of the next
           *   instruction, so we can use end_pc + offset
           */
          new_pc = b->end_pc + b->flows[f].offset;
          break;

        case fk_switch_kase:
        case fk_absolute:
          new_pc = b->flows[f].offset;
          if (new_pc == 0) {
            /* special case; either this is a bad relocation or a
             * relocation to a week symbol... regardless, it doesn't 
             * go anywhere...
             * convert it to fk_none and move on.
             */
            b->flows[f].flow = fk_none;
            continue;
          }
          break;

        case fk_do:
          fatal(_("Cannot do do (yet)"));
          break;

        case fk_reset:
        case fk_return:
          /* we don't have a flow for return */
          continue;

        case fk_unknown: {
          /* we have found an unknown flow, notify the client */
          struct sa_block *which_block = b;

          if (which_block->labels == NULL) 
            which_block = which_block->split_from;
          if ((which_block->flags & sbf_messaged) == 0) {
            which_block->flags |= sbf_messaged;
            if (intro_printed == 0) {
              buffer += sprintf(buffer,
                                INFO "The following indirect function calls"
                                     " have been detected:\n");
              intro_printed = 1;
            }
            buffer += sprintf(buffer,INFO 
                              "   address 0x%x (label %s)",
                              which_block->end_pc,
                              bfd_asymbol_name(which_block->labels[0]));
            if (b->flows[f].offset >= 0) {
              buffer += sprintf(buffer,
                                " through register w%d", b->flows[f].offset);
            }
            buffer_output(&indirect_calls, info_buffer, 0);
            buffer = info_buffer;
          }
          continue;
        }
        
        case fk_switch: {
          /* we have a switch-like table; supress message --- */
          continue;
        }

      }
      if (next_block == NULL) {
        next_block = block_lookup_by_address(new_pc);       
      }
      if (next_block == NULL) {
        b->flows[f].flow = fk_none;
        fprintf(stderr,ERROR "cannot follow flow from label %s,"
                            "cannot find target PC %x\n",
                block_pick_label(b), new_pc);
        continue;
      }
      if (next_block->start_pc != new_pc) {
        /* should never happen */
        fprintf(stderr,ERROR "%x not at start of block %d\n",
                new_pc, next_block->block_id);
      }                       
      next_block->flags |= sbf_branched_to;
      b->next[f] = next_block;
    }
  }
}        

static int sa_follow_flow(struct sa_block *b,struct sa_block *last_lnk, 
                          int level,int current_stack) {
  int this_flow;
  int deepest = 0;
  int i;
  char *indent = indent_level(0,level);
  struct sa_block *new_last_lnk = last_lnk;
  static int intro_printed = 0;
  static int usa_intro_printed = 0;
  static char info_buffer[1024];
  char *buffer = info_buffer;
  static char extra_info_buffer[1024];
  char *extra_buffer = extra_info_buffer;

  if (sa_debug & dbg_follow_flow) {
    block_dump(b,0,level);
    fprintf(stderr,"%s*** current stack level %d [%x,%x]\n", 
            indent, current_stack,
            b->start_pc, b->end_pc);
  }
  if (b->flags & sbf_visited_on_this_flow) {
    if (current_stack != b->visited_on_flow) {
      if (intro_printed == 0) {
        buffer += sprintf(buffer,INFO "Recursion has been detected:\n");
      }
      buffer += sprintf(buffer,INFO "   %s", block_pick_function_label(b));
      extra_buffer += sprintf(extra_buffer," (address 0x%x)", b->end_pc);
      buffer_output(&recursion, info_buffer, extra_info_buffer);
      buffer = info_buffer;
      extra_buffer = extra_info_buffer;
      *extra_buffer = 0;
    }
  }
  if (current_stack > b->max_depth) {
    b->max_depth = current_stack;
  }
  b->visited_on_flow = current_stack;
  if (b->flags & sbf_visited) {
    if (sa_debug & dbg_follow_flow) {
      fprintf(stderr,"%s*** Already visited -> %d\n", 
              indent, b->stack_info.maximal);
    }
    return b->stack_info.maximal;
  }
  b->flags |= sbf_visited_on_this_flow;
  b->flags |= sbf_visited;
  for (i = MAX_FLOW_TRANSFERS-1; i >= 0; i--) {
    if ((b->flows[i].flow != fk_none) &&
        (b->flows[i].flow != fk_unknown) &&
        ((b->next[i]) ||
          b->flows[i].flow == fk_switch)) {
      this_flow = b->local_stack[i];
      if (b->lnk_info.has_lnk) {
        new_last_lnk = b;
        this_flow += b->lnk_info.lnk_size;
      }
      if (b->lnk_info.has_ulnk) {
        if (last_lnk == NULL) fatal(_("LNK not stacked!"));
        this_flow -= last_lnk->lnk_info.lnk_size;
        new_last_lnk = 0;  // might need to link them; 
                           //   if we do lnk lnk ulnk ulnk in the same block
      }
      switch (b->flows[i].flow) {
        default:
          if (sa_debug & dbg_follow_flow) {
            indent = indent_level(0,level);
            fprintf(stderr,"%s*** Following flow to block: %d\n"
                           "%s    Updating stack depth to %d\n",
                           indent, b->next[i]->block_id, 
                           indent, current_stack+this_flow);
          }
          this_flow += sa_follow_flow(b->next[i],new_last_lnk,
                                      level+1, current_stack+this_flow);
          if (sa_debug & dbg_follow_flow) {
            indent = indent_level(0,level);
            fprintf(stderr,"%s*** Back to block: %d\n"
                           "%s    depth is now: %d\n",
                           indent, b->block_id, 
                           indent, current_stack);
          }
          break;

        case fk_return:
          if (sa_debug & dbg_follow_flow) {
            indent = indent_level(0,level);
            fprintf(stderr,"%s*** Return flow\n"
                           "%s    This flow is %d\n"
                           "%s    Current deepest is %d\n",
                           indent, 
                           indent, this_flow, 
                           indent, deepest);
          }
          break;

        case fk_reset:
          if (sa_debug & dbg_follow_flow) {
            indent = indent_level(0,level);
            fprintf(stderr,"%s*** reset\n"
                           "%s    This flow is %d\n"
                           "%s    Current deepest is %d\n",
                           indent, 
                           indent, this_flow, 
                           indent, deepest);
          }
          break;

        case fk_switch: {
          /* find the deepest flow in the table and use that... */
          int i = 0;
          int max_depth = 0;
          struct sa_switch_kase *sc;
          sc = b->swtch;
          while (sc) {
            int depth;

            depth = sa_follow_flow(sc->kase,new_last_lnk,
                                   level+1, current_stack+this_flow);
            if (depth > max_depth) max_depth = depth;
            if (sa_debug & dbg_follow_flow) {
              indent = indent_level(0,level);
              fprintf(stderr,"%s*** case %d: block: %d\n"
                             "%s    depth: %d\n",
                             indent, i++,  sc->kase->block_id,
                             indent, depth);
            }
            sc = sc->next;
          }
          this_flow += max_depth;
          break;
        }
      }
      if ((this_flow > 0) && (this_flow > deepest)) deepest = this_flow;
    }
  }
  b->stack_info.maximal = deepest;
  b->flags &= ~sbf_visited_on_this_flow;
  return deepest;
}

int sa_analyze_flow_graph(char *start_symbol) {
  struct sa_block *b;
  int result;

  if (sa_debug & dbg_follow_flow) {
    fprintf(stderr,"*** Starting flow for: '%s'\n", start_symbol);
  }
  b = block_lookup_by_name(start_symbol);
  if (strcmp(start_symbol,"__reset") == 0) b->flags |= sbf_branched_to;
  if (b == NULL) {
    fatal(_("Cannot find start_sybmol"));
    return 0;
  }
  result = sa_follow_flow(b,0,0,0);
  if (sa_debug & dbg_check_deepest) {
    fprintf(stderr,"A deepest block:\n");
    block_dump(sa_debug_check_deepest(b),0,3);
  }
  return result;
}

void sa_list_disjoint_flows(void) {
  struct sa_block *b;
  struct sa_block *target;
  int intro_printed=0;
  static char *info_buffer[1024];
  char *buffer = info_buffer;
  static char extra_info_buffer[1024];
  char *extra_buffer = extra_info_buffer;

  for (b = sa_first_block; b; b = b->link_next) {
    char *l;
    if ((b->flags & sbf_branched_to) == 0) {
      if (intro_printed == 0) {
        buffer += sprintf(buffer, 
                     INFO "The following labels cannot be connected to the"
                            " main call graph.\n" 
                     INFO "this is usually caused by some indirection:\n");
        intro_printed = 1;
      }
      target = b;
      while (target) {
        if (target->n_labels) {
          l = block_pick_label(target);
        } else if (target->split_from->n_labels) {
          l = block_pick_label(target->split_from);
        } else l = "unknown label";
        if (strcmp(l,".handle") == 0) {
          /* for dsPIC, this is a branch island, look at the target to get
             the real symbol name */
          if (b->flows[0].flow == fk_absolute) {
            target = block_lookup_by_address(target->flows[0].offset);
          } else break;
        } else break;
      }
      buffer += sprintf(buffer,INFO "   %s", l);
      extra_buffer += sprintf(extra_buffer," (address 0x%x)", 
                              target->start_pc);
      buffer_output(&disconnected_fns,info_buffer,extra_info_buffer);
      buffer = info_buffer;
      extra_buffer = extra_info_buffer;
      *extra_buffer = 0;
    }
  }
}

void sa_follow_disjoint_flows(void) {
  struct sa_block *b;
  struct sa_block *target;
  int intro_printed;
  int pass;
  static char info_buffer[1024];
  char *buffer = info_buffer;
  static char extra_info_buffer[1024];
  char *extra_buffer = extra_info_buffer;

  /* pass 0) analyse unvisited flows 
     pass 1) display interrupt vectors
     pass 2) look to see what truly hasn't been called */
  for (pass = 0; pass < 3; pass++) {
    intro_printed = 0;
    for (b = sa_first_block; b; b = b->link_next) {
      char *l;
      if ((b->flags & sbf_branched_to) == 0) {
        target = b;
        while (target) {
          l = block_pick_label(target);
          if (strcmp(l,".handle") == 0) {
            /* for dsPIC, this is a branch island, look at the target to get
               the real symbol name */
            if (target->flows[0].flow == fk_absolute) {
              target = block_lookup_by_address(target->flows[0].offset);
            } else {
              /* this is not a handle that has been fille din */
              target = NULL;
              break;
            }
          } else break;
        }
        if (l[0] == '.') {
          // omit local labels; these probably aren't the target of calls anyway
          target = 0;
        }
        if (target) {
          int size = sa_analyze_flow_graph(l);
          if ((pass == 1) && (b->flags & sbf_interrupt_fn)) {
            if (intro_printed == 0) {
              buffer += sprintf(buffer, 
                        INFO "The following labels are interrupt functions:\n");
              intro_printed = 1;
            }
            buffer += sprintf(buffer, 
                              INFO "   %s uses %d bytes", l, 
                              sa_analyze_flow_graph(l));
            extra_buffer += sprintf(extra_buffer, 
                                    " (address 0x%x)", target->start_pc);
            buffer_output(&isrs,info_buffer,extra_info_buffer);
            buffer = info_buffer;
            extra_buffer = extra_info_buffer;
            *extra_buffer = 0;
          }
          if ((pass == 2) && (b->flags & sbf_matched_literal)) {
            if (intro_printed == 0) {
              buffer += sprintf(buffer, 
                     INFO "The following labels cannot be connected to the"
                            " main call graph.\n" 
                     INFO "This is usually caused by some indirection:\n");
              intro_printed = 1;
            }
            buffer += sprintf(buffer, 
                              INFO "   %s uses %d bytes", l, 
                              sa_analyze_flow_graph(l));
            extra_buffer += sprintf(extra_buffer, 
                                    " (address 0x%x)", target->start_pc);
            buffer_output(&disconnected_fns,info_buffer,extra_info_buffer);
            buffer = info_buffer;
            extra_buffer = extra_info_buffer;
            *extra_buffer = 0;
          }
        }
      }
    }
  }
}

static char *dot_sanitise(char *name) {
  static char good_name[80];
  char *c;
  char *d = good_name;

  for (c = name; *c; c++) {
    if (isalnum(*c)) *d++=*c;
    if (*c == '_') *d++ = *c;
    if (*c == '[') *d++ = *c;
    if (*c == ']') *d++ = *c;
    if (*c == '=') *d++ = *c;
    if (*c == ' ') *d++ = *c;
  }
  *d++=0;
  return good_name;
}

static void sa_debug_dot_block(struct sa_block *b, FILE *f) {
  char *sym;
  char name[80];
  int i;

  sym = block_pick_label(b);
  if (sym && (target_check_symbol(target_invalid_flow,sym) == 0)) return;
  if (b->n_labels) {
    snprintf(name,79, "%s_%x", sym, b->start_pc);
  } else {
    snprintf(name,79, "block_%x", b->start_pc);
  }
  snprintf(name,79,"%s", dot_sanitise(name));
  fprintf(f,"%s [label=\"%s\ndepth:%d\nmax:%d\"];\n",
          name,name,b->max_depth,b->stack_info.maximal);
  for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
    if (b->flows[i].flow != fk_none) {
      if (b->flows[i].flow == fk_return) {
        fprintf(f,"  %s -> return_%x;\n",
                name, b->end_pc);
      } else if (b->flows[i].flow == fk_reset) {
        fprintf(f,"  %s -> reset_%x;\n",
                name, b->end_pc);
      } else if (b->flows[i].flow == fk_unknown) {
        fprintf(f,"  %s -> unknown_%x;\n",
                name, b->end_pc);
      } else if (b->flows[i].flow == fk_switch) {
        struct sa_switch_kase *sc;

        sc = b->swtch;
        while (sc) {
          fprintf(f,"  %s -> switch %s_%x;\n",
                  name, 
                  dot_sanitise(block_pick_label(sc->kase)),
                  sc->kase->start_pc);
          sc = sc->next;
        }
      } else if (b->next[i]->n_labels) {
        fprintf(f,"  %s -> %s_%x;\n",
               name,
               dot_sanitise(block_pick_label(b->next[i])),
               b->next[i]->start_pc);
      } else {
        fprintf(f,"  %s -> block_%x;\n",
               name, b->next[i]->start_pc);
      }
    }
  }
}

void sa_debug_dot_follow_flow(struct sa_block *b, FILE *f) {
  int i;

  if (b->flags & sbf_visited) return;
  b->flags |= sbf_visited;
  sa_debug_dot_block(b,f);
  for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
    if ((b->flows[i].flow != fk_none) && (b->next[i])) {
      if (b->flows[i].flow == fk_return) {
        // end
        continue;
      } else if (b->flows[i].flow == fk_reset) {
        // end
        continue;
      } 
      sa_debug_dot_follow_flow(b->next[i],f);
    }   
  }
}

void sa_debug_dot(char *start_symbol) {
  FILE *f;
  struct sa_block *b;

  f = fopen("debug.dot","w");
  if (f == NULL) {
    fprintf(stderr,"cannot open debug.dot\n");
    return;
  }
  fprintf(f, "digraph %s {\n", start_symbol);
  if (strcmp(start_symbol,"__reset") == 0) {
    for (b = sa_first_block; b; b = b->link_next) {
      sa_debug_dot_block(b,f);
    }
  } else {
    block_clear_flags(sbf_visited);
    b = block_lookup_by_name(start_symbol);
    sa_debug_dot_follow_flow(b,f);
  }
  fprintf(f,"}\n");
  fclose(f);
}

/* returns a terminal node on a 'deepest' flow */
static struct sa_block *sa_debug_check_deepest(struct sa_block *b) {
  int i;
  struct sa_block *deepest = NULL;

  for (i = 0; i < MAX_FLOW_TRANSFERS; i++) {
    if (b->next[i]) switch (b->flows[i].flow) {
      case fk_none:
      case fk_unknown:
      case fk_return:
      case fk_reset:
        break;

      default:
        if (deepest == NULL) {
          deepest = b->next[i];
        } else if (b->next[i]->stack_info.maximal > 
                   deepest->stack_info.maximal) {
          deepest = b->next[i];
        }
    }
  }
  if (deepest) return sa_debug_check_deepest(deepest);
  return b;
}

#ifdef LICENSE_MANAGER_XCLM

#define MCHP_MAX_LICENSEPATH_LINE_LENGTH 255
#define MCHP_LICENSE_CONF_FILENAME "license.conf"
#define MCHP_LICENSEPATH_MARKER "license_dir"
#ifdef __MINGW32__
#define MCHP_XCLM_FILENAME "xclm.exe"
#else
#define MCHP_XCLM_FILENAME "xclm"
#endif
#ifndef WIFEXITED
#define WIFEXITED(S) (((S) & 0xff) == 0)
#endif
#ifndef WEXITSTATUS
#define WEXITSTATUS(S) (((S) & 0xff00) >> 8)
#endif


#undef STANDARD_EXEC_PREFIX
#define STANDARD_EXEC_PREFIX "/bin/"

#undef STANDARD_LIBEXEC_PREFIX
#define STANDARD_LIBEXEC_PREFIX "/bin/"

#undef STANDARD_BINDIR_PREFIX
#define STANDARD_BINDIR_PREFIX "/bin/bin"

#ifndef GET_LINE
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

static char*
get_license_manager_path (void)
{
  char *conf_dir, *conf_fname;

  FILE *fptr;
  char line [MCHP_MAX_LICENSEPATH_LINE_LENGTH] = {0};
  char *xclmpath;
  int xclmpath_length;
  struct stat filestat;

  xclmpath_length = MCHP_MAX_LICENSEPATH_LINE_LENGTH+strlen(MCHP_XCLM_FILENAME);
  xclmpath = (char*)xcalloc(xclmpath_length+1,sizeof(char));

  /* MCHP_LICENSE_CONF_FILENAME resides in the same directory as pic30-gcc */
  conf_dir = make_relative_prefix(program_name, STANDARD_BINDIR_PREFIX,
                                         STANDARD_EXEC_PREFIX);

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
  else  if (-1 == stat (xclmpath, &filestat))
    {
      /*  If we can't find the license configuration file, try the compiler bin
       *  directory.
       */
      strncpy (xclmpath, make_relative_prefix(program_name,
                                         STANDARD_BINDIR_PREFIX,
                                         STANDARD_EXEC_PREFIX),
               xclmpath_length);

      /* Append the xclm executable name to the directory. */
      if (xclmpath [strlen (xclmpath) - 1] != '/'
          && xclmpath [strlen (xclmpath) - 1] != '\\')
        strcat (xclmpath, "/");
      strcat (xclmpath, MCHP_XCLM_FILENAME);

      if (-1 == stat (xclmpath, &filestat))
        {
          /*  If we can't find the license configuration file, try the
           *  compiler bin directory.
           */
          strncpy (xclmpath, "/opt/Microchip/xclm/bin", xclmpath_length);
          /* Append the xclm executable name to the directory. */
          if (xclmpath [strlen (xclmpath) - 1] != '/'
              && xclmpath [strlen (xclmpath) - 1] != '\\')
            strcat (xclmpath, "/");
          strcat (xclmpath, MCHP_XCLM_FILENAME);
        }
    }
  if (fptr != NULL)
    {
      fclose (fptr);
      fptr = NULL;
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

  return xclmpath;
}
enum check_license_flag {
  check_for_normal_license,
  check_for_code_coverage = 1
};

static int
get_license (enum check_license_flag type)
{
  /*
   *  On systems where we have a licence manager, call it
   */
  char *exec;
#ifdef _BUILDC30_FUSA_
  char kopt[] = "-fcfs";
#else
  char kopt[] = "-full-checkout-for-compilers";
#endif
  char ccov_kopt[] = "-full-checkout-for-compilers";
  char  product_xccov[] = "swxc-cov";
  char  version_xccov[4] = "1.0";
  char date[] = __DATE__;
  int mchp_license_valid;
  int pic30_nofallback = 0;
  const char *pic30_nofallback_error = 0;
  char product[] = "swxc16";

  char * args[] = { NULL, NULL, NULL, NULL, NULL, NULL};

  char *err_msg=(char*)"", *err_arg=(char*)"";
  const char *failure = NULL;
  int status = 0;
  int err = 0;
  struct stat filestat;

#ifdef _BUILDC30_FUSA_
  pic30_nofallback = 1;
#endif

  mchp_license_valid = 0;

  /* Arguments to pass to xclm */
  if (type == check_for_code_coverage) {
    /* Need to send seperate args to xclm for code coverage */
    args[1] = ccov_kopt;
    args[2] = product_xccov;
    args[3] = version_xccov;
    args[4] = date;
  } else {
    args[1] = kopt;
  args[2] = product;
  args[3] = version_string;
  args[4] = date;
  }
  /* Get a path to the license manager to try */
  exec = get_license_manager_path();

#ifdef MCHP_DEBUG
  fprintf (stderr, "exec: %s\n", exec);
#endif

  if (-1 == stat (exec, &filestat)) {
    /* Set free edition if the license manager isn't available. */
    mchp_license_valid=MCHP_XCLM_FREE_LICENSE;
    if (pic30_nofallback) {
      pic30_nofallback_error="Cannot find valid XCLM license manager.";
    }
  } else {
    /* Found xclm */
    mchp_license_valid=-1;
  }

  /* Call xclm to determine the license */
  if (-1 == mchp_license_valid) {
    int pid;
    char *err_msg, *err_arg;

    args[0] = exec;

    pid = pexecute(exec, args, "foobar", 0, &err_msg, &err_arg,
                   PEXECUTE_FIRST | PEXECUTE_LAST);
    if (pid == -1) fatal(_(err_msg), exec);
    pid = pwait(pid, &status, 0);
    if (type == check_for_normal_license) {
      if (pid < 0) {
        /* Set free edition if the license manager isn't available. 
         * The free edition disables optimization options without an eval 
         * period. 
         */
        mchp_license_valid=MCHP_XCLM_FREE_LICENSE;
        if (pic30_nofallback) {
          pic30_nofallback_error="Cannot fall back to free license.";
        } else {
          fprintf(stderr,ERROR "Could not retrieve compiler license (%s)", failure);
        }
      } else if (WIFEXITED(status)) {
        mchp_license_valid = WEXITSTATUS(status);
#ifdef _BUILDC30_FUSA_
        /* if we are fusa license, return true only if we have a FS license */
        if (mchp_license_valid != MCHP_XCLM_VALID_FS_LICENSE) 
#else
        /* if we are normal license, return FREE if license is wrong */
        if (mchp_license_valid > MCHP_XCLM_VALID_PRO_LICENSE)
#endif
        {
          mchp_license_valid = MCHP_XCLM_FREE_LICENSE;
        }
      }
      if ((mchp_license_valid == MCHP_XCLM_FREE_LICENSE) && 
          (pic30_nofallback)) {
        pic30_nofallback_error="Cannot fall back to free license.";
      }
    } else if (type == check_for_code_coverage) {
      if (pid < 0) {
        mchp_license_valid = MCHP_XCLM_FREE_LICENSE;
      } else {
        mchp_license_valid = WEXITSTATUS(status);
        /* return FREE if we dont' have CCOV license */
        if (mchp_license_valid != MCHP_XCLM_VALID_CCOV_LICENSE) {
          mchp_license_valid = MCHP_XCLM_FREE_LICENSE;
        }
      }
    }
  }
  if ((pic30_nofallback)  && (pic30_nofallback_error != 0)) {
    fatal(_(pic30_nofallback_error));
  }
#if MCHP_DEBUG
  fprintf (stderr, "valid license: %d\n", mchp_license_valid);
#endif
  return mchp_license_valid;
}
#endif

void sa_analyse_stack(bfd *abfd, asymbol **syms, long int symcount, 
                      char *start_symbol, char *debug_string, char *extra_out) {
  int deepest_flow;
  static char info_buffer[1024];
  char *buffer = info_buffer;


#ifdef LICENSE_MANAGER_XCLM  
  int pic30_license_valid = 1;
  /* Check for licensing */
  pic30_license_valid = get_license(check_for_normal_license);
  if (pic30_license_valid < MCHP_XCLM_VALID_STANDARD_LICENSE) {
    fprintf(stderr, "Option -mchp-stack-usage has been disabled, this requires a PRO license."
                    ERRORNL "Visit https://www.microchip.com/ to purchase a new key.\n");
    return;
  }
#endif
  
  if (abfd->arch_info) pic30_load_codeguard_settings(abfd->arch_info,0);
  if (debug_string) {
    if (strstr(debug_string,"scan")) {
      sa_debug |= dbg_symbol_scanning;
    }
    if (strstr(debug_string,"create")) {
      sa_debug |= dbg_symbols_created;
    }
    if (strstr(debug_string,"decode")) {
      sa_debug |= dbg_insn_decode;
    }
    if (strstr(debug_string,"flow")) {
      sa_debug |= dbg_follow_flow;
    }
    if (strstr(debug_string,"dot")) {
      sa_debug |= dbg_dot;
    }
    if (strstr(debug_string,"deepest")) {
      sa_debug |= dbg_check_deepest;
    }
    if (strstr(debug_string,"extra")) {
      sa_debug |= dbg_print_extra;
    }
  }
  opb = bfd_octets_per_byte (abfd);
  sa_gather_flash_symbols(syms,symcount);
  if (sa_debug & dbg_symbols_created) 
    block_dump_list("sa_gather_flash_symbols");
  sa_fill_in_end_pc();
  if (sa_debug & dbg_symbols_created) block_dump_list("sa_fill_in_end_pc");
  sa_split_blocks(abfd, syms, symcount);
  if (sa_debug & dbg_symbols_created) block_dump_list("sa_split_blocks");
  sa_build_flow_graph();
  deepest_flow = sa_analyze_flow_graph(start_symbol);
  if (sa_debug & dbg_symbols_created) block_dump_list("sa_analyze_flow_graph");
  if (strcmp(start_symbol,"__reset") == 0) {
    /* if we asked for a start symbol other than __reset, then there
       may be disjoint flows */
    sa_follow_disjoint_flows();
  }
  if (sa_debug & dbg_dot) {
    sa_debug_dot(start_symbol);
  }

  buffer += sprintf(buffer,INFO "In the call graph beginning at %s(),\n"
                           INFO "   %d bytes of stack are required.\n", 
                    start_symbol, deepest_flow);
  buffer_output(&header,info_buffer,0);
  buffer = info_buffer;

  sa_output_messages(NULL);
  if (extra_out) {
    FILE *extra_output = NULL;

    extra_output = fopen(extra_out, "a");
    if (extra_output) {
      sa_output_messages(extra_output);
    } else {
      fprintf(stderr,ERROR "cannot open '%s' for writing," ERRORNL
                           "unable to log stack analysis messages.\n", extra_out);
    }
  }
  buffer_clear(&recursion);
  buffer_clear(&isrs);
  buffer_clear(&indirect_calls);
  buffer_clear(&disconnected_fns);
  buffer_clear(&footer);
  buffer_clear(&header);
}
