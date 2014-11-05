/* Definitions to target GDB to dsPIC targets.
   Copyright 2001 Free Software Foundation, Inc.

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

#ifndef TM_PIC30_H
#define TM_PIC30_H

/* use this to handle any #ifdef target specific munging in the front end.
 * this is evil. heinous. downright bad, even. better ideas??
 */
#define PIC30_TARGET 1

#define DEFAULT_PROMPT "(gdb-pic30) "

#define PIC30_BREAKPOINT { 0x00, 0x40, 0xDA, 0x00 }


extern unsigned char * pic30_breakpoint_from_pc (CORE_ADDR *, int *);
#define BREAKPOINT_FROM_PC(PCPTR, LENPTR) \
   pic30_breakpoint_from_pc (PCPTR, LENPTR)

/* Amount PC must be decremented by after a breakpoint.  This is often
   the number of bytes in BREAKPOINT but not always.  */

#define DECR_PC_AFTER_BREAK 0



/* Try our best to support inferior function calls */

extern char pic30_call_dummy_words[];

#define CALL_DUMMY_P 1
#define PUSH_CALL_DUMMY 1
#define CALL_DUMMY_WORDS (&pic30_call_dummy_words[0])
#define SIZEOF_CALL_DUMMY_WORDS 0
#define CALL_DUMMY_LOCATION AT_ENTRY_POINT
#define CALL_DUMMY_ADDRESS() (entry_point_address())
#define CALL_DUMMY_START_OFFSET 0
#define FIX_CALL_DUMMY generic_fix_call_dummy
#define PUSH_DUMMY_FRAME {generic_push_dummy_frame();}
#define CALL_DUMMY_BREAKPOINT_OFFSET (0)
CORE_ADDR pic30_push_return_address (CORE_ADDR pc, CORE_ADDR sp);
#define PUSH_RETURN_ADDRESS(pc,sp) pic30_push_return_address (pc,sp)
/* Discard from the stack the innermost frame, restoring all registers.  */
extern void pic30_pop_frame (void);
#define POP_FRAME		{ pic30_pop_frame (); }

#define PUSH_ARGUMENTS pic30_push_arguments


/* according to blockframe.c, we can use the generic version */
#define FRAME_CHAIN_VALID(chain, thisframe) \
     generic_file_frame_chain_valid (chain, thisframe)


/* We want to be able to handle functions which don't have a frame */
#define FRAMELESS_FUNCTION_INVOCATION(frame) (frameless_look_for_prologue(frame))


/* IEEE format floating point.  */
#define IEEE_FLOAT (1)


/* Offset from address of function to start of its code.  Zero on most
   machines.  */

#define FUNCTION_START_OFFSET	0


/* FRAME_CHAIN takes a frame's nominal address and produces the
   frame's chain-pointer.

   However, if FRAME_CHAIN_VALID returns zero,
   it means the given frame is the outermost one and has no caller.  */
extern CORE_ADDR pic30_frame_chain (struct frame_info *);
#define FRAME_CHAIN(FRAME)      pic30_frame_chain (FRAME)


extern CORE_ADDR pic30_frame_saved_pc (struct frame_info *);
#define FRAME_SAVED_PC(FRAME)   pic30_frame_saved_pc (FRAME)

/* Determines the address of all registers in the current stack frame
 * storing each in frame->saved_regs. Space for frame->saved_regs
 * shall be allocated by FRAME_INIT_SAVED_REGS using either 
 * frame_saved_regs_zalloc or frame_obstack_alloc.
 */
struct frame_info;
extern void pic30_frame_init_saved_regs (struct frame_info *);
#define FRAME_INIT_SAVED_REGS(FRAME) \
    pic30_frame_init_saved_regs (FRAME)

#define FRAME_ARGS_ADDRESS(fi) ((fi)->frame | 0x80000000)
#define FRAME_LOCALS_ADDRESS(fi) ((fi)->frame | 0x80000000)

/* since we're Harvard, we need to map pointers <--> addresses according
 * to type
 */
CORE_ADDR pic30_pointer_to_address (struct type *type, unsigned char *buf);
void pic30_address_to_pointer (struct type *type, unsigned char *buf, CORE_ADDR addr);

