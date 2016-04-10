/* Target-machine dependent code for Microchip dsPIC
   Copyright 2001
   Free Software Foundation, Inc.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

#include <assert.h>
#include "defs.h"
#include "frame.h"
#include "obstack.h"
#include "symtab.h"
#include "gdbcmd.h"
#include "gdbtypes.h"
#include "dis-asm.h"
#include "gdbcore.h"
#include "inferior.h"

#include "value.h" /* For read_register() */


char pic30_call_dummy_words[1];


CORE_ADDR 
pic30_push_return_address (CORE_ADDR pc, CORE_ADDR sp)
{
  char buf[4];
  assert (pc % 2 == 0);
  pc /= 2;
  /* build up into buf[] first to handle endian issues */
  buf [0] = (char)pc;
  buf [1] = (char)(pc>>8);
  buf [2] = (char)(pc>>16);
  buf [3] = (char)(pc>>24);
  write_memory (sp, buf, 4);
  return sp + 4; /* stack grows upwards */
}


unsigned char *
pic30_breakpoint_from_pc (pcptr, lenptr)
   CORE_ADDR * pcptr __attribute__((__unused__));
   int * lenptr;
{
  static unsigned char rc[] = PIC30_BREAKPOINT;
  *lenptr = sizeof (rc);
  return rc;
}

/* Put here the code to store, into a struct frame_saved_regs,
   the addresses of the saved registers of frame described by FRAME_INFO.
   This includes special registers such as pc and fp saved in special
   ways in the stack frame.  sp is even more special:
   the address we return for it IS the sp for the next frame.  */

void
pic30_frame_init_saved_regs (frame_info)
  struct frame_info * frame_info;
{
  printf ("FIXME: pic30_frame_init_saved_regs\n");
  assert (0);

  frame_saved_regs_zalloc (frame_info);

  frame_info->saved_regs[FP_REGNUM] = frame_info->frame - 2;
  frame_info->saved_regs[PC_REGNUM] = frame_info->frame - 6;
}

CORE_ADDR 
pic30_frame_saved_pc (frame_info)
  struct frame_info * frame_info;
{
  CORE_ADDR lsw, msw;
  CORE_ADDR rc;
  /* for the given frame, retrieve the return address stored on the
   * stack.
   */
  lsw = read_memory_unsigned_integer ((frame_info->frame - 6) | 0x80000000, 2);
  msw = read_memory_unsigned_integer ((frame_info->frame - 4) | 0x80000000, 2);
  rc = ((msw << 16) | lsw) * 2;

  return rc;
}

void 
pic30_pop_frame (void)
{
  register struct frame_info *frame = get_current_frame ();

  if (PC_IN_CALL_DUMMY (frame->pc, frame->frame, frame->frame))
    generic_pop_dummy_frame ();
  else
    {
      CORE_ADDR old_fp;
      CORE_ADDR ret_addr;
      /* if we have a frame pointer, we can do this; otherwise,
       * we're f&cked. Assume the frame->frame is the FP value.
       *
       * This should probably go through and restore the register
       * values via the frame_saved_regs stuff instead of doing it
       * like this. unsure, though... FIXME:
       */
      old_fp = read_memory_unsigned_integer ((frame->frame - 2) | 0x80000000, 2);
      ret_addr = FRAME_SAVED_PC (frame);
      write_register (FP_REGNUM, old_fp);
      /* remove the old fp and the return value */
      write_register (SP_REGNUM, frame->frame - 6);
      /* apparently this is supposed to reset the PC as well... */
      write_register (PC_REGNUM, ret_addr);
    }
}

CORE_ADDR 
pic30_frame_chain (struct frame_info *frame_info)
{
  CORE_ADDR old_fp;
  /* *FP == old FP */
  old_fp = read_memory_unsigned_integer ((frame_info->frame - 2) | 0x80000000, 2);
  
  return old_fp;
}

CORE_ADDR 
pic30_skip_prologue (CORE_ADDR pc)
{
  CORE_ADDR func_addr, func_end;
  struct symtab_and_line sal;

  /* If we have line debugging information, then the end of the
   * prologue should be the first assembly instruction of  
   * the first source line 
   */
  if (find_pc_partial_function (pc, NULL, &func_addr, &func_end))
    {
      sal = find_pc_line (func_addr, 0);
      if (sal.end && sal.end < func_end)
	return sal.end;
    }

  return pc;
}