#define POINTER_TO_ADDRESS pic30_pointer_to_address
#define ADDRESS_TO_POINTER pic30_address_to_pointer


/* the dsPIC stack grows upwards */
#define INNER_THAN(lhs, rhs) ((lhs) > (rhs))




/* the dsPIC contains:
 *  16 16-bit general purpose registers
 * + 1 PC
 * --
 * 17 registers
 */
#define NUM_REGS 17

/* all real registers are 16 bits, but the PC is bigger */
#define REGISTER_SIZE (2)
#define REGISTER_RAW_SIZE(N) ((N)==PC_REGNUM ? 4 : REGISTER_SIZE)
#define MAX_REGISTER_RAW_SIZE 4

/* Number of bytes of storage in the program's representation
   for register N.  */

#define REGISTER_VIRTUAL_SIZE(N) REGISTER_RAW_SIZE(N)
#define MAX_REGISTER_VIRTUAL_SIZE (MAX_REGISTER_RAW_SIZE)

/* Return the GDB type object for the "standard" data type
   of data in register N.  */

#define REGISTER_VIRTUAL_TYPE(N) (builtin_type_unsigned_int)

/* Total amount of space needed to store our copies of the machine's
   register state, the array `registers'.  */
// 32 for Wregs, 4 for PC
#define REGISTER_BYTES (36)

/* Index within `registers' of the first byte of the space for
   register N.  */
// even the PC starts on an address found this way
#define REGISTER_BYTE(N) ((N) * REGISTER_SIZE)

/* Extract from an array REGBUF containing the (raw) register state
   a function return value of type TYPE, and copy that, in virtual format,
   into VALBUF.  

   handling structure return values??
*/


#define EXTRACT_RETURN_VALUE(TYPE,REGBUF,VALBUF) \
  memcpy(VALBUF, REGBUF + REGISTER_BYTE(0), TYPE_LENGTH(TYPE));

/* Write into appropriate registers a function return value
   of type TYPE, given in virtual format. 
   huh? why is this undefined??
*/
#define STORE_RETURN_VALUE(TYPE,VALBUF) internal_error (__FILE__, __LINE__, "failed internal consistency check");


/* Return number of bytes at start of arglist that are not really args.  */

#define FRAME_ARGS_SKIP 0



/* Advance PC across any function entry prologue instructions
   to reach some "real" code.  */

extern CORE_ADDR pic30_skip_prologue (CORE_ADDR ip);
#define SKIP_PROLOGUE(ip)   (pic30_skip_prologue (ip))


/* Immediately after a function call, return the saved pc.
   Can't always go through the frames for this because on some machines
   the new frame is not set up until the new function executes
   some instructions.  */


extern int pic30_saved_pc_after_call (struct frame_info *frame);
#define SAVED_PC_AFTER_CALL(frame) pic30_saved_pc_after_call(frame)


/* We can't tell how many args there are
   now that the C compiler delays popping them.  */
#if !defined (FRAME_NUM_ARGS)
#define FRAME_NUM_ARGS(fi) (-1)
#endif

/* Register numbers of various important registers.
   Note that some of these values are "real" register numbers,
   and correspond to the general registers of the machine,
   and some are "phony" register numbers which are too large
   to be actual register numbers as far as the user is concerned
   but do serve to get the desired values when passed to read_register.  */

#define PC_REGNUM 	16	/* Contains program counter */
#define FP_REGNUM 	14	/* Contains fp, whatever memory model */
#define SP_REGNUM 	15	/* Conatins sp, whatever memory model */

/* Define the bit, byte, and word ordering of the machine.  */
#define TARGET_BYTE_ORDER LITTLE_ENDIAN
#define TARGET_BYTE_ORDER_DEFAULT LITTLE_ENDIAN

/* the pic30 has 'int' as a 16-bit integer */
#define TARGET_INT_BIT (2* TARGET_CHAR_BIT)
/* the pic30 has 'long' as a 32-bit integer */
#define TARGET_LONG_BIT (4* TARGET_CHAR_BIT)

/* get the name of a register */
const char *pic30_register_name (unsigned int);
#define REGISTER_NAME(i) (pic30_register_name(i))

#endif