/* get the return address from the stack immediately following
 * a call instruction. The prologue code has not yet
 * executed.
 */
int 
pic30_saved_pc_after_call (struct frame_info *frame)
{
  unsigned long pc;
  pc = ADDR_BITS_REMOVE
    (read_memory_unsigned_integer ((read_register (SP_REGNUM) - 4) | 0x80000000, 4) * 2);
  return pc;
}

const char *
pic30_register_name (i)
  unsigned int i;
{
  static unsigned char *reg_names[] = 
    { "W0", "W1", "W2", "W3", "W4", "W5", "W6", "W7", "W8", 
      "W9", "W10", "W11", "W12", "W13", "W14", "W15", "PC" };

  if (i >= NUM_REGS) return NULL;

  return reg_names[i];
}


/* the first 8 regs are used for parameter passing */
#define NUM_ARG_REGS 8
CORE_ADDR
pic30_push_arguments (int nargs,
                      value_ptr *args,
                      CORE_ADDR sp,
                      int struct_return,
                      CORE_ADDR struct_addr)
{
  /* ASSERT ( !struct_return); */
  int i;
  int regmap [NUM_ARG_REGS] = {0}; /* all will init to zero */


  /* this algorithm matches (and must match) that found in 
   * gcc/config/pic30/pic30.c for allocating arguments.
   */
  for (i = 0; i < nargs; i++)
    {
      int arglen = TYPE_LENGTH (VALUE_ENCLOSING_TYPE (args[i])) / 2;
      int j;
      /* try to fit the argument into registers */
      for (j = 0 ; j < NUM_ARG_REGS ; j++)
        {
          if ((regmap[j] == 0) &&
              ((j + arglen) <= NUM_ARG_REGS) &&
              ((j & (arglen-1)) == 0))
            {
              int k;
              /* store the argument in register(s) starting at Wj */
              write_register_bytes (j * 2, 
                                    VALUE_CONTENTS_ALL (args[i]), 
                                    arglen * 2);
              /* mark the registers used */
              for (k = 0 ; k < arglen ; k++)
                regmap [k+j] = 1;
              break;
            }
        }
      if (j == NUM_ARG_REGS)
        {
          /* it didn't fit in registers, so it goes on the stack... */
          /* stack grows upward */
          write_memory (sp, VALUE_CONTENTS_ALL (args[i]), arglen);
          sp += arglen;
        }
    }
  return sp;
}


CORE_ADDR 
pic30_pointer_to_address (struct type *type, unsigned char *buf)
{
  CORE_ADDR addr;
  /* if the pointer is not a function pointer, we can assume that it's
   * a pointer to data memory.
   */
  assert (TYPE_CODE (type) == TYPE_CODE_PTR);
  /* this assumes that buf is in target byte order. is that
   * a valid assumption?
   *
   * ugh. gdb also currently thinks that pointers are 16-bit.
   * The problem is that that's sorta true. Pointers are 16-bit.
   * Addresses are 24-bit, though.
   */
  addr = /*(buf[3] << 24) | (buf[2] << 16) | */(buf[1] << 8) | buf[0];
  switch (TYPE_CODE (TYPE_TARGET_TYPE (type)))
    {
    case TYPE_CODE_METHOD:
    case TYPE_CODE_FUNC:
    case TYPE_CODE_VOID:
      break;
    default:
      addr |= 0x80000000;
      break;
    }
  return addr;
}

void pic30_address_to_pointer (struct type *type, unsigned char *buf, CORE_ADDR addr)
{
  /* if the pointer is not a function pointer, we can assume that it's
   * a pointer to data memory.
   */
  assert (TYPE_CODE (type) == TYPE_CODE_PTR);
  switch (TYPE_CODE (TYPE_TARGET_TYPE (type)))
    {
    case TYPE_CODE_METHOD:
    case TYPE_CODE_FUNC:
    case TYPE_CODE_VOID:
      break;
    default:
      addr |= 0x80000000;
      break;
    }
  buf[0] = addr;
  buf[1] = addr >> 8;
  buf[2] = addr >> 16;
  buf[3] = addr >> 24;
}


/* Initialization code.  */

void
_initialize_pic30_tdep ()
{
  tm_print_insn = pic30_print_insn;
}
