/* pic30-opc.c -- This file contains the opcodes/operands for Microchip dsPIC30
 * Copyright (C) 2000 Free Software Foundation, Inc.
 * Contributed by Microchip Corporation.
 * Written by Tracy A. Kuhrt
 * Modified by John Elliott (john.elliott@microchip.com)
 *
 * This file is part of GAS, the GNU Assembler.
 *
 * GAS is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * GAS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with GAS; see the file COPYING.  If not, write to the Free Software
 * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <stdio.h>
#include <stdlib.h>
#include "sysdep.h"
#include <dis-asm.h>
#include <opcode/pic30.h>
#include "pic30-opc.h"
#include "bfd.h"
#include <coff-pic30.h>

/******************************************************************************
 * PROTOTYPES
 ******************************************************************************/

unsigned char pic30_match_even PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_even_not_14 PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_div_src_reg PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_file_reg_byte PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_file_reg PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_file_reg_word PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_byte_10bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_10bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_16bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_unsigned_short_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_3bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_34bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_nibble PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_unsigned_14bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_unsigned_15bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_frame_size PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_16bit_unsigned_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_4bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_short_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_6bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_dsp_writeback PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_dsp_prefetch_dst PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_dsp_x_prefetch_operation PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_dsp_y_prefetch_operation PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_power_save_mode PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_page_reg PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_byte_8bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_unsigned_3bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_unsigned_2bit_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_wid5_lit PARAMS
   ((const struct pic30_operand_value * check));
unsigned char pic30_match_dividend16_reg_2 PARAMS
   ((const struct pic30_operand_value * check));

unsigned long pic30_insert_34bit_lit PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_dividend_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_dividend16_reg_2 PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_divf2_dividend_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_file_reg_word_with_dst PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_g_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_h_dst_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_p_src_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_q_dst_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_lo_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_dsp_writeback PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_dsp_x_prefetch_operation PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_dsp_y_prefetch_operation PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_byte_cp_8bit_lit PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_byte_l_operand PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_page_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_wmul_dst_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));
unsigned long pic30_insert_sacd_dst_reg PARAMS ((unsigned long insn,
   unsigned long flags,
   const struct pic30_operand * opnd,
   const struct pic30_operand_value * operand_value,
   char **error_msg));

char * pic30_extract_file_reg_word_with_dst PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
unsigned long pic30_get_g_or_h_mode_value PARAMS (( unsigned long type,
   char **error_msg));
char * pic30_generate_g_or_h_operand PARAMS (( unsigned long insn,
   long reg_num, long mode, unsigned long flags, unsigned char * err));
unsigned long pic30_insert_g_or_h_displacement_value PARAMS (( unsigned long insn,
   unsigned long flags, long mode, long value));
char * pic30_extract_g_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info, unsigned long flags,
   const struct pic30_operand * opnd, unsigned char * err));
char * pic30_extract_h_dst_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info, unsigned long flags,
   const struct pic30_operand * opnd, unsigned char * err));
unsigned long pic30_get_p_or_q_mode_value PARAMS (( unsigned long type,
   char **error_msg));
char * pic30_generate_p_or_q_operand PARAMS (( long reg_num, long mode,
   unsigned char * err));

char * pic30_extract_p_src_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info, unsigned long flags,
   const struct pic30_operand * opnd, unsigned char * err));
char * pic30_extract_q_dst_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info, unsigned long flags,
   const struct pic30_operand * opnd, unsigned char * err));
char * pic30_extract_lo_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_byte_10bit_lit PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_w_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_offset PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_branch_on_condition_operand PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_branch_on_dsp_condition_operand PARAMS
   ((unsigned long insn,
     struct disassemble_info * info,
     unsigned long flags, const struct pic30_operand * opnd,
     unsigned char * err));
char * pic30_extract_dsp_accumulator_select PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_dsp_writeback PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_dsp_x_prefetch_operation PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_dsp_prefetch_dst PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_dsp_y_prefetch_operation PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_dsp_multiplicand PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_dsp_square PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_byte_cp_8bit_lit PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_page_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_wmul_dst_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info,
   unsigned long flags, const struct pic30_operand * opnd,
   unsigned char * err));
char * pic30_extract_sacd_dst_reg PARAMS ((unsigned long insn,
   struct disassemble_info * info, unsigned long flags,
   const struct pic30_operand * opnd, unsigned char * err));


/******************************************************************************
 * pic30_operator_mask[]
 ******************************************************************************/

const unsigned long pic30_operator_mask[] =
{
   OPND_UNKNOWN,                            /* O_illegal */
   OPND_UNKNOWN,                            /* O_absent */
   OPND_CONSTANT,                           /* O_constant */
   OPND_SYMBOL,                             /* O_symbol */
   OPND_SYMBOL,                             /* O_symbol_rva */
   OPND_REGISTER_DIRECT,                    /* O_register */
   OPND_UNKNOWN,                            /* O_big */
   OPND_EXPRESSION,                         /* O_uminus */
   OPND_EXPRESSION,                         /* O_bit_not */
   OPND_EXPRESSION,                         /* O_logical_not */
   OPND_EXPRESSION,                         /* O_multiply */
   OPND_EXPRESSION,                         /* O_divide */
   OPND_EXPRESSION,                         /* O_modulus */
   OPND_EXPRESSION,                         /* O_left_shift */
   OPND_EXPRESSION,                         /* O_right_shift */
   OPND_EXPRESSION,                         /* O_bit_inclusive_or */
   OPND_EXPRESSION,                         /* O_bit_or_not */
   OPND_EXPRESSION,                         /* O_bit_exclusive_or */
   OPND_EXPRESSION,                         /* O_bit_and */
   OPND_EXPRESSION,                         /* O_add */
   OPND_EXPRESSION,                         /* O_subtract */
   OPND_EXPRESSION,                         /* O_eq */
   OPND_EXPRESSION,                         /* O_ne */
   OPND_EXPRESSION,                         /* O_lt */
   OPND_EXPRESSION,                         /* O_le */
   OPND_EXPRESSION,                         /* O_ge */
   OPND_EXPRESSION,                         /* O_gt */
   OPND_EXPRESSION,                         /* O_logical_and */
   OPND_EXPRESSION,                         /* O_logical_or */
   OPND_UNKNOWN,                            /* O_index */
   OPND_REGISTER_INDIRECT,                  /* O_md1 */
   OPND_REGISTER_POST_DECREMENT,            /* O_md2 */
   OPND_REGISTER_POST_INCREMENT,            /* O_md3 */
   OPND_REGISTER_PRE_DECREMENT,             /* O_md4 */
   OPND_REGISTER_PRE_INCREMENT,             /* O_md5 */
   OPND_REGISTER_WITH_DISPLACEMENT,         /* O_md6 */
   OPND_REGISTER_PLUS_LITERAL,              /* O_md7 */
   OPND_REGISTER_MINUS_LITERAL,             /* O_md8 */
   OPND_REGISTER_POST_INCREMENT_BY_N,       /* O_md9 */
   OPND_REGISTER_POST_DECREMENT_BY_N,       /* O_md10 */
   OPND_W_REG,                              /* O_md11 */
   OPND_BRANCH_ON_DSP_CONDITION,            /* O_md12 */
   OPND_BRANCH_ON_CONDITION,                /* O_md13 */
   OPND_DSP_ACCUMULATOR_SELECT,             /* O_md14 */
   OPND_DSP_MULTIPLICAND,                   /* O_md15 */
   OPND_DSP_SQUARE,                         /* O_md16 */
   OPND_UNKNOWN,                            /* O_max */
};

/******************************************************************************
 * pic30_registers[]
 ******************************************************************************/
const char * pic30_registers[] =
{
   "w0", "w1", "w2", "w3", "w4", "w5", "w6", "w7", "w8", "w9", "w10", "w11",
   "w12", "w13", "w14", "w15",
   "W0", "W1", "W2", "W3", "W4", "W5", "W6", "W7", "W8", "W9", "W10", "W11",
   "W12", "W13", "W14", "W15",
};

const int pic30_num_registers =
   (sizeof(pic30_registers) / sizeof(char *));

const char *pic30_page_registers[] = { "DSRPAG", "DSWPAG", "TBLPAG",
                                       "<not-a-pag>", 0 };

/******************************************************************************
 * pic30_sfr_symbols[]
 ******************************************************************************/
const struct pic30_predefined_symbol pic30_sfr_symbols[] =
{
   { "WREG0",  0x0000 },
   { "WREG1",  0x0002 },
   { "WREG2",  0x0004 },
   { "WREG3",  0x0006 },
   { "WREG4",  0x0008 },
   { "WREG5",  0x000A },
   { "WREG6",  0x000C },
   { "WREG7",  0x000E },
   { "WREG8",  0x0010 },
   { "WREG9",  0x0012 },
   { "WREG10", 0x0014 },
   { "WREG11", 0x0016 },
   { "WREG12", 0x0018 },
   { "WREG13", 0x001A },
   { "WREG14", 0x001C },
   { "WREG15", 0x001E },
   { "PC",     0x0020 }, /* 3 bytes */
   { "TBLPTR", 0x002C }, /* 2 bytes */
   { "STATUS", 0x0030 },
   { "DSPCON", 0x0032 },
   { "AD0DAT", 0x003C },
   { "AD0CON", 0x003E },
   { "ACCA",   0x0040 }, /* 3 bytes */
   { "ACCB",   0x0046 }, /* 3 bytes */
   { "TX",     0x004C },
   { "TXSTA",  0x004E },
   { "PRIMOD", 0x0050 },
   { "SECMOD", 0x0052 },
   { "INTCON", 0x0054 },
   { "PORTA",  0x0056 },
   { "PORTB",  0x0058 },
   { "PAGNUM", 0x005A },
   { "PRODH",  0x005C },
   { "PRODL",  0x005E },
   { "TABLAT", 0x0060 },
   { "TOS",    0x0062 },
   { "PCL",    0x0064 },
   { "PCH",    0x0065 },
   { "PCLATH", 0x0066 },
   { "PCLATU", 0x0068 },
   { "GIE",    0x006A },
   { "WDT",    0x006C },
};



const int pic30_num_sfr_symbols =
   (sizeof(pic30_sfr_symbols) / sizeof(struct pic30_predefined_symbol));

/******************************************************************************
 * pic30_relocation_info[]
 ******************************************************************************/

const struct relocation_info pic30_relocation_info[] =
{
#define PIC30_RELOC_INFO_NONE                                       (0)
   { 0, FALSE, 0, NULL },
#define PIC30_RELOC_INFO_FILE_REG_BYTE                              (1)
   { BFD_RELOC_PIC30_FILE_REG_BYTE, FALSE, 2, pic30_match_file_reg_byte },
#define PIC30_RELOC_INFO_FILE_REG                                   (2)
   { BFD_RELOC_PIC30_FILE_REG, FALSE, 2, pic30_match_file_reg },
#define PIC30_RELOC_INFO_FILE_REG_WORD                              (3)
   { BFD_RELOC_PIC30_FILE_REG_WORD, FALSE, 2, pic30_match_file_reg_word },
#define PIC30_RELOC_INFO_FILE_REG_WORD_WITH_DST                     (4)
   { BFD_RELOC_PIC30_FILE_REG_WORD_WITH_DST, FALSE, 2,
     pic30_match_file_reg_word },
#define PIC30_RELOC_INFO_UNSIGNED_4                                 (5)
   { BFD_RELOC_PIC30_UNSIGNED_4, FALSE, 1, pic30_match_nibble },
#define PIC30_RELOC_INFO_UNSIGNED_5                                 (6)
   { BFD_RELOC_PIC30_UNSIGNED_5, FALSE, 1, pic30_match_unsigned_short_lit },
#define PIC30_RELOC_INFO_PCREL_DO                                   (7)
   { BFD_RELOC_PIC30_PCREL_DO, TRUE, 2, NULL },
#define PIC30_RELOC_INFO_SIGNED_10_BYTE                             (8)
   {
	BFD_RELOC_PIC30_SIGNED_10_BYTE,		/* value */
	FALSE,					/* PC relative ? */
	2,					/* fix size (?) */
	pic30_match_byte_10bit_lit		/* is_match() */
   },
#define PIC30_RELOC_INFO_UNSIGNED_10                                (9)
   {
	BFD_RELOC_PIC30_UNSIGNED_10,		/* value */
	FALSE,					/* PC relative ? */
	2,					/* fix size (?) */
	pic30_match_10bit_lit			/* is_match() */
   },
#define PIC30_RELOC_INFO_UNSIGNED_14                                (10)
   { BFD_RELOC_PIC30_UNSIGNED_14, FALSE, 2, pic30_match_unsigned_14bit_lit },
#define PIC30_RELOC_INFO_FRAME_SIZE                                 (11)
   { BFD_RELOC_PIC30_FRAME_SIZE, FALSE, 2, pic30_match_frame_size },
#define PIC30_RELOC_INFO_WORD                                       (12)
   { BFD_RELOC_PIC30_WORD, FALSE, 2, pic30_match_16bit_lit },
#define PIC30_RELOC_INFO_PCREL_BRANCH                               (13)
   { BFD_RELOC_PIC30_PCREL_BRANCH, TRUE, 2, NULL },
#define PIC30_RELOC_INFO_PGM_ADDR_LSB                               (14)
   { BFD_RELOC_PIC30_PGM_ADDR_LSB, FALSE, 3, NULL },
#define PIC30_RELOC_INFO_PGM_ADDR_MSB                               (15)
   { BFD_RELOC_PIC30_PGM_ADDR_MSB, FALSE, 3, NULL },
#define PIC30_RELOC_INFO_BIT_SELECT_3                               (16)
   { BFD_RELOC_PIC30_BIT_SELECT_3, FALSE, 1, pic30_match_3bit_lit }, 
#define PIC30_RELOC_INFO_BIT_SELECT_NIBBLE_BYTE                     (17)
   { BFD_RELOC_PIC30_BIT_SELECT_4_BYTE, FALSE, 1, pic30_match_3bit_lit }, 
#define PIC30_RELOC_INFO_BIT_SELECT_4                               (18)
   { BFD_RELOC_PIC30_BIT_SELECT_4, FALSE, 1, pic30_match_nibble }, 
#define PIC30_RELOC_INFO_DSP_6                                      (19)
   { BFD_RELOC_PIC30_DSP_6, FALSE, 1, pic30_match_6bit_lit }, 
#define PIC30_RELOC_INFO_DSP_PRESHIFT                               (20)
   { BFD_RELOC_PIC30_DSP_PRESHIFT, FALSE, 1, pic30_match_4bit_lit }, 
#define PIC30_RELOC_INFO_PWRSAV_MODE                                (21)
   { BFD_RELOC_PIC30_PWRSAV_MODE, FALSE, 1, pic30_match_power_save_mode },
#define PIC30_RELOC_INFO_UNSIGNED_8                                 (22)
   { BFD_RELOC_PIC30_UNSIGNED_8, FALSE, 1, pic30_match_byte_10bit_lit },
#define PIC30_RELOC_INFO_UNSIGNED_15                                (23)
   { BFD_RELOC_PIC30_UNSIGNED_15, FALSE, 2, pic30_match_unsigned_15bit_lit },
#define PIC30_RELOC_INFO_NO_SHIFT_UNSIGNED_10                       (24)
   {
     BFD_RELOC_PIC30_NO_SHIFT_UNSIGNED_10,	/* value */
     FALSE,					/* PC relative ? */
     2,					        /* fix size (?) */
     pic30_match_10bit_lit			/* is_match() */
   },
#define PIC30_RELOC_INFO_PCREL_BRANCH_SLIT6                         (25)
   { BFD_RELOC_PIC30_PCREL_BRANCH_SLIT6, TRUE, 1, NULL },
#define PIC30_RELOC_INFO_UNSIGNED_3                                (26)
   { BFD_RELOC_PIC30_UNSIGNED_3, FALSE, 1, pic30_match_unsigned_3bit_lit },
#define PIC30_RELOC_INFO_UNSIGNED_2                                (27)
   { BFD_RELOC_PIC30_UNSIGNED_2, FALSE, 1, pic30_match_unsigned_2bit_lit },
#define PIC30_RELOC_INFO_WID5                                 (28)
   { BFD_RELOC_PIC30_WID5, FALSE, 1, pic30_match_wid5_lit },
#define PIC30_RELOC_INFO_SHIFT8_UNSIGNED_8                    (29)
   {
        BFD_RELOC_PIC30_SHIFT8_UNSIGNED_8,            /* value */
        FALSE,                                  /* PC relative ? */
        1,                                      /* fix size (?) */
        pic30_match_byte_8bit_lit                   /* is_match() */
   },
};

/******************************************************************************
 * pic30_operands[]
 ******************************************************************************/

const struct pic30_operand pic30_operands[] =
{
#define REG                             (PIC30_BASE_OPERAND + 0)
   { 4, 0, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE, 0, 0, 0, 0 },

#define BASE_REG                        (PIC30_BASE_OPERAND + 1)
   { 4, 11, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE, 0, 0, 0, 0 },

#define MATH_BASE_REG                   (PIC30_BASE_OPERAND + 2)
   { 4, 15, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE, 0, 0, 0, 0 },

#define DST_REG                         (PIC30_BASE_OPERAND + 3)
   { 4, 7, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE, 0, 0, 0, 0 },

#define G_REG                           (PIC30_BASE_OPERAND + 4)
   { 4, 0, OPND_G_OR_H, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, pic30_insert_g_reg, pic30_extract_g_reg },

#define H_DST_REG                       (PIC30_BASE_OPERAND + 5)
   { 4, 7, OPND_G_OR_H, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, pic30_insert_h_dst_reg, pic30_extract_h_dst_reg },

#define P_SRC_REG                       (PIC30_BASE_OPERAND + 6)
   {
	4,				/* # if bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_P_OR_Q,			/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	0,				/* is_match() */
        0,                              /* info_string */
	pic30_insert_p_src_reg,		/* insert() */
	pic30_extract_p_src_reg		/* extract() */
   },

#define PIND_SRC_REG                    (PIC30_BASE_OPERAND + 7)
   {
	4,				/* # if bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_P_OR_Q_IND,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	0,				/* is_match() */
        0,                              /* info_string */
	pic30_insert_p_src_reg,		/* insert() */
	pic30_extract_p_src_reg		/* extract() */
   },

#define Q_DST_REG                       (PIC30_BASE_OPERAND + 8)
   {
	4,				/* # of bits in operand */
	7,				/* # of bits to shift for alignment */
	OPND_P_OR_Q,			/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	0,				/* is_match() */
        0,                              /* info_string */
	pic30_insert_q_dst_reg,		/* insert() */
	pic30_extract_q_dst_reg		/* extract() */
   },

#define QIND_DST_REG                    (PIC30_BASE_OPERAND + 9)
   {
	4,				/* # of bits in operand */
	7,				/* # of bits to shift for alignment */
	OPND_P_OR_Q_IND,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	0,				/* is_match() */
        0,                              /* info_string */
	pic30_insert_q_dst_reg,		/* insert() */
	pic30_extract_q_dst_reg		/* extract() */
   },

#define DBL_SRC_REG                     (PIC30_BASE_OPERAND + 10)
   {
	4,				/* # of bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_even,		/* is_match() */
        "Register # must be even.",     /* info_string */
	0,				/* insert() */
	0				/* extract() */
   },

#define DBL_DST_REG                     (PIC30_BASE_OPERAND + 11)
   {
	4,				/* # of bits in operand */
	7,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_even,		/* is_match */
        "Register # must be even.",     /* info_string */
	0,				/* insert() */
	0				/* extract() */
   },

#define DIVIDENDFR_REG                  (PIC30_BASE_OPERAND + 12)
   {
	4,				/* # of bits in operand	*/
	11,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	0,				/* is_match() */
        0,                              /* info_string */
	0,				/* insert() */
	0				/* extract() */
   },

#define DIVIDEND16_REG                  (PIC30_BASE_OPERAND + 13)
   {
	4,				/* # of bits in operand	*/
	7,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	0,				/* is_match() */
        0,                              /* info_string */
	0,                              /* insert() */
	0				/* extract() */
   },

#define DIVIDEND32_REG                  (PIC30_BASE_OPERAND + 14)
   {
	4,				/* # of bits in operand	*/
	7,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_even,		/* is_match() */
        "Register # must be even.",     /* info_string */
	pic30_insert_dividend_reg,	/* insert() */
	0				/* extract() */
   },

#define DIVISOR_REG                     (PIC30_BASE_OPERAND + 15)
   {
	4,				/* # of bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_div_src_reg,	/* is_match() */
        "Register # must be between 2 and 15, inclusive.",
	0,				/* insert() */
	0				/* extract() */
   },

#define LO_SRC_REG                      (PIC30_BASE_OPERAND + 16)
   { 4, 0, OPND_LO_REGISTER, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, pic30_insert_lo_reg, pic30_extract_lo_reg },

#define LO_DST_REG                      (PIC30_BASE_OPERAND + 17)
   { 4, 7, OPND_LO_REGISTER, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, pic30_insert_lo_reg, pic30_extract_lo_reg },

#define FILE_REG_WORD                   (PIC30_BASE_OPERAND + 18)
   {
	16,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,     		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_FILE_REG_WORD,	/* default relocation type */
	pic30_match_file_reg_word,	/* is_match() */
        "Operand must be even and less than 65536.",
	0,                      	/* insert() */
	0				/* extract() */
   },

#define FILE_REG_WORD_WITH_DST          (PIC30_BASE_OPERAND + 19)
   {
	15,				/* # of bits in operand	*/
	4,				/* # of bits to shift for alignment */
	OPND_VALUE,	        	/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_FILE_REG_WORD_WITH_DST, /* default relocation type */
	pic30_match_file_reg_word,	/* is_match() */
        "Operand must be even and less than 65536.",
	pic30_insert_file_reg_word_with_dst, /* insert() */
	pic30_extract_file_reg_word_with_dst /* extract() */
   },

#define FILE_REG_BYTE                   (PIC30_BASE_OPERAND + 20)
   {
	13,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_FILE_REG_BYTE,	/* default relocation type */
	0,				/* is_match() */
        0, 				/* info_string */
	0,                       	/* insert() */
	0				/* extract() */
   },

#define FILE_REG                        (PIC30_BASE_OPERAND + 21)
   {
	13,				/* # of bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_FILE_REG,      /* default relocation type */
	pic30_match_even,   	/* is_match() */
        "Operand must be even."
        " Specify .b to access data memory at an odd address.",
	0,				/* insert() */
	0				/* extract() */
   },

#define W_REG                           (PIC30_BASE_OPERAND + 22)
   { 1, 13, OPND_W_REG, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_w_reg },

#define BYTE_LITERAL_10BIT              (PIC30_BASE_OPERAND + 23)
   {
	8,				/* # of bits in operand */
	4,				/* # of bits to shift for alignment */
	OPND_VALUE,			/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_SIGNED_10_BYTE,/* default relocation type */
	pic30_match_byte_10bit_lit,	/* is_match() */
        "Operand must be between -128 and 255, inclusive.",
	0,				/* insert() */
	pic30_extract_byte_10bit_lit	/* extract() */
   },

#define LITERAL_10BIT                   (PIC30_BASE_OPERAND + 24)
   {
	10,				/* # of bits in operand */
	4,				/* # of bits to shift for alignment */
	OPND_VALUE,			/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_UNSIGNED_10,	/* default relocation type */
	pic30_match_10bit_lit,		/* is_match() */
        "Operand must be between 0 and 1023, inclusive.",
	0,				/* insert() */
	0				/* extract() */
   },

#define LITERAL_16BIT                   (PIC30_BASE_OPERAND + 25)
   {
	16,				/* # of bits in operand	*/
	4,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_WORD,		/* default relocation type */
	pic30_match_16bit_lit,        	/* is_match() */
        "Operand must be between -32768 and 65535, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define SHIFT_LITERAL                   (PIC30_BASE_OPERAND + 26)
   {
	4,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_UNSIGNED_4,	/* default relocation type */
	pic30_match_nibble,        	/* is_match() */
        "Operand must be between 0 and 15, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define UNSIGNED_SHORT_LITERAL          (PIC30_BASE_OPERAND + 27)
   {
	5,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_UNSIGNED_5,	/* default relocation type */
	pic30_match_unsigned_short_lit,	/* is_match() */
        "Operand must be between 0 and 31, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define BYTE_BIT_SELECT_NIBBLE          (PIC30_BASE_OPERAND + 28)
   {
	4,				/* # of bits in operand	*/
	12,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_BIT_SELECT_NIBBLE_BYTE, /* default relocation type */
	pic30_match_3bit_lit,        	/* is_match() */
        "Operand must be between 0 and 7, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define BIT_SELECT_NIBBLE               (PIC30_BASE_OPERAND + 29)
   {
	4,				/* # of bits in operand	*/
	12,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_BIT_SELECT_4,	/* default relocation type */
	pic30_match_nibble,	        	/* is_match() */
        "Operand must be between 0 and 15, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define BIT_SELECT_3                    (PIC30_BASE_OPERAND + 30)
   {
	3,				/* # of bits in operand	*/
	13,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_BIT_SELECT_3,	/* default relocation type */
	pic30_match_3bit_lit,        	/* is_match() */
        "Operand must be between 0 and 7, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define BIT_SELECT_34                   (PIC30_BASE_OPERAND + 31)
   {
	3,				/* # of bits in operand */
	13,				/* # of bits to shift for alignment */
	OPND_CONSTANT,			/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_34bit_lit,		/* is_match() */
        "Operand must be between 0 and 15, inclusive.",
	pic30_insert_34bit_lit,		/* insert() */
	0				/* extract() */
   },

#define BRANCH_LABEL                    (PIC30_BASE_OPERAND + 32)
   { 16, 0, OPND_VALUE, FALSE, PIC30_RELOC_INFO_PCREL_BRANCH,
     0, 0, 0, pic30_extract_offset },

#define BRANCH_ON_DSP_CONDITION_OPERAND (PIC30_BASE_OPERAND + 33)
   { 2, 16, OPND_BRANCH_ON_DSP_CONDITION, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_branch_on_dsp_condition_operand },

#define BRANCH_ON_CONDITION_OPERAND     (PIC30_BASE_OPERAND + 34)
   { 4, 16, OPND_BRANCH_ON_CONDITION, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_branch_on_condition_operand },

#define LITERAL_14BIT                   (PIC30_BASE_OPERAND + 35)
   {
	14,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_UNSIGNED_14,	/* default relocation type */
	pic30_match_unsigned_14bit_lit,	/* is_match() */
        "Operand must be between 0 and 16383, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define FRAME_SIZE                      (PIC30_BASE_OPERAND + 36)
   {
	14,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_FRAME_SIZE,	/* default relocation type */
	pic30_match_frame_size,       	/* is_match() */
        "Operand must be even and between 0 and 16382, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define CALL_OPERAND                    (PIC30_BASE_OPERAND + 37)
   { 16, 0, OPND_VALUE, FALSE, PIC30_RELOC_INFO_PGM_ADDR_LSB, 0, 0, 0, 0 },

#define DO_LABEL                        (PIC30_BASE_OPERAND + 38)
   { 16, 0, OPND_VALUE, FALSE, PIC30_RELOC_INFO_PCREL_DO,
     0, 0, 0, pic30_extract_offset },
   
#define DSP_ACCUMULATOR_SELECT          (PIC30_BASE_OPERAND + 39)
   { 1,  15, OPND_DSP_ACCUMULATOR_SELECT, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_dsp_accumulator_select },

#define DSP_PRESHIFT                    (PIC30_BASE_OPERAND + 40)
   {
	4,				/* # of bits in operand	*/
	7,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_DSP_PRESHIFT,	/* default relocation type */
	pic30_match_4bit_lit,       	/* is_match() */
        "Operand must be between -8 and 7, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define DSP_SHORT_LITERAL               (PIC30_BASE_OPERAND + 41)
   {
	6,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_DSP_6,		/* default relocation type */
	pic30_match_6bit_lit,        	/* is_match() */
        "Operand must be between -16 and 16, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },

#define DSP_WRITEBACK                   (PIC30_BASE_OPERAND + 42)
   { 2, 0, OPND_DSP_WRITEBACK, FALSE, PIC30_RELOC_INFO_NONE,
     pic30_match_dsp_writeback, 0,
     pic30_insert_dsp_writeback, pic30_extract_dsp_writeback },

#define DSP_X_PREFETCH_OPERATION        (PIC30_BASE_OPERAND + 43)
   { 4, 6, OPND_DSP_PREFETCH_OPERATION, FALSE, PIC30_RELOC_INFO_NONE,
     pic30_match_dsp_x_prefetch_operation, 0,
     pic30_insert_dsp_x_prefetch_operation,
     pic30_extract_dsp_x_prefetch_operation },

#define DSP_X_PREFETCH_DST              (PIC30_BASE_OPERAND + 44)
   { 2, 12, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE,
     pic30_match_dsp_prefetch_dst, 0, 0, pic30_extract_dsp_prefetch_dst },

#define DSP_Y_PREFETCH_OPERATION        (PIC30_BASE_OPERAND + 45)
   { 4, 2, OPND_DSP_PREFETCH_OPERATION, FALSE, PIC30_RELOC_INFO_NONE,
     pic30_match_dsp_y_prefetch_operation, 0,
     pic30_insert_dsp_y_prefetch_operation,
     pic30_extract_dsp_y_prefetch_operation },

#define DSP_Y_PREFETCH_DST              (PIC30_BASE_OPERAND + 46)
   { 2, 10, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE,
     pic30_match_dsp_prefetch_dst, 0, 0, pic30_extract_dsp_prefetch_dst },

#define DSP_MULTIPLICAND                (PIC30_BASE_OPERAND + 47)
   { 3, 16, OPND_DSP_MULTIPLICAND, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_dsp_multiplicand },

#define DSP_SQUARE                      (PIC30_BASE_OPERAND + 48)
   { 2, 16, OPND_DSP_SQUARE, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_dsp_square },

#define PWRSAV_MODE                     (PIC30_BASE_OPERAND + 49)
   {
	1,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_PWRSAV_MODE,   /* default relocation type */
	pic30_match_power_save_mode,   	/* is_match() */
        "Operand must be 0 or 1.",      /* info_string */
	0,      	                /* insert() */
	0				/* extract() */
   },

#define DBL_MUL_DST_REG                 (PIC30_BASE_OPERAND + 50)
   {
	4,				/* # of bits in operand */
	7,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_even_not_14,	/* is_match */
	"Register # must be a member of [0, 2, 4, ... 12].", /* info_string */
	0,				/* insert() */
	0				/* extract() */
   },
   
#define BYTE_LITERAL_CP_8BIT              (PIC30_BASE_OPERAND + 51)
   {
	8,				/* # of bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,			/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_UNSIGNED_8 ,   /* default relocation type */
	pic30_match_byte_8bit_lit,	/* is_match() */
        "Operand must be between 0 and 255, inclusive.",
	pic30_insert_byte_cp_8bit_lit, 	/* insert() */
	pic30_extract_byte_cp_8bit_lit	/* extract() */
   },
#define REG_L                             (PIC30_BASE_OPERAND + 52)
   { 4, 0, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE, pic30_match_even, 0, pic30_insert_byte_l_operand, 0 },

#define LITERAL_15BIT                   (PIC30_BASE_OPERAND + 53)
   {
	15,				/* # of bits in operand	*/
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,      		/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_UNSIGNED_15,	/* default relocation type */
	pic30_match_unsigned_15bit_lit,	/* is_match() */
        "Operand must be between 0 and 32767, inclusive.",
	0,      	                /* insert() */
	0				/* extract() */
   },
#define PAGE_REG                        (PIC30_BASE_OPERAND + 54)
   {
     
	2,				/* # of bits in operand	*/
	10,				/* # of bits to shift for alignment */
	OPND_PAGE_SYMBOL,      		/* operand type */
	FALSE,				/* immediate operand ? */
       	PIC30_RELOC_INFO_NONE ,   	/* default relocation type */
	pic30_match_page_reg,   	/* is_match() */
        "Operand must be between 0 and 16383, inclusive.",
	pic30_insert_page_reg,      	                /* insert() */
	pic30_extract_page_reg				/* extract() */
   },
#define LITERAL_10BIT_NO_SHIFT          (PIC30_BASE_OPERAND + 55)
   {
	10,				/* # of bits in operand */
	0,				/* # of bits to shift for alignment */
	OPND_VALUE,			/* operand type */
	TRUE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NO_SHIFT_UNSIGNED_10,	/* default relocation type */
	pic30_match_10bit_lit,		/* is_match() */
        "Operand must be between 0 and 1023, inclusive.",
	0,				/* insert() */
	0				/* extract() */
   },
   

#define ECORE_ACCUMULATOR_SELECT          (PIC30_BASE_OPERAND + 56)
   { 1,  7, OPND_DSP_ACCUMULATOR_SELECT, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, 0, pic30_extract_dsp_accumulator_select },

#define W_MUL_DST_REG                 (PIC30_BASE_OPERAND + 57)
   {
	3,				/* # of bits in operand */
	8,				/* # of bits to shift for alignment */
	OPND_REGISTER_DIRECT,		/* operand type */
	FALSE,				/* immediate operand ? */
	PIC30_RELOC_INFO_NONE,		/* default relocation type */
	pic30_match_even_not_14,	/* is_match */
	"Register # must be a member of [0, 2, 4, ... 12].", /* info_string */
	pic30_insert_wmul_dst_reg,				/* insert() */
	pic30_extract_wmul_dst_reg	/* extract() */
   },

#define BRANCH_LABEL_SLIT6                    (PIC30_BASE_OPERAND + 58)
   { 6, 4 , OPND_VALUE, FALSE, PIC30_RELOC_INFO_PCREL_BRANCH_SLIT6,
     0, 0, 0, pic30_extract_offset },

#define LITERAL_3BIT                   (PIC30_BASE_OPERAND + 59)
   {
        3,                             /* # of bits in operand */
        0,                              /* # of bits to shift for alignment */
        OPND_VALUE,                     /* operand type */
        TRUE,                           /* immediate operand ? */
        PIC30_RELOC_INFO_UNSIGNED_3,   /* default relocation type */
        pic30_match_unsigned_3bit_lit, /* is_match() */
        "Operand must be between 0 and 4, inclusive.",
        0,                              /* insert() */
        0                               /* extract() */
   },

#define LITERAL_2BIT                   (PIC30_BASE_OPERAND + 60)
   {
        2,                             /* # of bits in operand */
        12,                              /* # of bits to shift for alignment */
        OPND_VALUE,                     /* operand type */
        TRUE,                           /* immediate operand ? */
        PIC30_RELOC_INFO_UNSIGNED_2,   /* default relocation type */
        pic30_match_unsigned_2bit_lit, /* is_match() */
        "Operand must be between 0 and 3, inclusive.",
        0,                              /* insert() */
        0                               /* extract() */
   },

#define H_DST_REG_0SHIFT                       (PIC30_BASE_OPERAND + 61)
   { 4, 0, OPND_G_OR_H, FALSE, PIC30_RELOC_INFO_NONE,
     0, 0, pic30_insert_h_dst_reg, pic30_extract_h_dst_reg },

#define IND_DST_REG_POST_INC                         (PIC30_BASE_OPERAND + 62)
   { 4, 7, OPND_REGISTER_POST_INCREMENT, FALSE, PIC30_RELOC_INFO_NONE, 0, 0, 0, 0 }, 

#define SRC_REG                         (PIC30_BASE_OPERAND + 63)
   { 4, 8, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE, 0, 0, 0, 0 },

#define WID5                            (PIC30_BASE_OPERAND + 64)
   {4, 4, OPND_VALUE, TRUE, PIC30_RELOC_INFO_WID5, pic30_match_wid5_lit,
    "operand must be between 0 and 16, inclusive.", 0, 0},

#define LITERAL_8BIT                   (PIC30_BASE_OPERAND + 65)
   {
        8,                             /* # of bits in operand */
        8,                              /* # of bits to shift for alignment */
        OPND_VALUE,                     /* operand type */
        TRUE,                           /* immediate operand ? */
        PIC30_RELOC_INFO_SHIFT8_UNSIGNED_8,   /* default relocation type */
        pic30_match_byte_8bit_lit,          /* is_match() */
        "Operand must be between 0 and 255, inclusive.",
        0,                              /* insert() */
        0                               /* extract() */
   },

#define BASE_REG_EVEN                        (PIC30_BASE_OPERAND + 66)
   { 4, 11, OPND_REGISTER_DIRECT, FALSE, PIC30_RELOC_INFO_NONE,
     pic30_match_even, "Register # must be even.", 0, 0 },

#define DIVIDEND_REG                    (PIC30_BASE_OPERAND + 67)
   {
        4,                              /* # of bits in operand */
        11,                             /* # of bits to shift for alignment */
        OPND_REGISTER_DIRECT,           /* operand type */
        FALSE,                          /* immediate operand ? */
        PIC30_RELOC_INFO_NONE,          /* default relocation type */
        pic30_match_div_src_reg,        /* is_match() */
        "Register # must be between 1 and 15, inclusive.",
        pic30_insert_divf2_dividend_reg,      /* insert() */
        0                               /* extract() */
   },
#define DIVIDEND16_REG_2                (PIC30_BASE_OPERAND + 68)
   {
        4,                              /* # of bits in operand */
        7,                              /* # of bits to shift for alignment */
        OPND_REGISTER_DIRECT,           /* operand type */
        FALSE,                          /* immediate operand ? */
        PIC30_RELOC_INFO_NONE,          /* default relocation type */
        pic30_match_dividend16_reg_2,     /* is_match() */
        "Register # must be between 0 and 14, inclusive.",  /* info_string */
        pic30_insert_dividend16_reg_2,      /* insert() */
        0                               /* extract() */
   },
#define SACD_DST_REG                    (PIC30_BASE_OPERAND + 69)
   {
        4,                              /* # of bits in operand */
        0,                              /* # of bits to shift for alignment */
        OPND_P_OR_Q,                    /* operand type */
        FALSE,                          /* immediate operand ? */
        PIC30_RELOC_INFO_NONE,          /* default relocation type */
        0,                              /* is_match() */
        0,                              /* info_string */
        pic30_insert_sacd_dst_reg,      /* insert() */
        pic30_extract_sacd_dst_reg      /* extract() */
   },

};
const int pic30_num_operands =
   (sizeof(pic30_operands) / sizeof(struct pic30_operand));

/******************************************************************************
 *
 * pic30_opcodes[]
 *
 * NOTE:  Opcodes with the same name MUST be grouped together
 *
 ******************************************************************************/

/* REV_A enables support for dsPIC Rev. A silicon */
#define REV_A 1

/* Common semantic macros */
#define S_OPWFF(OP) S_MOV "1" OP "1W00"
#define S_OPWFW(OP) S_MOV "W00" OP "1W00"
#define S_OPLW(OP)  S_MOV "2" OP "12"
#define S_OPLS(OP)  S_MOV "3" OP "12"
#define S_OP3(OP)   S_MOV "3" OP "12"

#define S_OPFF(OP)  S_MOV "1" OP "1"
#define S_OPFW(OP)  S_MOV "W00" OP "1"
#define S_OP2(OP)   S_MOV "2" OP "1"

#define S_OP1(OP)   OP "1"

#define S_OP2CC(OP) OP "2" "1"
#define S_OP1CC(OP) OP "1"

#define S_OPCPB(CC) S_TST "1" "2" S_BRAC CC "3"
#define S_OPCPS(CC) S_TST "1" "2" S_SKPS 

const struct pic30_opcode pic30_opcodes[] =
{
   /***************************************************************************
    * ADD.b
    ***************************************************************************/
   { "add.b",     ADDWFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_ADD)
   },
   { "add.b",     ADDWFW_B,   2, { FILE_REG_BYTE, W_REG },
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_ADD)
   },
   { "add.b",     ADDLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_ADD)
   },
   { "add.b",     ADDLS_B,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_ADD)
   },
   { "add.b",     ADD_B,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_ADD)
   },

   /***************************************************************************
    * ADD.w
    ***************************************************************************/
   { "add.w",     ADDWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_ADD)
   },
   { "add.w",     ADDWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_ADD)
   },
   { "add.w",     ADDLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_ADD)
   },
   { "add.w",     ADDLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_ADD)
   },
   { "add.w",     ADD_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_ADD)
   },

   /***************************************************************************
    * ADD
    ***************************************************************************/
   { "add",       DUMMY,      0, { 0 /* for flags */ }, 
                  F_WORD | F_HAS_IMPLIED_WREG | F_IS_DSP_INSN,
                  S_NOP
   },
   { "add",       ADDWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_ADD)
   },
   { "add",       ADDWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_ADD)
   },
   { "add",       ADDLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_ADD)
   },
   { "add",       ADDLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_ADD)
   },
   { "add",       ADD_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_ADD)
   },
   { "add",       ADDAB,      1, { DSP_ACCUMULATOR_SELECT }, 
                  F_WORD | F_IS_DSP_INSN,
                  "40" S_MOV "1" S_ADD "1!!"
   },
   { "add",       ADDAC_PS,   3, { G_REG,
                                   DSP_PRESHIFT,
                                   DSP_ACCUMULATOR_SELECT}, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "3" S_ADD "31"                  /* model shift? */
   },
   { "add",       ADDAC,      2, { G_REG,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "2" S_ADD "21"
   },

   /***************************************************************************
    * ADDC.b
    ***************************************************************************/
   { "addc.b",    ADDCWFF_B,  1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_ADDC)
   },
   { "addc.b",    ADDCWFW_B,  2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_ADDC)
   },
   { "addc.b",    ADDCLW_B,   2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_ADDC)
   },
   { "addc.b",    ADDCLS_B,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_ADDC)
   },
   { "addc.b",    ADDC_B,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_ADDC)
   },

   /***************************************************************************
    * ADDC.w
    ***************************************************************************/
   { "addc.w",    ADDCWFF_W,  1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_ADDC)
   },
   { "addc.w",    ADDCWFW_W,  2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_ADDC)
   },
   { "addc.w",    ADDCLW_W,   2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_ADDC)
   },
   { "addc.w",    ADDCLS_W,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_ADDC)
   },
   { "addc.w",    ADDC_W,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_ADDC)
   },

   /***************************************************************************
    * ADDC
    ***************************************************************************/
   { "addc",      ADDCWFF_W,  1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_ADDC)
   },
   { "addc",      ADDCWFW_W,  2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_ADDC)
   },
   { "addc",      ADDCLW_W,   2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_ADDC)
   },
   { "addc",      ADDCLS_W,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_ADDC)
   },
   { "addc",      ADDC_W,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_ADDC)
   },

   /***************************************************************************
    * AND.b
    ***************************************************************************/
   { "and.b",     ANDWFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_AND)
   },
   { "and.b",     ANDWFW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_AND)
   },
   { "and.b",     ANDLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_AND)
   },
   { "and.b",     ANDLS_B,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_AND)
   },
   { "and.b",     AND_B,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_AND)
   },

   /***************************************************************************
    * AND.w
    ***************************************************************************/
   { "and.w",     ANDWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_AND)
   },
   { "and.w",     ANDWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_AND)
   },
   { "and.w",     ANDLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_AND)
   },
   { "and.w",     ANDLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_AND)
   },
   { "and.w",     AND_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_AND)
   },

   /***************************************************************************
    * AND
    ***************************************************************************/
   { "and",       ANDWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_AND)
   },
   { "and",       ANDWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_AND)
   },
   { "and",       ANDLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_AND)
   },
   { "and",       ANDLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_AND)
   },
   { "and",       AND_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_AND)
   },

   /***************************************************************************
    * ASR.b
    ***************************************************************************/
   { "asr.b",     ASRFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ASR) "#1#"
   },
   { "asr.b",     ASRFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ASR) "#1#"
   },
   { "asr.b",     ASR_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_ASR) "#1#"
   },

   /***************************************************************************
    * ASR.w
    ***************************************************************************/
   { "asr.w",     ASRFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ASR) "#1#"
   },
   { "asr.w",     ASRFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ASR) "#1#"
   },
   { "asr.w",     ASR_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ASR) "#1#"
   },
   { "asr.w",     ASRW_W,     3, { BASE_REG, REG, DST_REG }, 
                  F_WORD,
                  S_OP3(S_ASR)
   },
   { "asr.w",     ASRK_W,     3, { BASE_REG, SHIFT_LITERAL, DST_REG }, 
                  F_WORD,
                  S_OP3(S_ASR)
   },

   /***************************************************************************
    * ASR
    ***************************************************************************/
   { "asr",       ASRFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ASR) "#1#"
   },
   { "asr",       ASRFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ASR) "#1#"
   },
   { "asr",       ASR_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ASR) "#1#"
   },
   { "asr",       ASRW_W,     3, { BASE_REG, REG, DST_REG }, 
                  F_WORD,
                  S_OP3(S_ASR)
   },
   { "asr",       ASRK_W,     3, { BASE_REG, SHIFT_LITERAL, DST_REG }, 
                  F_WORD,
                  S_OP3(S_ASR)
   },

   /***************************************************************************
    * BCLR
    ***************************************************************************/
   { "bclr.w",    BCLR_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_MOV "1" S_BCLR "1" "2"
   },
   { "bclr.w",    BCLRF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_MOV "1" S_BCLR "1" "2"
   },
   { "bclr",      BCLR_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_MOV "1" S_BCLR "1" "2"
   },
   { "bclr",      BCLRF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_MOV "1" S_BCLR "1" "2"
   },
   { "bclr.b",    BCLRF_B,    2, { FILE_REG_BYTE, BIT_SELECT_3 }, 
                  F_NONE,
                  S_MOV "1" S_BCLR "1" "2"
   },
   { "bclr.b",    BCLR_B,     2, { P_SRC_REG,
                                   BYTE_BIT_SELECT_NIBBLE }, 
                  F_NONE,
                  S_MOV "1" S_BCLR "1" "2"
   },

   /***************************************************************************
    * BOOTSWP
    ***************************************************************************/
   { "bootswp",   BOOTSWP,    0, { 0 /* OPERANDS */ }, 
                  F_DUALPARTITION,
                  S_NOP
   },

   /***************************************************************************
    * BFEXT
    ***************************************************************************/
   { "bfext",     BFEXT,      4, { SHIFT_LITERAL, WID5, P_SRC_REG, SRC_REG }, 
                  F_ISAV4,
                  S_UNK
   },
   { "bfext",     BFEXTF,     4, { SHIFT_LITERAL, WID5, FILE_REG_WORD, SRC_REG},
                  F_ISAV4,
                  S_UNK
   },

   /***************************************************************************
    * BFINS
    ***************************************************************************/
   { "bfins",     BFINS,      4, { SHIFT_LITERAL, WID5, SRC_REG, P_SRC_REG },
                  F_ISAV4,
                  S_UNK
   },
   { "bfins",     BFINSF,     4, { SHIFT_LITERAL, WID5, SRC_REG,
                                    FILE_REG_WORD }, 
                  F_ISAV4,
                  S_UNK
   },
   { "bfins",     BFINSL,     4, { SHIFT_LITERAL, WID5, LITERAL_8BIT,
                                    P_SRC_REG }, 
                  F_ISAV4,
                  S_UNK
   },   

   /***************************************************************************
    * BRA
    ***************************************************************************/
   { "bra",       BRA_DSP,    2, { BRANCH_ON_DSP_CONDITION_OPERAND,
                                   BRANCH_LABEL }, 
                  F_HAS_BRANCH_FLAG | F_CANNOT_FOLLOW_REPEAT | F_IS_DSP_INSN,
                  S_BRAC "1" "2"
   },
   { "bra",       BRA,        1, { BRANCH_LABEL }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_BRA "1"
   },
   { "bra",       BRA_CC,     2, { BRANCH_ON_CONDITION_OPERAND,
                                   BRANCH_LABEL }, 
                  F_HAS_BRANCH_FLAG | F_CANNOT_FOLLOW_REPEAT,
                  S_BRAC "1" "2"
   },
   { "bra",       BRAWE,      1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ECORE | F_ISAV4,
                  S_BRA "1"
   },
   { "bra",       BRAW,       1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_BRA "1"
   },
  
   /***************************************************************************
    * BREAK
    ***************************************************************************/
   { "break",     BREAK,      0, { 0 /* OPERANDS */ }, 
                  F_NONE,
                  S_NOP
   },

   /***************************************************************************
    * BSET
    ***************************************************************************/
   { "bset.w",    BSET_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_MOV "1" S_BSET "1" "2"
   },
   { "bset.w",    BSETF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_MOV "1" S_BSET "1" "2"
   },
   { "bset",      BSET_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_MOV "1" S_BSET "1" "2"
   },
   { "bset",      BSETF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_MOV "1" S_BSET "1" "2"
   },
   { "bset.b",    BSETF_B,    2, { FILE_REG_BYTE, BIT_SELECT_3 }, 
                  F_NONE,
                  S_MOV "1" S_BSET "1" "2"
   },
   { "bset.b",    BSET_B,     2, { P_SRC_REG,
                                   BYTE_BIT_SELECT_NIBBLE }, 
                  F_NONE,
                  S_MOV "1" S_BSET "1" "2"
   },

   /***************************************************************************
    * BSW
    ***************************************************************************/
   { "bsw.z",     BSW_Z,      2, { P_SRC_REG, BASE_REG }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "bsw.c",     BSW_C,      2, { P_SRC_REG, BASE_REG }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "bsw",       BSW_Z,      2, { P_SRC_REG, BASE_REG }, 
                  F_WORD,
                  S_TST "1" "2"
   },

   /***************************************************************************
    * BTG
    ***************************************************************************/
   { "btg.w",     BTG_W,      2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_MOV "1" S_TGL "1" "2"
   },
   { "btg.w",     BTGF_W,     2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_MOV "1" S_TGL "1" "2"
   },
   { "btg",       BTG_W,      2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_MOV "1" S_TGL "1" "2"
   },
   { "btg",       BTGF_W,     2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_MOV "1" S_TGL "1" "2"
   },
   { "btg.b",     BTGF_B,     2, { FILE_REG_BYTE, BIT_SELECT_3 },  
                  F_NONE,
                  S_MOV "1" S_TGL "1" "2"
   },
   { "btg.b",     BTG_B,      2, { P_SRC_REG,
                                   BYTE_BIT_SELECT_NIBBLE }, 
                  F_NONE,
                  S_MOV "1" S_TGL "1" "2"
   },

   /***************************************************************************
    * BTSC
    ***************************************************************************/
   { "btsc.w",    BTSC_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_SKPC 
   },
   { "btsc.w",    BTSCF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2" S_SKPC 
   },
   { "btsc",      BTSC_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_SKPC 
   },
   { "btsc",      BTSCF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2" S_SKPC 
   },
   { "btsc.b",    BTSCF_B,    2, { FILE_REG_BYTE, BIT_SELECT_3 }, 
                  F_NONE,
                  S_TST "1" "2" S_SKPC 
   },

   /***************************************************************************
    * BTSS
    ***************************************************************************/
   { "btss.w",    BTSS_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_SKPS 
   },
   { "btss.w",    BTSSF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2" S_SKPS 
   },
   { "btss",      BTSS_W,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_SKPS 
   },
   { "btss",      BTSSF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2" S_SKPS 
   },
   { "btss.b",    BTSSF_B,    2, { FILE_REG_BYTE, BIT_SELECT_3 }, 
                  F_NONE,
                  S_TST "1" "2" S_SKPS 
   },

   /***************************************************************************
    * BTST
    ***************************************************************************/
   { "btst.z",    BTST_Z,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "btst.z",    BTSTW_Z,    2, { P_SRC_REG, BASE_REG }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "btst.c",    BTST_C,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "btst.c",    BTSTW_C,    2, { P_SRC_REG, BASE_REG }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "btst",      BTST_Z,     2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "btst",      BTSTW_Z,    2, { P_SRC_REG, BASE_REG }, 
                  F_WORD,
                  S_TST "1" "2"
   },
   { "btst",      BTSTF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2"
   },
   { "btst.w",    BTSTF_W,    2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2"
   },
   { "btst.b",    BTSTF_B,    2, { FILE_REG_BYTE, BIT_SELECT_3 }, 
                  F_NONE,
                  S_TST "1" "2"
   },

   /***************************************************************************
    * BTSTS
    ***************************************************************************/
   { "btsts.z",   BTSTS_Z,    2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_BSET "1" "2"
   },
   { "btsts.c",   BTSTS_C,    2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_BSET "1" "2"
   },
   { "btsts",     BTSTS_Z,    2, { P_SRC_REG, BIT_SELECT_NIBBLE }, 
                  F_WORD,
                  S_TST "1" "2" S_BSET "1" "2"
   },
   { "btsts",     BTSTSF_W,   2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2" S_BSET "1" "2"
   },
   { "btsts.w",   BTSTSF_W,   2, { FILE_REG_BYTE, BIT_SELECT_34 }, 
                  F_NONE,
                  S_TST "1" "2" S_BSET "1" "2"
   },
   { "btsts.b",   BTSTSF_B,   2, { FILE_REG_BYTE, BIT_SELECT_3 }, 
                  F_NONE,
                  S_TST "1" "2" S_BSET "1" "2"
   },

   /***************************************************************************
    * CALL
    ***************************************************************************/
   { "call",      CALLW,      1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_NONE,
                  S_OP1(S_CALL)
   },
   { "call",      CALL,       1, { CALL_OPERAND }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_OP1(S_CALL)
   },
   { "call.l",    CALL_L,     1, { REG_L }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ECORE | F_ISAV4,
                  S_OP1(S_CALL)
   },

   /***************************************************************************
    * CLR.b
    ***************************************************************************/
   { "clr.b",     CLRW_B,     1, { W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_MOV "W00#0#"
   },
   { "clr.b",     CLR_B,      1, { Q_DST_REG }, 
                  F_NONE,
                  S_OP1(S_MOV) "#0#"
   },
   { "clr.b",     CLRF_B,     1, { FILE_REG_BYTE }, 
                  F_NONE,
                  S_OP1(S_MOV) "#0#"
   },

   /***************************************************************************
    * CLR.w
    ***************************************************************************/
   { "clr.w",     CLRW_W,     1, { W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "#0#"
   },
   { "clr.w",     CLR_W,      1, { Q_DST_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#0#"
                  
   },
   { "clr.w",     CLRF_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#0#"
   },

   /***************************************************************************
    * CLR
    ***************************************************************************/
   { "clr",       DUMMY,      0, { 0 /* for flags */ }, 
                  F_WORD | F_HAS_IMPLIED_WREG | F_IS_DSP_INSN,
                  S_NOP
   },
   { "clr",       CLRW_W,     1, { W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00#0#"
   },
   { "clr",       CLR_W,      1, { Q_DST_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#0#"
   },
   { "clr",       CLRF_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#0#"
   },
   { "clr",       CLRAC_A,    1, { DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP1(S_MOV) "#0#"
   },
   { "clr",       CLRAC_WB,   2, { DSP_ACCUMULATOR_SELECT,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP1(S_CLRAC) "1" S_MOV "2" S_OTHER "1"
   },
   { "clr",       CLRAC_X,    3, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_CLRAC "1" S_PFTCH "2" "1"
   },
   { "clr",       CLRAC_Y,    3, { DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_CLRAC "1" S_PFTCH "2" "1"
   },
   { "clr",       CLRAC_XWB,  4, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_CLRAC "1" S_PFTCH "2" "1" S_MOV "4" S_OTHER "1"
   },
   { "clr",       CLRAC_YWB,  4, { DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_CLRAC "1" S_PFTCH "2" "1" S_MOV "4" S_OTHER "1"
   },
   { "clr",       CLRAC_XY,   5, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_CLRAC "1" S_PFTCH "2" "1" S_PFTCH "4" "3" 
   },
   { "clr",       CLRAC,      6, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_CLRAC "1" S_PFTCH "2" "1" S_PFTCH "4" "3" 
                  S_MOV "5" S_OTHER "1"
   },

   /***************************************************************************
    * CLRWDT
    ***************************************************************************/
   { "clrwdt",    CLRWDT,     0, { 0 /* OPERANDS */ }, 
                  F_NONE,
                  S_NOP
   },

   /***************************************************************************
    * COM.b
    ***************************************************************************/
   { "com.b",     COMFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_MOV "1" S_XOR "1" "#0xFF#"
   },
   { "com.b",     COMFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_MOV "W00" S_XOR "1" "#0xFF#"
   },
   { "com.b",     COM_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_MOV "2" S_XOR "1" "#0xFF#"
   },

   /***************************************************************************
    * COM.w
    ***************************************************************************/
   { "com.w",     COMFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "1" S_XOR "1" "#0xFFFF#"
   },
   { "com.w",     COMFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" S_XOR "1" "#0xFFFF#"
   },
   { "com.w",     COM_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_MOV "2" S_XOR "1" "#0xFFFF#"
   },

   /***************************************************************************
    * COM
    ***************************************************************************/
   { "com",       COMFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "1" S_XOR "1" "#0xFFFF#"
   },
   { "com",       COMFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" S_XOR "1" "#0xFFFF#"
   },
   { "com",       COM_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_MOV "2" S_XOR "1" "#0xFFFF#"
   },

   /***************************************************************************
    * CP.b
    ***************************************************************************/
   { "cp.b",      CPLS_B,     2, { BASE_REG, UNSIGNED_SHORT_LITERAL }, 
                  F_FCORE,
                  S_OP2CC(S_TST)
   }, 
   { "cp.b",      CPLS8_B,    2, { BASE_REG, BYTE_LITERAL_CP_8BIT }, 
                  F_ECORE | F_ISAV4,
                  S_OP2CC(S_TST)
   },
   { "cp.b",      CPF_B,      1, { FILE_REG_BYTE }, 
                  F_NONE,
                  S_OP2CC(S_TST)
   },
   { "cp.b",      CP_B,       2, { BASE_REG, P_SRC_REG }, 
                  F_NONE,
                  S_OP2CC(S_TST)
   },

   /***************************************************************************
    * CP.w
    ***************************************************************************/
   { "cp.w",      CPLS_W,     2, { BASE_REG, UNSIGNED_SHORT_LITERAL }, 
                  F_WORD | F_FCORE,
                  S_OP2CC(S_TST)
   },
   { "cp.w",      CPLS8_W,    2, { BASE_REG, BYTE_LITERAL_CP_8BIT }, 
                  F_WORD | F_ISAV4 | F_ECORE,
                  S_OP2CC(S_TST)
   },
   { "cp.w",      CPF_W,      1, { FILE_REG }, 
                  F_WORD,
                  S_OP2CC(S_TST)
   },
   { "cp.w",      CP_W,       2, { BASE_REG, P_SRC_REG }, 
                  F_WORD,
                  S_OP2CC(S_TST)
   },

   /***************************************************************************
    * CP
    ***************************************************************************/
   { "cp",        CPLS_W,     2, { BASE_REG, UNSIGNED_SHORT_LITERAL }, 
                  F_WORD | F_FCORE,
                  S_OP2CC(S_TST)
   },
   { "cp",        CPLS8_W,    2, { BASE_REG, BYTE_LITERAL_CP_8BIT }, 
                  F_WORD | F_ISAV4 | F_ECORE,
                  S_OP2CC(S_TST)
   },
   { "cp",        CPF_W,      1, { FILE_REG }, 
                  F_WORD,
                  S_OP2CC(S_TST)
   },
   { "cp",        CP_W,       2, { BASE_REG, P_SRC_REG }, 
                  F_WORD,
                  S_OP2CC(S_TST)
   },
   
   /***************************************************************************
    * CPB.b
    ***************************************************************************/   { "cpb.b",     CPBLS8_B,   2, { BASE_REG, BYTE_LITERAL_CP_8BIT }, 
                  F_ECORE | F_ISAV4,
                  S_OP2CC(S_CPB)
   },
   { "cpb.b",     CPBLS_B,    2, { BASE_REG, UNSIGNED_SHORT_LITERAL }, 
                  F_FCORE,
                  S_OP2CC(S_CPB)
   }, 
   { "cpb.b",     CPBF_B,     1, { FILE_REG_BYTE }, 
                  F_NONE,
                  S_OP2CC(S_CPB)
   },
   { "cpb.b",     CPB_B,      2, { BASE_REG, P_SRC_REG }, 
                  F_NONE,
                  S_OP2CC(S_CPB)
   },

   /***************************************************************************
    * CPB.w
    ***************************************************************************/
   { "cpb.w",     CPBLS_W,    2, { BASE_REG, UNSIGNED_SHORT_LITERAL }, 
                  F_WORD | F_FCORE,
                  S_OP2CC(S_CPB)
   },   
   { "cpb.w",     CPBLS8_W,   2, { BASE_REG,BYTE_LITERAL_CP_8BIT }, 
                  F_WORD | F_ISAV4 | F_ECORE,
                  S_OP2CC(S_CPB)
   },
   { "cpb.w",     CPBF_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP2CC(S_CPB)
   },
   { "cpb.w",     CPB_W,      2, { BASE_REG, P_SRC_REG }, 
                  F_WORD,
                  S_OP2CC(S_CPB)
   },

   /***************************************************************************
    * CPB
    ***************************************************************************/
   { "cpb",       CPBLS_W,    2, { BASE_REG, UNSIGNED_SHORT_LITERAL }, 
                  F_WORD | F_FCORE,
                  S_OP2CC(S_CPB)
   },   
   { "cpb",       CPBLS8_W,   2, { BASE_REG,BYTE_LITERAL_CP_8BIT }, 
                  F_WORD | F_ISAV4 | F_ECORE,
                  S_OP2CC(S_CPB)
   },
   { "cpb",       CPBF_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP2CC(S_CPB)
   },
   { "cpb",       CPB_W,      2, { BASE_REG, P_SRC_REG }, 
                  F_WORD,
                  S_OP2CC(S_CPB)
   },

   /***************************************************************************
    * CP0.b
    ***************************************************************************/
   { "cp0.b",     CP0F_B,     1, { FILE_REG_BYTE }, 
                  F_NONE,
                  S_OP1CC(S_CP0)
   },
   { "cp0.b",     CP0_B,      1, { P_SRC_REG }, 
                  F_NONE,
                  S_OP1CC(S_CP0)
   },

   /***************************************************************************
    * CP0.w
    ***************************************************************************/
   { "cp0.w",     CP0F_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP1CC(S_CP0)
   },
   { "cp0.w",     CP0_W,      1, { P_SRC_REG }, 
                  F_WORD,
                  S_OP1CC(S_CP0)
   },

   /***************************************************************************
    * CP0
    ***************************************************************************/
   { "cp0",       CP0F_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP1CC(S_CP0)
   },
   { "cp0",       CP0_W,      1, { P_SRC_REG }, 
                  F_WORD,
                  S_OP1CC(S_CP0)
   },

   /***************************************************************************
    * CPBEQ
    ***************************************************************************/
   { "cpbeq.b",   CPWBEQ_B,   3, { BASE_REG, REG,  BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_CANNOT_FOLLOW_REPEAT | F_ISAV4,
                  S_OPCPB(S_EQ)
   },
   { "cpbeq.w",   CPWBEQ_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_WORD | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_EQ)
   },
   { "cpbeq",     CPWBEQ_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_WORD | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_EQ)
   },

   /***************************************************************************
    * CPBGT
    ***************************************************************************/
   { "cpbgt.b",   CPWBGT_B,   3, { BASE_REG, REG,  BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_GT)
   },
   { "cpbgt.w",   CPWBGT_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_GT)
   },
   { "cpbgt",     CPWBGT_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_GT)
   },

   /***************************************************************************
    * CPBLT
    ***************************************************************************/
   { "cpblt.b",   CPWBLT_B,   3, { BASE_REG, REG,  BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_LT)
   },
   { "cpblt.w",   CPWBLT_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_LT)
   },
   { "cpblt",     CPWBLT_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_LT)
   },

   /***************************************************************************
    * CPBNEQ
    ***************************************************************************/
   { "cpbne.b",   CPWBNE_B,   3, { BASE_REG, REG,  BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_NE)
   },
   { "cpbne.w",   CPWBNE_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_NE)
   },
   { "cpbne",     CPWBNE_W,   3, { BASE_REG, REG, BRANCH_LABEL_SLIT6  },
                  F_ECORE | F_ISAV4 | F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPB(S_NE)
   },

   /***************************************************************************
    * CPSEQ
    ***************************************************************************/
   { "cpseq.b",   CPWSEQ_B,   2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_OPCPS(S_EQ)
   },
   { "cpseq.w",   CPWSEQ_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_EQ)
   },
   { "cpseq",     CPWSEQ_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_EQ)
   },
   { "cpseq.b",   CPWSEQ_E_B, 2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ECORE | F_ISAV4,
                  S_OPCPS(S_EQ)
   },
   { "cpseq.w",   CPWSEQ_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_EQ)
   },
   { "cpseq",     CPWSEQ_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_EQ)
   },

   /***************************************************************************
    * CPSGT
    ***************************************************************************/
   { "cpsgt.b",   CPWSGT_B,   2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_OPCPS(S_GT)
   },
   { "cpsgt.w",   CPWSGT_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_GT)
   },
   { "cpsgt",     CPWSGT_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_GT)
   },
   { "cpsgt.b",   CPWSGT_E_B, 2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ECORE | F_ISAV4,
                  S_OPCPS(S_GT)
   },
   { "cpsgt.w",   CPWSGT_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_GT)
   },
   { "cpsgt",     CPWSGT_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_GT)
   },

   /***************************************************************************
    * CPSLT
    ***************************************************************************/
   { "cpslt.b",   CPWSLT_B,   2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_OPCPS(S_LT)
   },
   { "cpslt.w",   CPWSLT_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_LT)
   },
   { "cpslt",     CPWSLT_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_LT)
   },
   { "cpslt.b",   CPWSLT_E_B, 2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ISAV4 | F_ECORE,
                  S_OPCPS(S_LT)
   },
   { "cpslt.w",   CPWSLT_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_LT)
   },
   { "cpslt",     CPWSLT_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_LT)
   },

   /***************************************************************************
    * CPSNE
    ***************************************************************************/
   { "cpsne.b",   CPWSNE_B,   2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_OPCPS(S_NE)
   },
   { "cpsne.w",   CPWSNE_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_NE)
   },
   { "cpsne",     CPWSNE_W,   2, { BASE_REG, REG }, 
                  F_WORD | F_FCORE | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_NE)
   },
   { "cpsne.b",   CPWSNE_E_B, 2, { BASE_REG, REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ISAV4 | F_ECORE,
                  S_OPCPS(S_NE)
   },
   { "cpsne.w",   CPWSNE_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_NE)
   },
   { "cpsne",     CPWSNE_E_W, 2, { BASE_REG, REG }, 
                  F_WORD | F_ECORE | F_ISAV4 | F_CANNOT_FOLLOW_REPEAT,
                  S_OPCPS(S_NE)
   },

   /***************************************************************************
    * CTXTSWP
    ***************************************************************************/
   { "ctxtswp",   CTXTSWPL,   1, {LITERAL_3BIT}, 
                  F_CONTEXTS,
                  S_NOP
   },
   { "ctxtswp",   CTXTSWPW,   1, {REG}, 
                  F_CONTEXTS,
                  S_NOP
   },

   /***************************************************************************
    * DAW
    ***************************************************************************/
   { "daw.b",     DAW_B,      1, { REG }, 
                  F_NONE,
                  S_UNK
   },

   /***************************************************************************
    * DEC.b
    ***************************************************************************/
   { "dec.b",     DECFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_DEC)
   },
   { "dec.b",     DECFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_DEC)
   },
   { "dec.b",     DEC_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_DEC)
   },

   /***************************************************************************
    * DEC.w
    ***************************************************************************/
   { "dec.w",     DECFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_DEC)
   },
   { "dec.w",     DECFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_DEC)
   },
   { "dec.w",     DEC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_DEC)
   },

   /***************************************************************************
    * DEC
    ***************************************************************************/
   { "dec",       DECFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_DEC)
   },
   { "dec",       DECFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_DEC)
   },
   { "dec",       DEC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_DEC)
   },

   /***************************************************************************
    * DEC2.b
    ***************************************************************************/
   { "dec2.b",    DEC2FF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_DEC2)
   },
   { "dec2.b",    DEC2FW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_DEC2)
   },
   { "dec2.b",    DEC2_B,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_DEC2)
   },

   /***************************************************************************
    * DEC2.w
    ***************************************************************************/
   { "dec2.w",    DEC2FF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_DEC2)
   },
   { "dec2.w",    DEC2FW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_DEC2)
   },
   { "dec2.w",    DEC2_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_DEC2)
   },

   /***************************************************************************
    * DEC2
    ***************************************************************************/
   { "dec2",      DEC2FF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_DEC2)
   },
   { "dec2",      DEC2FW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_DEC2)
   },
   { "dec2",      DEC2_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_DEC2)
   },

   /***************************************************************************
    * DISI
    ***************************************************************************/
   { "disi",      DISI,       1, { LITERAL_14BIT }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_NOP
   },

   /***************************************************************************
   ** DIVF Wm,Wn	Fractional divide: Wm/Wn -> W0, Rem -> W1
   ****************************************************************************/
   { "divf",      DIVF,       2, { DIVIDENDFR_REG, DIVISOR_REG }, 
                  F_IS_DSP_INSN,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },

   /***************************************************************************
   ** DIVF2 Wm,Wn        Fractional divide: Wm:(Wm-1)/Wn -> W(m-1), Rem -> Wm
   ****************************************************************************/
   { "divf2",     DIVF2,       2, { DIVIDEND_REG, REG },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_MOV "1" S_DIV "1" "2" S_MOV "1" S_MOD "1" "2"
   },

   /***************************************************************************
    * DIVS Wm,Wn	Signed integer divide: Wm/Wn -> W0, Rem -> W1
    ***************************************************************************/
   { "div.sd",    DIVS_D,     2, { DIVIDEND32_REG, DIVISOR_REG }, 
                  F_NONE,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div.sw",    DIVS_W,     2, { DIVIDEND16_REG, DIVISOR_REG }, 
                  F_NONE,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div.s",     DIVS_W,     2, { DIVIDEND16_REG, DIVISOR_REG }, 
                  F_NONE,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },

   /***************************************************************************
    DIVS2 Wm,Wn      Signed integer divide: W(m+1):Wm/Wn -> Wm, Rem -> W(m+1)
    ***************************************************************************/
   { "div2.sd",   DIVSD2,     2, { DIVIDEND32_REG, REG },
                  F_ISAV4,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div2.sw",   DIVSW2,     2, { DIVIDEND16_REG_2, REG },
                  F_ISAV4,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div2.s",    DIVSW2,     2, { DIVIDEND16_REG_2, REG },
                  F_ISAV4,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },

   /***************************************************************************
    * DIVU Wm,Wn	Unsigned integer divide: Wm/Wn -> W0, Rem -> W1
    ***************************************************************************/
   { "div.ud",    DIVU_D,     2, { DIVIDEND32_REG, DIVISOR_REG }, 
                  F_NONE,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div.uw",    DIVU_W,     2, { DIVIDEND16_REG, DIVISOR_REG }, 
                  F_NONE,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div.u",     DIVU_W,     2, { DIVIDEND16_REG, DIVISOR_REG }, 
                  F_NONE,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },

   /***************************************************************************
    DIVU2 Wm,Wn     Unsigned integer divide: W(m+1):Wm/Wn -> Wm, Rem -> W(m+1)
    ***************************************************************************/
   { "div2.ud",   DIVUD2,     2, { DIVIDEND32_REG, REG },
                  F_ISAV4,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div2.uw",   DIVUW2,     2, { DIVIDEND16_REG_2, REG },
                  F_ISAV4,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },
   { "div2.u",    DIVUW2,     2, { DIVIDEND16_REG_2, REG },
                  F_ISAV4,
                  S_MOV "W00" S_DIV "1" "2" S_MOV "W00" S_MOD "1" "2"
   },

   /***************************************************************************
    * DO
    ***************************************************************************/
   { "do",        DOW,        2, { REG, DO_LABEL }, 
                  F_CANNOT_FOLLOW_REPEAT | F_IS_DSP_INSN | F_IS_2_WORD_INSN,
                  S_OP2CC(S_DO)
   },
   { "do",        DO,         2, { LITERAL_14BIT, DO_LABEL }, 
                  F_CANNOT_FOLLOW_REPEAT | F_IS_DSP_INSN |
                  F_IS_2_WORD_INSN | F_FCORE,
                  S_OP2CC(S_DO)
   },
   { "do",        DOE,         2, { LITERAL_15BIT, DO_LABEL }, 
                  F_CANNOT_FOLLOW_REPEAT | F_IS_DSP_INSN | F_ISAV4 |
                  F_IS_2_WORD_INSN | F_ECORE,
                  S_OP2CC(S_DO)
   },

   /***************************************************************************
    * ED
    ***************************************************************************/
   { "ed",        ED,         5, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_ED "2" "1" "5" "3" "4"
   },

   /***************************************************************************
    * EDAC
    ***************************************************************************/
   { "edac",      EDAC,       5, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_EDAC "2" "1" "5" "3" "4"
   },

   /***************************************************************************
    * EXCH
    ***************************************************************************/
   { "exch",      EXCH,       2, { REG, DST_REG }, 
                  F_NONE,
                  S_EXCH "1" "2"
   },

   /***************************************************************************
    * FBCL
    ***************************************************************************/
   { "fbcl",      FBCL,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_FBCL)
   },

   /***************************************************************************
    * FF1L
    ***************************************************************************/
   { "ff1l",      FF1L,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_FF1L)
   },

   /***************************************************************************
    * FF1R
    ***************************************************************************/
   { "ff1r",      FF1R,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_FF1R)
   },

   /***************************************************************************
    * FLIM
    ***************************************************************************/
   { "flim",      FLIM,       2, { BASE_REG_EVEN, P_SRC_REG }, 
                  F_ISAV4 | F_IS_DSP_INSN,
                  S_UNK,
   },
                 
   /***************************************************************************
    * FLIMW
    ***************************************************************************/
   { "flim",      FLIMW,      3, { BASE_REG_EVEN, P_SRC_REG, DST_REG },
                  F_ISAV4 | F_IS_DSP_INSN,
                  S_UNK,
   },

   { "flim.v",    FLIMWV,     3, { BASE_REG_EVEN, P_SRC_REG, DST_REG },
                  F_ISAV4 | F_IS_DSP_INSN,
                  S_UNK,
   },

   /***************************************************************************
    * GOTO
    ***************************************************************************/
   { "goto",      GOTOW,      1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_BRA "1"
   },
   { "goto",      GOTOWE,     1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ISAV4 | F_ECORE,
                  S_BRA "1"
   },
   { "goto",      GOTO,       1, { CALL_OPERAND }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_BRA "1"
   },
   { "goto.l",    GOTOW_L,    1, { REG_L }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ISAV4 | F_ECORE,
                  S_BRA "1"
   },

   /***************************************************************************
    * INC.b
    ***************************************************************************/
   { "inc.b",     INCFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_INC)
   },
   { "inc.b",     INCFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_INC)
   },
   { "inc.b",     INC_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_INC)
   },

   /***************************************************************************
    * INC.w
    ***************************************************************************/
   { "inc.w",     INCFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_INC)
   },
   { "inc.w",     INCFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_INC)
   },
   { "inc.w",     INC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_INC)
   },

   /***************************************************************************
    * INC
    ***************************************************************************/
   { "inc",       INCFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_INC)
   },
   { "inc",       INCFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_INC)
   },
   { "inc",       INC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_INC)
   },

   /***************************************************************************
    * INC2.b
    ***************************************************************************/
   { "inc2.b",    INC2FF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_INC2)
   },
   { "inc2.b",    INC2FW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_INC2)
   },
   { "inc2.b",    INC2_B,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_INC2)
   },

   /***************************************************************************
    * INC2.w
    ***************************************************************************/
   { "inc2.w",    INC2FF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_INC2)
   },
   { "inc2.w",    INC2FW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_INC2)
   },
   { "inc2.w",    INC2_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_INC2)
   },

   /***************************************************************************
    * INC2
    ***************************************************************************/
   { "inc2",      INC2FF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_INC2)
   },
   { "inc2",      INC2FW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_INC2)
   },
   { "inc2",      INC2_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_INC2)
   },

   /***************************************************************************
    * IOR.b
    ***************************************************************************/
   { "ior.b",     IORWFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_IOR)
   },
   { "ior.b",     IORWFW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_IOR)
   },
   { "ior.b",     IORLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_IOR)
   },
   { "ior.b",     IORLS_B,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_IOR)
   },
   { "ior.b",     IOR_B,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_IOR)
   },

   /***************************************************************************
    * IOR.w
    ***************************************************************************/
   { "ior.w",     IORWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_IOR)
   },
   { "ior.w",     IORWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_IOR)
   },
   { "ior.w",     IORLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_IOR)
   },
   { "ior.w",     IORLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_IOR)
   },
   { "ior.w",     IOR_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_IOR)
   },

   /***************************************************************************
    * IOR
    ***************************************************************************/
   { "ior",       IORWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_IOR)
   },
   { "ior",       IORWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_IOR)
   },
   { "ior",       IORLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_IOR)
   },
   { "ior",       IORLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_IOR)
   },
   { "ior",       IOR_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_IOR)
   },

   /***************************************************************************
    * LAC
    ***************************************************************************/
   { "lac",       LAC_PS,     3, { G_REG,
                                   DSP_PRESHIFT,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "3" S_ASR "1" "2"
   },
   { "lac",       LAC,        2, { G_REG,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "1" "2"
   },

   /***************************************************************************
    * LAC.w
    ***************************************************************************/
   { "lac.w",     LAC_PS,     3, { G_REG,
                                     DSP_PRESHIFT,
                                     DSP_ACCUMULATOR_SELECT }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "3" S_ASR "1" "2"
   },
   { "lac.w",     LAC,        2, { G_REG,
                                     DSP_ACCUMULATOR_SELECT }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "1" "2"
   },

   /***************************************************************************
    * LACD
    ***************************************************************************/
   { "lac.d",     LACD_PS,   3, { P_SRC_REG,
                                  DSP_PRESHIFT,
                                  DSP_ACCUMULATOR_SELECT}, 
                  F_WORD | F_ISAV4 | F_IS_DSP_INSN | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "3" S_ASR "1" "2"
   },
   { "lac.d",     LACD,   2, { P_SRC_REG,
                               DSP_ACCUMULATOR_SELECT}, 
                  F_WORD | F_ISAV4 | F_IS_DSP_INSN | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "1" "2"
   },

   /***************************************************************************
    * LDSLV
    ***************************************************************************/
   { "ldslv",     LDSLV,      3, { P_SRC_REG, 
                                   IND_DST_REG_POST_INC,
                                   LITERAL_2BIT},
                  F_WORD | F_ISAV4,
                  S_NOP
   },  

   /***************************************************************************
    * LNK
    ***************************************************************************/
   { "lnk",       LNK,        1, { FRAME_SIZE }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "W15" "W14" S_MOV "W15" S_ADD "W15" "1"
   },

   /***************************************************************************
    * LSR.b
    ***************************************************************************/
   { "lsr.b",     LSRFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_LSR) "#1#"
   },
   { "lsr.b",     LSRFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_LSR) "#1#"
   },
   { "lsr.b",     LSR_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_LSR) "#1#"
   },

   /***************************************************************************
    * LSR.w
    ***************************************************************************/
   { "lsr.w",     LSRFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_LSR) "#1#"
   },
   { "lsr.w",     LSRFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_LSR) "#1#"
   },
   { "lsr.w",     LSR_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_LSR) "#1#"
   },
   { "lsr.w",     LSRW_W,     3, { BASE_REG, REG, DST_REG }, 
                  F_WORD,
                  S_OP3(S_LSR)
   },
   { "lsr.w",     LSRK_W,     3, { BASE_REG, SHIFT_LITERAL, DST_REG }, 
                  F_WORD,
                  S_OP3(S_LSR)
   },

   /***************************************************************************
    * LSR
    ***************************************************************************/
   { "lsr",       LSRFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_LSR) "#1#"
   },
   { "lsr",       LSRFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_LSR) "#1#"
   },
   { "lsr",       LSR_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_LSR) "#1#"
   },
   { "lsr",       LSRW_W,     3, { BASE_REG, REG, DST_REG }, 
                  F_WORD,
                  S_OP3(S_LSR)
   },
   { "lsr",       LSRK_W,     3, { BASE_REG, SHIFT_LITERAL, DST_REG }, 
                  F_WORD,
                  S_OP3(S_LSR)
   },

   /***************************************************************************
    * MPY - Must be before MAC; otherwise, MAC is chosen during disassembly.
    ***************************************************************************/
   { "mpy",       MPY_A,      2, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPY)
   },
   { "mpy",       MPY_X,      4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPY) S_MOV "4" S_PFTCH "3"
   },
   { "mpy",       MPY_Y,      4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPY) S_MOV "4" S_PFTCH "3"
   },
   { "mpy",       MPY,        6, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPY) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
   },
   { "mpy",       SQR_A,      2, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR)
   },
   { "mpy",       SQR_X,      4, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR) S_MOV "4" S_PFTCH "3"
   },
   { "mpy",       SQR_Y,      4, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR) S_MOV "4" S_PFTCH "3"
   },
   { "mpy",       SQR,        6, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
   },

   /***************************************************************************
    * MPY.N
    ***************************************************************************/
   { "mpy.n",     MPYN_A,     2, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPYN)
   },
   { "mpy.n",     MPYN_X,     4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPYN) S_MOV "4" S_PFTCH "3"
   },
   { "mpy.n",     MPYN_Y,     4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPYN) S_MOV "4" S_PFTCH "3"
   },
   { "mpy.n",     MPYN,       6, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MPYN) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
   },

   /***************************************************************************
    * MOVSAC - Must be before MAC; otherwise, MAC is chosen during disasembly.
    ***************************************************************************/
   { "movsac",    MOVSAC_A,   1, { DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_NOP
   },
   { "movsac",    MOVSAC_WB,  2, { DSP_ACCUMULATOR_SELECT,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_MOV "2" S_OTHER "1"
   },
   { "movsac",    MOVSAC_X,   3, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_MOV "3" S_PFTCH "2"
   },
   { "movsac",    MOVSAC_Y,   3, { DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_MOV "3" S_PFTCH "2"
   },
   { "movsac",    MOVSAC_XWB, 4, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_MOV "3" S_PFTCH "2" S_MOV "4" S_OTHER "1"
   },
   { "movsac",    MOVSAC_YWB, 4, { DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_MOV "3" S_PFTCH "2" S_MOV "4" S_OTHER "1"
   },
   { "movsac",    MOVSAC_XY,  5, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_MOV "3" S_PFTCH "2" S_MOV "5" S_PFTCH "4"
   },
   { "movsac",    MOVSAC,     6, { DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_MOV "3" S_PFTCH "2" S_MOV "5" S_PFTCH "4" 
                  S_MOV "5" S_OTHER "1"
   },

   /***************************************************************************
    * MAC
    ***************************************************************************/
   { "mac",       MAC_A,      2, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC)
   },
   { "mac",       MAC_WB,     3, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "3" S_OTHER "1"
   },
   { "mac",       MAC_X,      4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "4" S_PFTCH "3"
   },
   { "mac",       MAC_Y,      4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "4" S_PFTCH "3"
   },
   { "mac",       MAC_XWB,    5, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "4" S_PFTCH "3" S_MOV "5" S_OTHER "1"
   },
   { "mac",       MAC_YWB,    5, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "4" S_PFTCH "3" S_MOV "5" S_OTHER "1"
   },
   { "mac",       MAC_XY,     6, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
   },
   { "mac",       MAC,        7, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MAC) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
                  S_MOV "7" S_OTHER "1"
   },
   { "mac",       SQRAC_A,    2, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR)
   },
   { "mac",       SQRAC_X,    4, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR) S_MOV "4" S_PFTCH "3"
   },
   { "mac",       SQRAC_Y,    4, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR) S_MOV "4" S_PFTCH "3"
   },
   { "mac",       SQRAC,      6, { DSP_SQUARE,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_SQR) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
   },

   /***************************************************************************
    * MAXAB
    **************************************************************************/
   { "max",       MAXAB,      1, { DSP_ACCUMULATOR_SELECT },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },

   /***************************************************************************
    * MAXABW
    **************************************************************************/
   { "max",       MAXABW,     2, { DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },
   { "max.v",     MAXABWV,    2, { DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },

   /***************************************************************************
    * MINAB
    **************************************************************************/
   { "min",       MINAB,      1, { DSP_ACCUMULATOR_SELECT },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },

   /***************************************************************************
    * MINABW
    **************************************************************************/
   { "min",       MINABW,      2, { DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },
   { "min.v",     MINABWV,     2, { DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },

   /***************************************************************************
    * MINABZ
    **************************************************************************/
   { "minz",      MINABZ,      1, { DSP_ACCUMULATOR_SELECT },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },

   /***************************************************************************
    * MINABWZ
    **************************************************************************/
   { "minz",      MINABWZ,     2, { DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },
   { "minz.v",    MINABWVZ,   2, { DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK,
   },


   /***************************************************************************
    * MOV.b
    ***************************************************************************/
   { "mov.b",     MOVWF_B,    2, { W_REG,
                                   FILE_REG_BYTE }, 
                  F_HAS_REQUIRED_WREG,
                  S_MOV "1" "W00"
   },
   { "mov.b",     MOVLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "mov.b",     MOVFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_MOV "2" "1"
   },
   { "mov.b",     MOVFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "1"
   },
   { "mov.b",     MOV_B,      2, { G_REG, H_DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "mov.b",     LDWLO_B,    2, { LO_SRC_REG, DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "mov.b",     STWLO_B,    2, { REG, LO_DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * MOV.d
    ***************************************************************************/
   { "mov.d",     LDDW,       2, { PIND_SRC_REG,DBL_DST_REG }, 
                  F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1"
   },
   { "mov.d",     STDW,       2, { DBL_SRC_REG,	QIND_DST_REG }, 
                  F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1"
   },
   { "mov.d",     LDDW,       2, { DBL_SRC_REG,	DBL_DST_REG }, 
                  F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * MOV.w
    ***************************************************************************/
   { "mov.w",     MOVWF_W,    2, { W_REG, FILE_REG }, 
                  F_WORD | F_HAS_REQUIRED_WREG,
                  S_MOV "1" "W00"
   },
   { "mov.w",     MOVL_W,     2, { LITERAL_16BIT, REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov.w",     MOVLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov.w",     MOVFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "2" "1"
   },
   { "mov.w",     MOVFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "1"
   },
   { "mov.w",     MOV_W,      2, { G_REG, H_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov.w",     LDWLO_W,    2, { LO_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov.w",     STWLO_W,    2, { REG, LO_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov.w",     STW,        2, { REG, FILE_REG_WORD_WITH_DST }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov.w",     LDW,        2, { FILE_REG_WORD_WITH_DST, REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * MOV
    ***************************************************************************/
   { "mov",       MOVWF_W,    2, { W_REG, FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "1" "W00"
   },
   { "mov",       MOVL_W,     2, { LITERAL_16BIT, REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov",       MOVFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "2" "1"
   },
   { "mov",       MOVFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "1"
   },
   { "mov",       MOV_W,      2, { G_REG, H_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov",       LDWLO_W,    2, { LO_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov",       STWLO_W,    2, { REG, LO_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov",       STW,        2, { REG, FILE_REG_WORD_WITH_DST }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "mov",       LDW,        2, { FILE_REG_WORD_WITH_DST, REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "movpag",    MOVPAG_W,   2, { REG, PAGE_REG}, 
                  F_ECORE | F_ISAV4,
                  S_MOV "2" "1"
   },
   { "movpag",    MOVPAG,     2, { LITERAL_10BIT_NO_SHIFT, PAGE_REG}, 
                  F_ECORE | F_ISAV4,
                  S_MOV "2" "1"
   },
  

   /***************************************************************************
    * MSC
    ***************************************************************************/
   { "msc",       MSC_A,      2, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC)
   },
   { "msc",       MSC_WB,     3, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "3" S_OTHER "1"
   },
   { "msc",       MSC_X,      4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "4" S_PFTCH "3"

   },
   { "msc",       MSC_Y,      4, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "4" S_PFTCH "3"
   },
   { "msc",       MSC_XWB,    5, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "4" S_PFTCH "3" S_MOV "5" S_OTHER "1"
   },
   { "msc",       MSC_YWB,    5, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "4" S_PFTCH "3" S_MOV "5" S_OTHER "1"
   },
   { "msc",       MSC_XY,     6, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
   },
   { "msc",       MSC,        7, { DSP_MULTIPLICAND,
                                   DSP_ACCUMULATOR_SELECT,
                                   DSP_X_PREFETCH_OPERATION,
                                   DSP_X_PREFETCH_DST,
                                   DSP_Y_PREFETCH_OPERATION,
                                   DSP_Y_PREFETCH_DST,
                                   DSP_WRITEBACK }, 
                  F_IS_DSP_INSN,
                  S_OP2(S_MSC) S_MOV "4" S_PFTCH "3" S_MOV "6" S_PFTCH "5"
                  S_MOV "7" S_OTHER "1"
   },

   /***************************************************************************
    * MUL
    ***************************************************************************/
   { "mul.b",     MULWF_B,      1, { FILE_REG_BYTE }, 
                  F_NONE,
                  S_MOV "W02" S_MUL "W00" "1"
   },
   { "mul.w",     MULWF_W,      1, { FILE_REG }, 
                  F_WORD,
                  S_MOV "W02" S_MUL "W00" "1"
   },
   { "mul",       MULWF_W,      1, { FILE_REG }, 
                  F_WORD,
                  S_MOV "W02" S_MUL "W00" "1"
   },


   { "mul.ss",    MUL_SS_ACC,   3, { BASE_REG,
                                     P_SRC_REG,
                                     ECORE_ACCUMULATOR_SELECT },
                  F_ISAV4 | F_ECORE | F_IS_DSP_INSN,
                  S_OP3(S_MUL)
   },

   { "mul.ss",    MUL_SS,       3,  { BASE_REG,
                                      P_SRC_REG,
                                      DBL_MUL_DST_REG }, 
                  F_WORD,
                  S_OP3(S_MUL)
   },
 
   { "mulw.ss",   MULW_SS,      3, { BASE_REG,
                                     P_SRC_REG,
                                     W_MUL_DST_REG }, 
                  F_ISAV4 | F_ECORE,
                  S_OP3(S_MUL)
   },
  
   { "mul.su",    MULLS_SU_ACC, 3, { BASE_REG,
                                     UNSIGNED_SHORT_LITERAL,
                                     ECORE_ACCUMULATOR_SELECT },
                  F_ECORE | F_ISAV4 | F_IS_DSP_INSN,
                  S_OP3(S_MUL)
   },

   { "mul.su",    MUL_SU_ACC,   3, { BASE_REG,
                                     P_SRC_REG,
                                     ECORE_ACCUMULATOR_SELECT },
                                     F_ISAV4 | F_ECORE | F_IS_DSP_INSN,
                  S_OP3(S_MUL)
   },

   { "mul.su",    MULLS_SU,     3, { BASE_REG,
                                     UNSIGNED_SHORT_LITERAL,
                                     DBL_MUL_DST_REG }, 
                  F_WORD,
                  S_OP3(S_MUL)
   }, 

   { "mul.su",    MUL_SU,       3, { BASE_REG,
                                     P_SRC_REG,
                                     DBL_MUL_DST_REG }, 
                  F_WORD,
                  S_OP3(S_MUL)
   },
 

   { "mulw.su",   MULLSW_SU,    3, { BASE_REG,
                                     UNSIGNED_SHORT_LITERAL,
                                     W_MUL_DST_REG }, 
                  F_ISAV4 | F_ECORE,
                  S_OP3(S_MUL)
   }, 

   { "mulw.su",   MULW_SU,      3, { BASE_REG,
                                     P_SRC_REG,
                                     W_MUL_DST_REG }, 
                  F_ISAV4 | F_ECORE,
                  S_OP3(S_MUL)
   },
  
  
   { "mul.uu",    MULLS_UU_ACC, 3, { BASE_REG,
                                     UNSIGNED_SHORT_LITERAL,
                                     ECORE_ACCUMULATOR_SELECT },
                  F_ISAV4 | F_ECORE | F_IS_DSP_INSN,
                  S_OP3(S_MUL)
   },

   { "mul.uu",    MUL_UU_ACC,   3, { BASE_REG,
                                     P_SRC_REG,
                                     ECORE_ACCUMULATOR_SELECT },
                  F_ISAV4 | F_ECORE | F_IS_DSP_INSN,
                  S_OP3(S_MUL)
   },
   
   { "mul.uu",    MULLS_UU,     3, { BASE_REG,
                                     UNSIGNED_SHORT_LITERAL,
                                     DBL_MUL_DST_REG }, 
                  F_WORD,
                  S_OP3(S_MUL)
   },

   { "mul.uu",    MUL_UU,       3, { BASE_REG,
                                     P_SRC_REG,
                                     DBL_MUL_DST_REG },
                  F_WORD,
                  S_OP3(S_MUL)
   },

   { "mulw.uu",   MULLSW_UU,    3, { BASE_REG,
                                     UNSIGNED_SHORT_LITERAL,
                                     W_MUL_DST_REG }, 
                  F_ISAV4 | F_ECORE,
                  S_OP3(S_MUL)
   },

   { "mulw.uu",   MULW_UU,      3, { BASE_REG,
                                     P_SRC_REG,
                                     W_MUL_DST_REG }, 
                  F_ISAV4 | F_ECORE,
                  S_OP3(S_MUL)
   },


   { "mul.us",    MUL_US_ACC,   3, { BASE_REG,
                                     P_SRC_REG,
                                     ECORE_ACCUMULATOR_SELECT  },
                  F_ISAV4 | F_ECORE | F_IS_DSP_INSN,
                  S_OP3(S_MUL)
   }, 
   { "mul.us",    MUL_US,       3, { BASE_REG,
                                     P_SRC_REG,
                                     DBL_MUL_DST_REG }, 
                  F_WORD,
                  S_OP3(S_MUL)
   },

   { "mulw.us",   MULW_US,      3, { BASE_REG,
                                     P_SRC_REG,
                                     W_MUL_DST_REG }, 
                  F_ISAV4 | F_ECORE,
                  S_OP3(S_MUL)
   },

   /***************************************************************************
    * NEG.b
    ***************************************************************************/
   { "neg.b",     NEGFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_NEG)
   },
   { "neg.b",     NEGFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_NEG)
   },
   { "neg.b",     NEG_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_NEG)
   },

   /***************************************************************************
    * NEG.w
    ***************************************************************************/
   { "neg.w",     NEGFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_NEG)
   },
   { "neg.w",     NEGFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_NEG)
   },
   { "neg.w",     NEG_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_NEG)
   },

   /***************************************************************************
    * NEG
    ***************************************************************************/
   { "neg",       DUMMY,      0, { 0 /* for flags */ }, 
                  F_WORD | F_HAS_IMPLIED_WREG | F_IS_DSP_INSN,
                  S_NOP
   },
   { "neg",       NEGFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_NEG)
   },
   { "neg",       NEGFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_NEG)
   },
   { "neg",       NEG_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_NEG)
   },
   { "neg",       NEGAB,      1, { DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_UNK
   },

   /***************************************************************************
    * NOP
    ***************************************************************************/
   { "nop",       NOP,        0, { 0 /* OPERANDS */ }, 
                  F_NONE,
                  S_NOP
   },
   { "nopr",      NOPR,       0, { 0 /* OPERANDS */ }, 
                  F_NONE,
                  S_NOP
   },

   /***************************************************************************
    * NORMACW
    ***************************************************************************/
   { "norm",      NORMACW,    2, {DSP_ACCUMULATOR_SELECT, P_SRC_REG  },
                  F_IS_DSP_INSN | F_ISAV4,
                  S_UNK
   },

   /***************************************************************************
    * POP
    ***************************************************************************/
   { "pop.w",     POP_W,      1, { H_DST_REG }, 
                  F_WORD,
                  S_OP1(S_POP)
   },
   { "pop",       POP_W,      1, { H_DST_REG }, 
                  F_WORD,
                  S_OP1(S_POP)
   },
   { "pop",       POPF,       1, { FILE_REG_WORD }, 
                  F_NONE,
                  S_OP1(S_POP)
   },

   /***************************************************************************
    * POP.d
    ***************************************************************************/
   { "pop.d",     POP_D,      1, { DBL_DST_REG }, 
                  F_NONE,
                  S_OP1(S_POP)
   },

   /***************************************************************************
    * POP.s
    ***************************************************************************/
   { "pop.s",     ITCH,       0, { 0 /* OPERANDS */ }, 
                  F_NONE,
                  S_CLBR "W00"
                  S_CLBR "W01"
                  S_CLBR "W02"
                  S_CLBR "W03"
   },

   /***************************************************************************
    * PWRSAV
    ***************************************************************************/
   { "pwrsav",    PWRSAV,     1, { PWRSAV_MODE }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_NOP
   },

   /***************************************************************************
    * PUSH
    ***************************************************************************/
   { "push.w",    PUSH_W,     1, { G_REG }, 
                  F_WORD,
                  S_OP1(S_PUSH)
   },
   { "push",      PUSH_W,     1, { G_REG }, 
                  F_WORD,
                  S_OP1(S_PUSH)
   },
   { "push",      PUSHF,      1, { FILE_REG_WORD }, 
                  F_NONE,
                  S_OP1(S_PUSH)
   },

   /***************************************************************************
    * PUSH.d
    ***************************************************************************/
   { "push.d",    PUSH_D,     1, { DBL_SRC_REG }, 
                  F_NONE,
                  S_OP1(S_PUSH)
   },

   /***************************************************************************
    * PUSH.s
    ***************************************************************************/
   { "push.s",    SCRATCH,    0, { 0 /* OPERANDS */ }, 
                  F_NONE,
                  S_NOP
   },

   /***************************************************************************
    * RCALL
    ***************************************************************************/
   { "rcall",     RCALLW,     1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_OP1(S_CALL)
   },
   { "rcall",     RCALLWE,    1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ISAV4 | F_ECORE,
                  S_OP1(S_CALL)
   },
   { "rcall",     RCALL,      1, { BRANCH_LABEL }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_OP1(S_CALL)
   },

   /***************************************************************************
    * REPEAT
    ***************************************************************************/
   { "repeat",    REPEATW,    1, { REG }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_OP1(S_RPT)
   },
   { "repeat",    REPEAT,     1, { LITERAL_14BIT }, 
                  F_CANNOT_FOLLOW_REPEAT | F_FCORE,
                  S_OP1(S_RPT)
   },
   { "repeat",    REPEATE,     1, { LITERAL_15BIT }, 
                  F_CANNOT_FOLLOW_REPEAT | F_ISAV4 | F_ECORE,
                  S_OP1(S_RPT)
   },

   /***************************************************************************
    * RESET
    ***************************************************************************/
   { "reset",     RESET,      0, { 0 /* OPERANDS */ }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_OP1(S_RESET)
   },

   /***************************************************************************
    * RETFIE
    ***************************************************************************/
   { "retfie",    RETFIE,     0, { 0 /* OPERANDS */ }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_RET
   },

   /***************************************************************************
    * RETLW
    ***************************************************************************/
   { "retlw.b",   RETLW_B,    2, { BYTE_LITERAL_10BIT,
                                   REG }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1" S_RET
   },
   { "retlw.w",   RETLW_W,    2, { LITERAL_10BIT,
                                   REG }, 
                  F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1" S_RET
   },
   { "retlw",     RETLW_W,    2, { LITERAL_10BIT,
                                   REG }, 
                  F_WORD | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1" S_RET
   },

   /***************************************************************************
    * RETURN
    ***************************************************************************/
   { "return",    RETURN,     0, { 0 /* OPERANDS */ }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_RET
   },

   /***************************************************************************
    * RLC.b
    ***************************************************************************/
   { "rlc.b",     RLCFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTLC)
   },
   { "rlc.b",     RLCFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTLC)
   },
   { "rlc.b",     RLC_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_ROTLC)
   },

   /***************************************************************************
    * RLC.w
    ***************************************************************************/
   { "rlc.w",     RLCFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTLC)
   },
   { "rlc.w",     RLCFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTLC)
   },
   { "rlc.w",     RLC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTLC)
   },

   /***************************************************************************
    * RLC
    ***************************************************************************/
   { "rlc",       RLCFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTLC)
   },
   { "rlc",       RLCFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTLC)
   },
   { "rlc",       RLC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTLC)
   },

   /***************************************************************************
    * RLNC.b
    ***************************************************************************/
   { "rlnc.b",    RLNCFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTLN)
   },
   { "rlnc.b",    RLNCFW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTLN)
   },
   { "rlnc.b",    RLNC_B,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_ROTLN)
   },

   /***************************************************************************
    * RLNC.w
    ***************************************************************************/
   { "rlnc.w",    RLNCFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTLN)
   },
   { "rlnc.w",    RLNCFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTLN)
   },
   { "rlnc.w",    RLNC_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTLN)
   },

   /***************************************************************************
    * RLNC
    ***************************************************************************/
   { "rlnc",      RLNCFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTLN)
   },
   { "rlnc",      RLNCFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTLN)
   },
   { "rlnc",      RLNC_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTLN)
   },

   /***************************************************************************
    * RRC.b
    ***************************************************************************/
   { "rrc.b",     RRCFF_B,    1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTRC)
   },
   { "rrc.b",     RRCFW_B,    2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTRC)
   },
   { "rrc.b",     RRC_B,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_ROTRC)
   },

   /***************************************************************************
    * RRC.w
    ***************************************************************************/
   { "rrc.w",     RRCFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTRC)
   },
   { "rrc.w",     RRCFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTRC)
   },
   { "rrc.w",     RRC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTRC)
   },

   /***************************************************************************
    * RRC
    ***************************************************************************/
   { "rrc",       RRCFF_W,    1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTRC)
   },
   { "rrc",       RRCFW_W,    2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTRC)
   },
   { "rrc",       RRC_W,      2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTRC)
   },

   /***************************************************************************
    * RRNC.b
    ***************************************************************************/
   { "rrnc.b",    RRNCFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTRN)
   },
   { "rrnc.b",    RRNCFW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTRN)
   },
   { "rrnc.b",    RRNC_B,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_ROTRN)
   },

   /***************************************************************************
    * RRNC.w
    ***************************************************************************/
   { "rrnc.w",    RRNCFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTRN)
   },
   { "rrnc.w",    RRNCFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTRN)
   },
   { "rrnc.w",    RRNC_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTRN)
   },

   /***************************************************************************
    * RRNC
    ***************************************************************************/
   { "rrnc",      RRNCFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_ROTRN)
   },
   { "rrnc",      RRNCFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_ROTRN)
   },
   { "rrnc",      RRNC_W,     2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_ROTRN)
   },

   /***************************************************************************
    * SAC
    ***************************************************************************/
   { "sac",       SAC_PS,     3, { DSP_ACCUMULATOR_SELECT,
                                   DSP_PRESHIFT,
                                   G_REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "3" "1"
   },
   { "sac",       SAC,        2, { DSP_ACCUMULATOR_SELECT,
                                   G_REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * SAC.w
    ***************************************************************************/
   { "sac.w",       SAC_PS,     3, { DSP_ACCUMULATOR_SELECT,
                                     DSP_PRESHIFT,
                                     G_REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "3" "1"
   },
   { "sac.w",       SAC,        2, { DSP_ACCUMULATOR_SELECT,
                                     G_REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * SACD
    ***************************************************************************/
   { "sac.d",     SACD_PS,   3, { DSP_ACCUMULATOR_SELECT,
                                  DSP_PRESHIFT,
                                  SACD_DST_REG }, 
                  F_WORD | F_ISAV4 | F_IS_DSP_INSN | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "3" "1"
   },
   { "sac.d",     SACD,      2, { DSP_ACCUMULATOR_SELECT,
                                  SACD_DST_REG }, 
                  F_WORD | F_ISAV4 | F_IS_DSP_INSN | F_CANNOT_FOLLOW_REPEAT,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * SRAC
    ***************************************************************************/
   { "sac.r",     SAC_R_PS,   3, { DSP_ACCUMULATOR_SELECT,
                                   DSP_PRESHIFT,
                                   G_REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "3" "1"
   },
   { "sac.r",     SAC_R,      2, { DSP_ACCUMULATOR_SELECT,
                                   G_REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * SE
    ***************************************************************************/
   { "se",        SE_W,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_SE)
   },
   { "se.w",      SE_W,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_SE)
   },

   /***************************************************************************
    * SETM.b
    ***************************************************************************/
   { "setm.b",    SETW_B,     1, { W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "#-1#"
   },
   { "setm.b",    SET_B,      1, { Q_DST_REG }, 
                  F_NONE,
                  S_OP1(S_MOV) "#-1#"
   },
   { "setm.b",    SETF_B,     1, { FILE_REG_BYTE }, 
                  F_NONE,
                  S_OP1(S_MOV) "#-1#"
   },

   /***************************************************************************
    * SET.w
    ***************************************************************************/
   { "setm.w",    SETW_W,     1, { W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "#-1#"
   },
   { "setm.w",    SET_W,      1, { Q_DST_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#-1#"
   },
   { "setm.w",    SETF_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#-1#"
   },

   /***************************************************************************
    * SET
    ***************************************************************************/
   { "setm",      SETW_W,     1, { W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_MOV "W00" "#-1#"
   },
   { "setm",      SET_W,      1, { Q_DST_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#-1#"
   },
   { "setm",      SETF_W,     1, { FILE_REG }, 
                  F_WORD,
                  S_OP1(S_MOV) "#-1#"
   },

   /***************************************************************************
    * SFTAC
    ***************************************************************************/
   { "sftac",     SFTACW,     2, { DSP_ACCUMULATOR_SELECT,
                                   REG }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_NOP
   },
   { "sftac",     SFTACK,     2, { DSP_ACCUMULATOR_SELECT,
                                   DSP_SHORT_LITERAL }, 
                  F_WORD | F_IS_DSP_INSN,
                  S_NOP
   },

   /***************************************************************************
    * SL.b
    ***************************************************************************/
   { "sl.b",      SLFF_B,     1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFF(S_SL) "#1#"
   },
   { "sl.b",      SLFW_B,     2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPFW(S_SL) "#1#"
   },
   { "sl.b",      SL_B,       2, { P_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_OP2(S_SL) "#1#"
   },

   /***************************************************************************
    * SL.w
    ***************************************************************************/
   { "sl.w",      SLFF_W,     1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_SL) "#1#"
   },
   { "sl.w",      SLFW_W,     2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_SL) "#1#"
   },
   { "sl.w",      SL_W,       2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_SL) "#1#"
   },
   { "sl.w",      SLW_W,      3, { BASE_REG, REG, DST_REG }, 
                  F_WORD,
                  S_OP3(S_SL)
   },
   { "sl.w",      SLK_W,      3, { BASE_REG, SHIFT_LITERAL, DST_REG }, 
                  F_WORD,
                  S_OP3(S_SL)
   },

   /***************************************************************************
    * SL
    ***************************************************************************/
   { "sl",        SLFF_W,     1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFF(S_SL) "#1#"
   },
   { "sl",        SLFW_W,     2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPFW(S_SL) "#1#"
   },
   { "sl",        SL_W,       2, { P_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_OP2(S_SL) "#1#"
   },
   { "sl",        SLW_W,      3, { BASE_REG, REG, DST_REG }, 
                  F_WORD,
                  S_OP3(S_SL)
   },
   { "sl",        SLK_W,      3, { BASE_REG, SHIFT_LITERAL, DST_REG }, 
                  F_WORD,
                  S_OP3(S_SL)
   },

   /***************************************************************************
    * SUB.b
    ***************************************************************************/
   { "sub.b",     SUBWFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUB)
   },
   { "sub.b",     SUBWFW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUB)
   },
   { "sub.b",     SUBLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_SUB)
   },
   /* FIXME: The next instr is not valid in the current isa */
   { "sub.b",     SUBLW_B,    2, { REG, BYTE_LITERAL_10BIT }, 
                  F_NONE,
                  S_OPLW(S_SUB)
   },
   { "sub.b",     SUBLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_SUB)
   },
   { "sub.b",     SUBLS_B,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_SUB)
   },
   { "sub.b",     SUB_B,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_SUB)
   },

   /***************************************************************************
    * SUB.w
    ***************************************************************************/
   { "sub.w",     SUBWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUB)
   },
   { "sub.w",     SUBWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUB)
   },
   { "sub.w",     SUBLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_SUB)
   },
   /* FIXME: The next instr is not valid in the current isa */
   { "sub.w",     SUBLW_W,    2, { REG, LITERAL_10BIT }, 
                  F_WORD,
                  S_OPLW(S_SUB)
   },
   { "sub.w",     SUBLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUB)
   },
   { "sub.w",     SUB_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUB)
   },

   /***************************************************************************
    * SUB
    ***************************************************************************/
   { "sub",       DUMMY,      0, { 0 /* for flags */ }, 
                  F_WORD | F_HAS_IMPLIED_WREG | F_IS_DSP_INSN,
                  S_NOP
   },
   { "sub",       SUBWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUB)
   },
   { "sub",       SUBWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUB)
   },
   /* FIXME: The next instr is not valid in the current isa */
   { "sub",       SUBLW_W,    2, { REG, LITERAL_10BIT }, 
                  F_WORD,
                  S_OPLW(S_SUB)
   },
   { "sub",       SUBLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_SUB)
   },
   { "sub",       SUBLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUB)
   },
   { "sub",       SUB_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUB)
   },
   { "sub",       SUBAB,      1, { DSP_ACCUMULATOR_SELECT }, 
                  F_IS_DSP_INSN,
                  S_NOP
   },

   /***************************************************************************
    * SUBB.b
    ***************************************************************************/
   { "subb.b",    SUBBWFF_B,  1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBB)
   },
   { "subb.b",    SUBBWFW_B,  2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBB)
   },
   { "subb.b",    SUBBLW_B,   2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_SUBB)
   },
   /* FIXME: The next instr is not valid in the current isa */
   { "subb.b",    SUBBLW_B,   2, { REG, BYTE_LITERAL_10BIT }, 
                  F_NONE,
                  S_OPLW(S_SUBB)
   },
   { "subb.b",    SUBBLS_B,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_SUBB)
   },
   { "subb.b",    SUBB_B,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_SUBB)
   },

   /***************************************************************************
    * SUBB.w
    ***************************************************************************/
   { "subb.w",    SUBBWFF_W,  1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBB)
   },
   { "subb.w",    SUBBWFW_W,  2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBB)
   },
   { "subb.w",    SUBBLW_W,   2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_SUBB)
   },
   /* FIXME: The next instr is not valid in the current isa */
   { "subb.w",    SUBBLW_W,   2, { REG, LITERAL_10BIT }, 
                  F_WORD,
                  S_OPLW(S_SUBB)
   },
   { "subb.w",    SUBBLS_W,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUBB)
   },
   { "subb.w",    SUBB_W,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUBB)
   },

   /***************************************************************************
    * SUBB
    ***************************************************************************/
   { "subb",      SUBBWFF_W,  1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBB)
   },
   { "subb",      SUBBWFW_W,  2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBB)
   },
   { "subb",      SUBBLW_W,   2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_SUBB)
   },
   /* FIXME: The next instr is not valid in the current isa */
   { "subb",      SUBBLW_W,   2, { REG, LITERAL_10BIT }, 
                  F_WORD,
                  S_OPLW(S_SUBB)
   },
   { "subb",      SUBBLS_W,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUBB)
   },
   { "subb",      SUBB_W,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUBB)
   },

   /***************************************************************************
    * SUBR.b
    ***************************************************************************/
   { "subr.b",    SUBRWFF_B,  1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBR)
   },
   { "subr.b",    SUBRWFW_B,  2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBR)
   },
   { "subr.b",    SUBRLS_B,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_SUBR)
   },
   { "subr.b",    SUBR_B,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_SUBR)
   },

   /***************************************************************************
    * SUBR.w
    ***************************************************************************/
   { "subr.w",    SUBRWFF_W,  1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBR)
   },
   { "subr.w",    SUBRWFW_W,  2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBR)
   },
   { "subr.w",    SUBRLS_W,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUBR)
   },
   { "subr.w",    SUBR_W,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUBR)
   },

   /***************************************************************************
    * SUBR
    ***************************************************************************/
   { "subr",      SUBRWFF_W,  1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBR)
   },
   { "subr",      SUBRWFW_W,  2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBR)
   },
   { "subr",      SUBRLS_W,   3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUBR)
   },
   { "subr",      SUBR_W,     3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUBR)
   },

   /***************************************************************************
    * SUBBR.b
    ***************************************************************************/
   { "subbr.b",   SUBBRWFF_B, 1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBBR)
   },
   { "subbr.b",   SUBBRWFW_B, 2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBBR)
   },
   { "subbr.b",   SUBBRLS_B,  3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_SUBBR)
   },
   { "subbr.b",   SUBBR_B,    3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_SUBBR)
   },

   /***************************************************************************
    * SUBBR.w
    ***************************************************************************/
   { "subbr.w",   SUBBRWFF_W, 1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBBR)
   },
   { "subbr.w",   SUBBRWFW_W, 2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBBR)
   },
   { "subbr.w",   SUBBRLS_W,  3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUBBR)
   },
   { "subbr.w",   SUBBR_W,    3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUBBR)
   },

   /***************************************************************************
    * SUBBR
    ***************************************************************************/
   { "subbr",     SUBBRWFF_W, 1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_SUBBR)
   },
   { "subbr",     SUBBRWFW_W, 2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_SUBBR)
   },
   { "subbr",     SUBBRLS_W,  3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_SUBBR)
   },
   { "subbr",     SUBBR_W,    3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_SUBBR)
   },

   /***************************************************************************
    * SWAP
    ***************************************************************************/
   { "swap.b",    SWAP_B,     1, { REG }, 
                  F_NONE,
                  S_OP1(S_SWAP)
   },
   { "swap.w",    SWAP_W,     1, { REG }, 
                  F_WORD,
                  S_OP1(S_SWAP)
   },
   { "swap",      SWAP_W,     1, { REG }, 
                  F_WORD,
                  S_OP1(S_SWAP)
   },

   /***************************************************************************
    * TBLRDH
    ***************************************************************************/
   { "tblrdh.b",  TBLRDH_B,   2, { PIND_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "tblrdh.w",  TBLRDH_W,   2, { PIND_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "tblrdh",    TBLRDH_W,   2, { PIND_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * TBLRDL
    ***************************************************************************/
   { "tblrdl.b",  TBLRDL_B,   2, { PIND_SRC_REG, Q_DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "tblrdl.w",  TBLRDL_W,   2, { PIND_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "tblrdl",    TBLRDL_W,   2, { PIND_SRC_REG, Q_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * TBLWTH
    ***************************************************************************/
   { "tblwth.b",  TBLWTH_B,   2, { P_SRC_REG, QIND_DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "tblwth.w",  TBLWTH_W,   2, { P_SRC_REG, QIND_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "tblwth",    TBLWTH_W,   2, { P_SRC_REG, QIND_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * TBLWTL
    ***************************************************************************/
   { "tblwtl.b",  TBLWTL_B,   2, { P_SRC_REG, QIND_DST_REG }, 
                  F_NONE,
                  S_MOV "2" "1"
   },
   { "tblwtl.w",  TBLWTL_W,   2, { P_SRC_REG, QIND_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },
   { "tblwtl",    TBLWTL_W,   2, { P_SRC_REG, QIND_DST_REG }, 
                  F_WORD,
                  S_MOV "2" "1"
   },

   /***************************************************************************
    * ULNK
    ***************************************************************************/
   { "ulnk",      ULNK,       0, { 0 /* OPERANDS */ }, 
                  F_CANNOT_FOLLOW_REPEAT,
                  S_ULNK
   },

   /***************************************************************************
    * VFSLV
    ***************************************************************************/
   { "vfslv",     VFSLV,      3, { P_SRC_REG, 
                                   IND_DST_REG_POST_INC, 
                                   LITERAL_2BIT},
                  F_WORD | F_ISAV4,
                  S_NOP
   },

   /***************************************************************************
    * XOR.b
    ***************************************************************************/
   { "xor.b",     XORWFF_B,   1, { FILE_REG_BYTE }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_XOR)
   },
   { "xor.b",     XORWFW_B,   2, { FILE_REG_BYTE, W_REG }, 
                  F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_XOR)
   },
   { "xor.b",     XORLW_B,    2, { BYTE_LITERAL_10BIT, REG }, 
                  F_NONE,
                  S_OPLW(S_XOR)
   },
   { "xor.b",     XORLS_B,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OPLS(S_XOR)
   },
   { "xor.b",     XOR_B,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_NONE,
                  S_OP3(S_XOR)
   },

   /***************************************************************************
    * XOR.w
    ***************************************************************************/
   { "xor.w",     XORWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_XOR)
   },
   { "xor.w",     XORWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_XOR)
   },
   { "xor.w",     XORLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_XOR)
   },
   { "xor.w",     XORLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_XOR)
   },
   { "xor.w",     XOR_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_XOR)
   },

   /***************************************************************************
    * XOR
    ***************************************************************************/
   { "xor",       XORWFF_W,   1, { FILE_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFF(S_XOR)
   },
   { "xor",       XORWFW_W,   2, { FILE_REG, W_REG }, 
                  F_WORD | F_HAS_IMPLIED_WREG,
                  S_OPWFW(S_XOR)
   },
   { "xor",       XORLW_W,    2, { LITERAL_10BIT, REG }, 
                  F_WORD,
                  S_OPLW(S_XOR)
   },
   { "xor",       XORLS_W,    3, { MATH_BASE_REG,
                                   UNSIGNED_SHORT_LITERAL,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OPLS(S_XOR)
   },
   { "xor",       XOR_W,      3, { MATH_BASE_REG,
                                   P_SRC_REG,
                                   Q_DST_REG }, 
                  F_WORD,
                  S_OP3(S_XOR)
   },

   /***************************************************************************
    * ZE
    ***************************************************************************/
   { "ze",        ZE_W,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_ZE)
   },
   { "ze.w",      ZE_W,       2, { P_SRC_REG, DST_REG }, 
                  F_WORD,
                  S_OP2(S_ZE)
   },

};
const int pic30_num_opcodes =
   (sizeof (pic30_opcodes) / sizeof (struct pic30_opcode));

/******************************************************************************
 *
 *   This function will insert the tttt encoding into the divide instruction.
 *
 ******************************************************************************/
unsigned long
pic30_insert_dividend_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

{
   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);
   insn = PIC30_ADD_OPERAND (insn, operand_value->value+1,
                             opnd->bits, opnd->shift+4);
   return(insn);
} /* unsigned long pic30_insert_dividend_reg(...) */

/******************************************************************************
 *
 *   This function will insert the tttt encoding into the DIVSW2 & DIVUW2.
 *
 ******************************************************************************/
unsigned long
pic30_insert_dividend16_reg_2 (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

{  
   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn, operand_value->value+1,
                             opnd->bits, opnd->shift+4);
      
   return(insn);
} /* unsigned long pic30_insert_dividend16_reg_2(...) */

/******************************************************************************
 *
 *   This function will insert the tttt encoding into the DIVF2.
 *
 ******************************************************************************/
unsigned long
pic30_insert_divf2_dividend_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

{
   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn, operand_value->value-1,
                             opnd->bits, opnd->shift-4);

   return(insn);
} /* unsigned long pic30_insert_divf2_dividend_reg(...) */

/******************************************************************************/

unsigned long
pic30_insert_file_reg_word_with_dst (insn, flags, opnd,
                                     operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This functions inserts a 15-bit file register with an implied 0 into an
 *   instruction that also accepts a destination register.  This function is
 *   required because the value must be shifted right by 1 before being
 *   inserted into the instruction.
 *
 ******************************************************************************/

{
   /* Need to shift the value by 1 to fit into the 15-bit field.  This
      operand has an implied 0.  */
   insn = PIC30_ADD_OPERAND (insn, operand_value->value >> 1,
                             opnd->bits, opnd->shift);

   return insn;
} /* unsigned long pic30_insert_file_reg_word_with_dst(...) */

/******************************************************************************/

void record_private_data(info, reg, mode) 
   struct disassemble_info * info;
   long reg;
   int mode;
{
  if (info->private_data) {
    struct pic30_private_data *private_data = info->private_data;
    if (private_data->opcode) {
      if (private_data->opnd_no >= MAX_OPERANDS) {
        fprintf(stderr,"*** error recording operands\n");
      } else {
        private_data->reg[private_data->opnd_no] = reg;
        private_data->mode[private_data->opnd_no++] = mode;
      }
    }
  }
}

char * pic30_extract_file_reg_word_with_dst (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function will extract a 15-bit file register with an implied 0 from
 *   an instruction that also accepts a destination register.  This function is
 *   required because the value extracted from the instruction must be shifted
 *   left by 1 before printing the address.  This is because of the implied 0.
 *
 ******************************************************************************/

{
   long file_reg_word = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   char * rc = (char *) malloc (1 + BASE_10_STRING_LENGTH + 1);

   file_reg_word <<= 1;

   sprintf (rc, "0x%lx", file_reg_word);

   record_private_data(info, file_reg_word, -1*OPND_UNKNOWN);
   return rc;
} /* char * pic30_extract_file_reg_word_with_dst(...) */
   
/******************************************************************************/

unsigned long
pic30_get_g_or_h_mode_value (type, error_msg)
   unsigned long type;
   char **error_msg;

/******************************************************************************
 *
 *   This function returns the correct encoding for the specified operand type
 *   addressing mode.
 *
 ******************************************************************************/

{
   unsigned long rc = 0;

   switch (type)
   {
      case OPND_REGISTER_DIRECT :
         rc = G_OR_H_REGISTER_DIRECT;
         break;

      case OPND_REGISTER_INDIRECT :
         rc = G_OR_H_REGISTER_INDIRECT;
         break;

      case OPND_REGISTER_POST_DECREMENT :
         rc = G_OR_H_REGISTER_POST_DECREMENT;
         break;

      case OPND_REGISTER_POST_INCREMENT :
         rc = G_OR_H_REGISTER_POST_INCREMENT;
         break;

      case OPND_REGISTER_PRE_DECREMENT :
         rc = G_OR_H_REGISTER_PRE_DECREMENT;
         break;

      case OPND_REGISTER_PRE_INCREMENT :
         rc = G_OR_H_REGISTER_PRE_INCREMENT;
         break;

      case OPND_REGISTER_WITH_DISPLACEMENT :
         rc = G_OR_H_REGISTER_WITH_DISPLACEMENT;
         break;

      default :
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "pic30_get_g_or_h_mode_value called with an "
                             "invalid operand type");
         break;
   } /* switch */

   return rc;
} /* unsigned long pic30_get_g_or_h_mode_value(unsigned long, char **) */

/******************************************************************************/

char *
pic30_generate_g_or_h_operand (insn, reg_num, mode, flags, err)
   unsigned long insn;
   long reg_num;
   long mode;
   unsigned long flags;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will generate a string given the addressing mode.
 *
 ******************************************************************************/

{
   const long DISPLACEMENT_BITS = 4;
   const long DSP_DISPLACEMENT_SHIFT = 11;
   const long DISPLACEMENT_SHIFT = 15;

   const char * register_string = pic30_registers[reg_num];

   long shift =
      (flags & F_IS_DSP_INSN) ? DSP_DISPLACEMENT_SHIFT : DISPLACEMENT_SHIFT;

   char * rc;

   switch (mode)
   {
      case G_OR_H_REGISTER_DIRECT:
         rc = (char *) malloc (strlen (register_string) + 1);
         strcpy (rc, register_string);
         break;

      case G_OR_H_REGISTER_INDIRECT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[]") + 1);
         sprintf (rc, "[%s]", register_string);
         break;

      case G_OR_H_REGISTER_POST_DECREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[--]") + 1);
         sprintf (rc, "[%s--]", register_string);
         break;

      case G_OR_H_REGISTER_POST_INCREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[++]") + 1);
         sprintf (rc, "[%s++]", register_string);
         break;

      case G_OR_H_REGISTER_PRE_DECREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[--]") + 1);
         sprintf (rc, "[--%s]", register_string);
         break;

      case G_OR_H_REGISTER_PRE_INCREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[++]") + 1);
         sprintf (rc, "[++%s]", register_string);
         break;

      case G_OR_H_REGISTER_WITH_DISPLACEMENT:
      {
         long displacement_reg_num =
            PIC30_EXTRACT_OPERAND (insn, DISPLACEMENT_BITS, shift);
         const char * displacement_register_string =
            pic30_registers[displacement_reg_num];

         rc = (char *) malloc (strlen (register_string) +
                               strlen (displacement_register_string) +
                               strlen ("[+]") + 1);
         sprintf (rc, "[%s+%s]", register_string, displacement_register_string);
         break;
      } /* case G_OR_H_REGISTER_WITH_DISPLACEMENT: */

      default :
         *err = TRUE;

         rc = (char *) malloc (strlen ("") + 1);
         strcpy (rc, "");
         break;
   } /* switch (mode) */

   return rc;
} /* char * pic30_generate_g_or_h_operand(long, long, unsigned char *) */

/******************************************************************************/

unsigned long
pic30_insert_g_or_h_displacement_value (insn, flags, mode, value)
   unsigned long insn;
   unsigned long flags;
   long mode;
   long value;

/******************************************************************************
 *
 *   This function will insert an operand in the form [Wn+Wb] into the given
 *   instruction.
 *
 ******************************************************************************/

{
   const long DISPLACEMENT_BITS = 4;
   const long DSP_DISPLACEMENT_SHIFT = 11;
   const long DISPLACEMENT_SHIFT = 15;

   if (mode == G_OR_H_REGISTER_WITH_DISPLACEMENT)
   {
      long shift =
         (flags & F_IS_DSP_INSN) ? DSP_DISPLACEMENT_SHIFT : DISPLACEMENT_SHIFT;

      insn = PIC30_ADD_OPERAND (insn, value, DISPLACEMENT_BITS, shift);
   } /* if (mode == G_OR_H_REGISTER_WITH_DISPLACEMENT) */

   return insn;
} /* unsigned long pic30_insert_g_or_h_displacement_value(...) */

/******************************************************************************/

unsigned long
pic30_insert_g_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags;
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the GGG SSSS encoding into the instruction.
 *
 ******************************************************************************/

{
   long mode = pic30_get_g_or_h_mode_value (operand_value->type, error_msg);

   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn, mode, PIC30_ADDRESSING_MODE_BITS,
                             PIC30_SRC_MODE_SHIFT);

   insn =
      pic30_insert_g_or_h_displacement_value (insn, flags, mode,
                                              operand_value->optional_value);

   return insn;
} /* unsigned long pic30_insert_g_reg(...) */

/******************************************************************************/

char *
pic30_extract_g_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags;
   const struct pic30_operand * opnd;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will extract the GGG SSSS operand from the instruction.
 *
 ******************************************************************************/

{
   long reg_num = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   long mode = PIC30_EXTRACT_OPERAND (insn, PIC30_ADDRESSING_MODE_BITS,
                                      PIC30_SRC_MODE_SHIFT);

   record_private_data(info, reg_num, mode);
   return pic30_generate_g_or_h_operand (insn, reg_num, mode, flags, err);
} /* char * pic30_extract_g_reg(...) */

/******************************************************************************/

unsigned long
pic30_insert_h_dst_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags;
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the HHH DDDD encoding into the instruction.
 *
 ******************************************************************************/

{
   long mode = pic30_get_g_or_h_mode_value (operand_value->type, error_msg);

   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn, mode, PIC30_ADDRESSING_MODE_BITS,
                             PIC30_DST_MODE_SHIFT);

   insn =
      pic30_insert_g_or_h_displacement_value (insn, flags, mode,
                                              operand_value->optional_value);

   return insn;
} /* unsigned long pic30_insert_h_dst_reg(...) */

/******************************************************************************/

char *
pic30_extract_h_dst_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags;
   const struct pic30_operand * opnd;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will extract the HHH DDDD operand from the instruction.
 *
 ******************************************************************************/

{
   long reg_num = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   long mode = PIC30_EXTRACT_OPERAND (insn, PIC30_ADDRESSING_MODE_BITS,
                                      PIC30_DST_MODE_SHIFT);

   record_private_data(info, reg_num, mode);
   return pic30_generate_g_or_h_operand (insn, reg_num, mode, flags, err);
} /* char * pic30_extract_h_dst_reg(...) */

/******************************************************************************/

unsigned long
pic30_get_p_or_q_mode_value (type, error_msg)
   unsigned long type;
   char **error_msg;

/******************************************************************************
 *
 *   This function returns the correct encoding for the specified operand type
 *   addressing mode.
 *
 ******************************************************************************/

{
   unsigned long rc = 0;

   switch (type)
   {
      case OPND_REGISTER_DIRECT :
         rc = P_OR_Q_REGISTER_DIRECT;
         break;

      case OPND_REGISTER_INDIRECT :
         rc = P_OR_Q_REGISTER_INDIRECT;
         break;

      case OPND_REGISTER_POST_DECREMENT :
         rc = P_OR_Q_REGISTER_POST_DECREMENT;
         break;

      case OPND_REGISTER_POST_INCREMENT :
         rc = P_OR_Q_REGISTER_POST_INCREMENT;
         break;

      case OPND_REGISTER_PRE_DECREMENT :
         rc = P_OR_Q_REGISTER_PRE_DECREMENT;
         break;

      case OPND_REGISTER_PRE_INCREMENT :
         rc = P_OR_Q_REGISTER_PRE_INCREMENT;
         break;

      default :
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "pic30_get_p_or_q_mode_value called with an "
                             "invalid operand type");
         break;
   } /* switch */

   return rc;
} /* unsigned long pic30_get_p_or_q_mode_value(unsigned long, char **) */

/******************************************************************************/

char *
pic30_generate_p_or_q_operand (reg_num, mode, err)
   long reg_num;
   long mode;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will generate a string given the addressing mode.
 *
 ******************************************************************************/

{
   const char * register_string = pic30_registers[reg_num];

   char * rc;

   switch (mode)
   {
      case P_OR_Q_REGISTER_DIRECT:
         rc = (char *) malloc (strlen (register_string) + 1);
         strcpy (rc, register_string);
         break;

      case P_OR_Q_REGISTER_INDIRECT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[]") + 1);
         sprintf (rc, "[%s]", register_string);
         break;

      case P_OR_Q_REGISTER_POST_DECREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[--]") + 1);
         sprintf (rc, "[%s--]", register_string);
         break;

      case P_OR_Q_REGISTER_POST_INCREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[++]") + 1);
         sprintf (rc, "[%s++]", register_string);
         break;

      case P_OR_Q_REGISTER_PRE_DECREMENT:
         rc = (char *) malloc (strlen (register_string) + strlen ("[--]") + 1);
         sprintf (rc, "[--%s]", register_string);
         break;

      case P_OR_Q_REGISTER_PRE_INCREMENT:
         rc = (char * )malloc (strlen (register_string) + strlen ("[++]") + 1);
         sprintf (rc, "[++%s]", register_string);
         break;

      default :
         *err = TRUE;

         rc = (char *) malloc (strlen ("") + 1);
         strcpy (rc, "");
         break;
   } /* switch (mode) */

   return rc;
} /* char * pic30_generate_p_or_q_operand(long, long, unsigned char *) */

/******************************************************************************/

unsigned long
pic30_insert_p_src_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the PPP SSSS encoding into the instruction.
 *
 ******************************************************************************/

{   long int mode = pic30_get_p_or_q_mode_value (operand_value->type,
                                                          error_msg);
    if (((insn & 0xFF8050) == 0x030010) || ((insn & 0xFF8050) == 0x038010)){
     if ((mode != P_OR_Q_REGISTER_INDIRECT) &&
         (mode != P_OR_Q_REGISTER_POST_INCREMENT)){
       if (!(*error_msg)) {
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "ldslv & vfslv source address mode is "
                             "constrained to indirect and indirect "
                             "with post increment.\n");
       }
      return insn;
     }
   }

   else if (((insn & 0xFF0000) == 0xDB0000) || ((insn & 0xFF0000) == 0xdc0000)){
     if ((mode == P_OR_Q_REGISTER_DIRECT) && (operand_value->value % 2)) {
       if (!(*error_msg)) {
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "lac.d & sac.d should have even register number "
                             "when in direct addressing mode ");
       }
       return insn;
     }
   }

   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn,
                             pic30_get_p_or_q_mode_value (operand_value->type,
                                                          error_msg),
                             PIC30_ADDRESSING_MODE_BITS, PIC30_SRC_MODE_SHIFT);

   return insn;
} /* unsigned long pic30_insert_p_src_reg(...) */

/******************************************************************************/

char *
pic30_extract_p_src_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will extract the PPP SSSS operand from the instruction.
 *
 ******************************************************************************/

{
   long reg_num = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   long mode = PIC30_EXTRACT_OPERAND (insn, PIC30_ADDRESSING_MODE_BITS,
                                      PIC30_SRC_MODE_SHIFT);

   record_private_data(info, reg_num, mode);
   return pic30_generate_p_or_q_operand (reg_num, mode, err);
} /* char * pic30_extract_p_src_reg(...) */

/******************************************************************************/

unsigned long
pic30_insert_q_dst_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the QQQ DDDD encoding into the instruction.
 *
 ******************************************************************************/

{
   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn,
                             pic30_get_p_or_q_mode_value (operand_value->type,
                                                          error_msg),
                             PIC30_ADDRESSING_MODE_BITS, PIC30_DST_MODE_SHIFT);

   return insn;
} /* unsigned long pic30_insert_q_dst_reg(...) */

/******************************************************************************/

char *
pic30_extract_q_dst_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will extract the QQQ DDDD operand from the instruction.
 *
 ******************************************************************************/

{
   long reg_num = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   long mode = PIC30_EXTRACT_OPERAND (insn, PIC30_ADDRESSING_MODE_BITS,
                                      PIC30_DST_MODE_SHIFT);

   record_private_data(info, reg_num, mode);
   return pic30_generate_p_or_q_operand (reg_num, mode, err);
} /* char * pic30_extract_q_dst_reg(...) */

unsigned long
pic30_insert_sacd_dst_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the QQQ DDDD encoding into the instruction 
 *   in the style of sac.d.
 *
 ******************************************************************************/

{
   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn,
                             pic30_get_p_or_q_mode_value (operand_value->type,
                                                          error_msg),
                             PIC30_ADDRESSING_MODE_BITS, PIC30_DST_MODE_SHIFT);

   return insn;
} /* unsigned long pic30_insert_q_dst_reg(...) */

/******************************************************************************/

char *
pic30_extract_sacd_dst_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err;

/******************************************************************************
 *
 *   This function will extract the QQQ DDDD operand from the instruction
 *   in the style of sac.d.
 *
 ******************************************************************************/

{
   long reg_num = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   long mode = PIC30_EXTRACT_OPERAND (insn, PIC30_ADDRESSING_MODE_BITS,
                                      PIC30_DST_MODE_SHIFT);

   record_private_data(info, reg_num, mode);
   return pic30_generate_p_or_q_operand (reg_num, mode, err);
} /* char * pic30_extract_q_dst_reg(...) */

/******************************************************************************/

unsigned long
pic30_insert_lo_reg (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function inserts an operand in the form [Wn+Slit10] into the
 *   instruction.  NOTE:  The Slit10 is encoded in three separate pieces.
 *
 ******************************************************************************/

{
   const long LO1_MASK = 0x0007;
   const long LO2_MASK = 0x0038;
   const long LO3_MASK = 0x03C0;

   const long LO1_BITS = 3;
   const long LO2_BITS = 3;
   const long LO3_BITS = 4;

   const long LO1_SHIFT = 4;
   const long LO2_SHIFT = 11;
   const long LO3_SHIFT = 15;

   unsigned long lo1 = (operand_value->optional_value & LO1_MASK);
   unsigned long lo2 = (operand_value->optional_value & LO2_MASK) >> 3;
   unsigned long lo3 = (operand_value->optional_value & LO3_MASK) >> 6;

   insn = PIC30_ADD_OPERAND (insn, operand_value->value,
                             opnd->bits, opnd->shift);

   insn = PIC30_ADD_OPERAND (insn, lo1, LO1_BITS, LO1_SHIFT);
   insn = PIC30_ADD_OPERAND (insn, lo2, LO2_BITS, LO2_SHIFT);
   insn = PIC30_ADD_OPERAND (insn, lo3, LO3_BITS, LO3_SHIFT);

   return insn;
} /* unsigned long pic30_insert_lo_src_reg(...) */

/******************************************************************************/

char *
pic30_extract_lo_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function extracts an operand in the form [Wn+Slit10] into the
 *   instruction.  NOTE:  The Slit10 is encoded in three separate pieces.
 *
 ******************************************************************************/

{
   const long LO1_BITS = 3;
   const long LO2_BITS = 3;
   const long LO3_BITS = 4;

   const long LO1_SHIFT = 4;
   const long LO2_SHIFT = 11;
   const long LO3_SHIFT = 15;

   long reg_num = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   const char * register_string = pic30_registers[reg_num];

   const long STRING_LENGTH = strlen (register_string)
                            + strlen ("[+]")
                            + BASE_10_STRING_LENGTH
                            + 1;

   long lo1 = PIC30_EXTRACT_OPERAND (insn, LO1_BITS, LO1_SHIFT);
   long lo2 = PIC30_EXTRACT_OPERAND (insn, LO2_BITS, LO2_SHIFT);
   long lo3 = PIC30_EXTRACT_OPERAND (insn, LO3_BITS, LO3_SHIFT);

   long literal_offset = (lo3 << 6)
                       | (lo2 << 3)
                       | (lo1 << 0);

   char * rc = (char *) malloc (STRING_LENGTH);

   /* Sign-extend the result if literal is negative. */
   if (literal_offset & 0x200)
      literal_offset |= ~((1 << (10)) - 1);

   /*
    * Undo the change that the assembler made to convert the byte offset to
    * a word offset.
    */
   if (flags & F_WORD)
      literal_offset *= 2;

   /*
    * The result should contain a plus sign if positive literal offset;
    * otherwise, let the negative sign for the literal offset act as the
    * operator.
    */
   sprintf(rc, "[%s%s%ld]", register_string,
                            ((literal_offset >= 0) ? "+" : ""),
                            literal_offset);

   record_private_data(info, reg_num, G_OR_H_REGISTER_WITH_DISPLACEMENT);
   return rc;
}

/******************************************************************************/

unsigned char
pic30_match_even (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the operand value is even.
 *
 ******************************************************************************/

{
   return PIC30_IS_EVEN (check->value);
} /* unsigned char pic30_match_even(...) */

/******************************************************************************/

unsigned char
pic30_match_even_not_14 (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the operand value is even and not 14.
 *    (used for testing the destination of MUL instructions)
 *
 ******************************************************************************/

{
   return (PIC30_IS_EVEN (check->value) && (check->value != 14));
} /* unsigned char pic30_match_even_not_14(...) */

/******************************************************************************/unsigned char
pic30_match_div_src_reg (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This operand ensures that the operand value (register number) is between
 *   1 and 15, inclusive.
 *
 ******************************************************************************/

{
   return ((check->value >=1) && (check->value <= 15));
} /* unsigned char pic30_match_div_src_reg(...) */

/******************************************************************************/unsigned char
pic30_match_dividend16_reg_2 (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This operand ensures that the operand value (register number) is between
 *   0 and 14 inclusive.
 *
 ******************************************************************************/

{
   return ((check->value >=0) && (check->value <= 14));
} /* unsigned char pic30_match_div_src_reg(...) */



/******************************************************************************/

unsigned char
pic30_match_file_reg_byte (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is able to fit in
 *   a 13-bit file register.
 *
 ******************************************************************************/

{
   return (PIC30_IS_13_BIT_FILE_REG (check->value));
} /* unsigned char pic30_match_file_reg_byte(...) */

/******************************************************************************/
unsigned char
pic30_match_file_reg (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is able to fit in
 *   a 13-bit file register and that it is an even value.
 *
 ******************************************************************************/

{
   return ((PIC30_IS_13_BIT_FILE_REG (check->value)) &&
           (PIC30_IS_EVEN (check->value)));
} /* unsigned char pic30_match_file_reg(...) */


unsigned char
pic30_match_page_reg (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is able to fit in
 *   a 13-bit file register and that it is an even value.
 *
 ******************************************************************************/

{ int i;

  for (i = 0; pic30_page_registers[i]; i++) {
    if (strcmp(pic30_page_registers[i], check->value) == 0) return 1;
  }
  return 0;
} 

/******************************************************************************/

unsigned char
pic30_match_file_reg_word (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is able to fit in
 *   a 16-bit file register and that it is an even value.
 *
 ******************************************************************************/

{
   return ((PIC30_IS_16_BIT_UNSIGNED_LITERAL (check->value)) &&
           (PIC30_IS_EVEN (check->value)));
} /* unsigned char pic30_match_file_reg_word(...) */

/******************************************************************************/

unsigned char
pic30_match_byte_10bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function is used for byte instructions.  It ensures that the operand
 *   value is a able to fit in the given 8-bits.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_BYTE_VALUE (check->value)));
} /* unsigned char pic30_match_byte_10bit_lit(...) */

/******************************************************************************/unsigned char
pic30_match_byte_8bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function is used for byte instructions.  It ensures that the operand
 *   value is a able to fit in the given 8-bits.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_BYTE_VALUE_UNSIGNED (check->value)));
} /* unsigned char pic30_match_byte_10bit_lit(...) */

/******************************************************************************/

char *
pic30_extract_byte_10bit_lit (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function is used to extract the 10-bit literal for byte instructions.
 *
 ******************************************************************************/

{
   long lit = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   char * rc;

   lit = (lit & 0xFF);
 
   rc = (char *) malloc (1 + BASE_10_STRING_LENGTH + 1);
   sprintf (rc, "#0x%lx", lit);

   record_private_data(info, lit, -1*OPND_CONSTANT);
   return rc;
} /* char * pic30_extract_byte_10bit_lit(...) */

/******************************************************************************/char *
pic30_extract_byte_cp_8bit_lit (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

{
   long  lit = PIC30_EXTRACT_OPERAND (insn, 10, opnd->shift);
   long lit1;
   char * rc;

   lit = (lit & 0x3FF);
   lit1 = (lit & 0x380);
   lit1 =(lit1 >> 2);
   lit = (lit1 | (lit & 0x1F));

   rc = (char *) malloc (1 + BASE_10_STRING_LENGTH + 1);
   sprintf (rc, "#0x%lx", lit);

   record_private_data(info, lit, -1*OPND_CONSTANT);
   return rc;
}
/******************************************************************************/char *
pic30_extract_page_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

{
   long  lit = PIC30_EXTRACT_OPERAND (insn, 2, opnd->shift);
   char * rc;

   rc = (char *) malloc (1 + strlen(pic30_page_registers[lit]) + 1);
   sprintf (rc, "%s", pic30_page_registers[lit]);

   record_private_data(info, lit, -1*OPND_PAGE_SYMBOL);
   return rc;
}

/******************************************************************************/char *
pic30_extract_wmul_dst_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

{
   long  lit = PIC30_EXTRACT_OPERAND (insn, 3, opnd->shift);
   char * rc;

   rc = (char *) malloc (1 + strlen(pic30_registers[lit*2]) + 1);
   sprintf (rc, "%s",  pic30_registers[lit*2]);
  
   record_private_data(info, lit *2, P_OR_Q_REGISTER_DIRECT);
   return rc;
}



/******************************************************************************
 *
 *   This function ensures that the given operand value is a 10-bit literal.
 *
 ******************************************************************************/unsigned char
pic30_match_10bit_lit (check)
   const struct pic30_operand_value * check;
{
   return ((check->modifier != PIC30_NO_MODIFIER_FOUND) ||
           (PIC30_IS_10_BIT_UNSIGNED_LITERAL(check->value)));
} /* unsigned char pic30_match_10bit_lit(...) */

/******************************************************************************/

char *
pic30_extract_w_reg (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags;
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This instruction is used for those instructions that utilize the default
 *   WREG.  It will extract WREG if the D bit is 0.
 *
 ******************************************************************************/

{
   long w_reg_flag = 1;
   char * rc = malloc (strlen (PIC30_W_REGISTER_STRING) + 1);

   if (flags & F_HAS_REQUIRED_WREG)
      strcpy (rc, PIC30_W_REGISTER_STRING);
   else
   {
      w_reg_flag =
         PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

      if (!w_reg_flag)
         strcpy (rc, PIC30_W_REGISTER_STRING);
      else
         strcpy (rc, "");
   } /* else */

   if (w_reg_flag) record_private_data(info, 0, -1*OPND_W_REGISTER_DIRECT);
   return rc;
} /* char * pic30_extract_w_reg(...) */

/******************************************************************************/

unsigned char
pic30_match_16bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is a 16-bit literal.
 *
 ******************************************************************************/

{
   return ((check->modifier != PIC30_NO_MODIFIER_FOUND) ||
           (PIC30_IS_16_BIT_LITERAL (check->value)));
} /* unsigned char pic30_match_16bit_lit(...) */

/******************************************************************************/

unsigned char
pic30_match_unsigned_short_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is a 5-bit unsigned
 *   literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_5_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_unsigned_short_lit(...) */

/******************************************************************************/

unsigned char
pic30_match_3bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is a 3-bit value.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_3_BIT_LITERAL (check->value)));
} /* unsigned char pic30_match_3bit_lit(...) */

/******************************************************************************/


/******************************************************************************
 *
 *   This function ensures that the given operand value is a 4-bit unsigned
 *   literal value. The 4-bit value will be encoded as a 3-bit value.
 *
 ******************************************************************************/
unsigned char
pic30_match_34bit_lit (check)
   const struct pic30_operand_value * check;
{
   unsigned char rc;

   rc = ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
         (PIC30_IS_4_BIT_UNSIGNED_LITERAL (check->value)));

   return(rc);
} /* unsigned char pic30_match_34bit_lit(...) */

/******************************************************************************
 *
 *   This function will insert the +1 encoding into the bit manipulation
 *   instructions in the case that the bit number is greater than seven.
 *
 ******************************************************************************/
unsigned long
pic30_insert_34bit_lit (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

{
   insn = PIC30_ADD_OPERAND(insn, operand_value->value,
                                  opnd->bits, opnd->shift);
   if (operand_value->value > 7)
   {
     /* insert 1 into the 13-bit file register address field */
      insn = PIC30_ADD_OPERAND(insn, 1, 13, 0);
   }
   return(insn);
} /* unsigned long pic30_insert_34bit_lit(...) */

/******************************************************************************/
unsigned long
pic30_insert_byte_cp_8bit_lit (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
     const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

{
  long lit;
  long lit1;

  lit = operand_value->value;
  lit1=(lit & 0xE0) << 2;
  lit = lit1 | (lit & 0x1F);
  
  insn = PIC30_ADD_OPERAND(insn, lit, 10, 0);
   
  return(insn);
}

/******************************************************************************/
/******************************************************************************/
unsigned long
pic30_insert_byte_l_operand (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
     const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg __attribute__ ((__unused__));

{
  long lit;
  long lit1;
  long lit2;

  lit1 = operand_value->value;
  lit2 = lit1 + 0x01;
  lit2 = ( lit2 << 11 );
  lit = lit1 | lit2;
  
  insn = PIC30_ADD_OPERAND(insn, lit, 15, 0);
   
  return(insn);
}

/******************************************************************************/
unsigned char
pic30_match_nibble (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is a 4-bit unsigned
 *   literal value.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_4_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_nibble(...) */

/******************************************************************************/

/* for communication to pic30-dis.c */
extern bfd_vma pic30_disassembly_address;

char *
pic30_extract_offset (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags;
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function will extract a PC-relative offset from the instruction.
 *
 ******************************************************************************/
{
   long offset = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   unsigned int len = 80;
   char * rc = (char *) malloc (len);

   /* Sign-extend the result if offset is negative. */
   if (opnd->bits == 16) {
     if (offset & 0x8000)
        offset |= ~((1 << (16)) - 1);
   } else if (opnd->bits == 6) {
     if (offset & 0x20)
        offset |= ~((1 << (6)) - 1);
   } /* else error message */

   offset = (offset + 1) * 2;
   info->target =  offset + (signed long) pic30_disassembly_address;

   if (flags & F_IS_2_WORD_INSN)
     info->target += 2;  /* display correct target for DO instr */

   if (offset) {  /* Find a symbol name if possible  */
     long min = 0;
     long max = info->num_symbols;
     long thisplace;
     bfd_boolean sym_found = FALSE;
     asymbol *sym = 0;
     bfd_vma try;     
     int i;

     /* Perform a binary search of the range (min, max).  */
     if (info->num_symbols > 0) {
       for (i = 0; i < info->num_symbols; i++) {
         sym = info->symbols[i];
         try = bfd_asymbol_value (sym);
         if ((try == info->target) &&
               PIC30_DISPLAY_AS_PROGRAM_MEMORY(sym->section)) {
           sym_found = TRUE;
           break;
         }
        }
        sprintf(rc, "0x%lx", info->target);
        if (sym_found) {
          int y = 0;
          for (y = i; y < info->num_symbols; y++) {
            sym = info->symbols[y];
            try = bfd_asymbol_value (sym);
            if (try == info->target) {
              if (strlen(rc) + strlen(bfd_asymbol_name(sym)) + 4 > len) {
                rc = realloc(rc,len+256);
                len = len + 256;
              }
              strcat(rc, " <");
              strcat(rc, bfd_asymbol_name(sym));
              strcat(rc, ">");
            } else break;
           }
        }
      }
   }
   else
     sprintf(rc, ".");

   record_private_data(info, offset, -1*OPND_CONSTANT);
   return rc;
} /* char * pic30_extract_offset(...) */

/******************************************************************************/

char *
pic30_extract_branch_on_dsp_condition_operand (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function will extract a BRA instruction's DSP condition code.
 *
 ******************************************************************************/

{
   long condition_code =
      PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   char * rc = (char *) malloc (PIC30_MAX_CONDITION_CODE_LENGTH + 1);

   switch (condition_code)
   {
      case PIC30_BRANCH_ON_ACCUMULATOR_A_OVERFLOW :
         strcpy (rc, "OA");
         break;

      case PIC30_BRANCH_ON_ACCUMULATOR_B_OVERFLOW :
         strcpy (rc, "OB");
         break;

      case PIC30_BRANCH_ON_ACCUMULATOR_A_SATURATION :
         strcpy (rc, "SA");
         break;

      case PIC30_BRANCH_ON_ACCUMULATOR_B_SATURATION :
         strcpy (rc, "SB");
         break;

      default:
         strcpy (rc, "");
         break;
   } /* switch (condition_code) */

   record_private_data(info, condition_code, -1*OPND_BRANCH_ON_DSP_CONDITION);
   return rc;
} /* char * pic30_extract_branch_on_dsp_condition_operand(...) */

/******************************************************************************/

char *
pic30_extract_branch_on_condition_operand (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function will extract a BRA instruction's MCU condition code.
 *
 ******************************************************************************/

{
   long condition_code =
      PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   char * rc = (char *) malloc (PIC30_MAX_CONDITION_CODE_LENGTH + 1);

   switch (condition_code)
   {
      case PIC30_BRANCH_ON_OVERFLOW :
         strcpy (rc, "OV");
         break;

      case PIC30_BRANCH_ON_CARRY :
         strcpy (rc, "C");
         break;

      case PIC30_BRANCH_ON_ZERO :
         strcpy (rc, "Z");
         break;

      case PIC30_BRANCH_ON_NEGATIVE :
         strcpy (rc, "N");
         break;

      case PIC30_BRANCH_ON_GREATER_OR_EQUAL :
         strcpy (rc, "GE");
         break;

      case PIC30_BRANCH_ON_LESS_THAN :
         strcpy (rc, "LT");
         break;

      case PIC30_BRANCH_ON_GREATER_THAN :
         strcpy (rc, "GT");
         break;

      case PIC30_BRANCH_ON_LESS_OR_EQUAL :
         strcpy (rc, "LE");
         break;

      case PIC30_BRANCH_ON_NOT_OVERFLOW :
         strcpy (rc, "NOV");
         break;

      case PIC30_BRANCH_ON_NOT_CARRY :
         strcpy (rc, "NC");
         break;

      case PIC30_BRANCH_ON_NOT_ZERO :
         strcpy (rc, "NZ");
         break;

      case PIC30_BRANCH_ON_NOT_NEGATIVE :
         strcpy (rc, "NN");
         break;

      case PIC30_BRANCH_ON_GREATER_THAN_UNSIGNED :
         strcpy (rc, "GTU");
         break;

      case PIC30_BRANCH_ON_LESS_OR_EQUAL_UNSIGNED :
         strcpy (rc, "LEU");
         break;

      default:
         strcpy (rc, "");
         break;
   } /* switch (condition_code) */

   record_private_data(info, condition_code, -1*OPND_BRANCH_ON_CONDITION);
   return rc;
} /* char * pic30_extract_branch_on_condition_operand(...) */

/******************************************************************************/

unsigned char
pic30_match_unsigned_14bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is an unsigned 14-bit
 *   literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_14_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_unsigned_14bit_lit(...) */

/******************************************************************************/
unsigned char
pic30_match_unsigned_15bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is an unsigned 15-bit
 *   literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_15_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_unsigned_15bit_lit(...) */

/******************************************************************************/
unsigned char
pic30_match_unsigned_3bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is an unsigned 3-bit
 *   literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_3_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_unsigned_3bit_lit(...) */

/******************************************************************************/
unsigned char
pic30_match_unsigned_2bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is an unsigned 2-bit
 *   literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_2_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_unsigned_3bit_lit(...) */

/******************************************************************************/
unsigned char
pic30_match_frame_size (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is allowed for the
 *   LNK instruction.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_14_BIT_UNSIGNED_LITERAL (check->value)) &&
           (PIC30_IS_EVEN (check->value)));
} /* unsigned char pic30_match_frame_size(...) */

/******************************************************************************/

unsigned char
pic30_match_16bit_unsigned_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is an unsigned 16-bit
 *   literal.
 *
 ******************************************************************************/

{
   return ((check->modifier != PIC30_NO_MODIFIER_FOUND) ||
           (PIC30_IS_16_BIT_UNSIGNED_LITERAL (check->value)));
} /* unsigned char pic30_match_16bit_unsigned_lit(...) */

/******************************************************************************/

char *
pic30_extract_dsp_accumulator_select (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function will extract the accumulator from the instructions A bit.
 *
 ******************************************************************************/

{
   char * rc = malloc (PIC30_MAX_DSP_ACCUMULATOR_LENGTH + 1);
   long dsp_accumulator = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   if (dsp_accumulator == PIC30_DSP_ACCUMULATOR_A)
      strcpy (rc, PIC30_DSP_ACCUMULATOR_A_STRING);
   else if (dsp_accumulator == PIC30_DSP_ACCUMULATOR_B)
      strcpy (rc, PIC30_DSP_ACCUMULATOR_B_STRING);
   else
      strcpy (rc, "");

   record_private_data(info, dsp_accumulator, -1*OPND_DSP_ACCUMULATOR_SELECT);
   return rc;
} /* char * pic30_extract_dsp_accumulator_select(...) */

/******************************************************************************/
unsigned char
pic30_match_4bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function will ensure that the given operand value is a 4-bit literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_4_BIT_LITERAL (check->value)));
} /* unsigned char pic30_match_4bit_lit(...) */

/******************************************************************************/

unsigned char
pic30_match_short_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function will ensure that the given operand value is a 5-bit literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_5_BIT_LITERAL (check->value)));
} /* unsigned char pic30_match_short_lit(...) */

/******************************************************************************/

unsigned char
pic30_match_6bit_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function will ensure that the given operand value is a 6-bit literal.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_DSP6_BIT_LITERAL (check->value)));
} /* unsigned char pic30_match_6bit_lit(...) */

/******************************************************************************/

unsigned char
pic30_match_wid5_lit (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 * This function will ensure that the given operand value is belongs to [1, 16].
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_WID5_LITERAL (check->value)));
} /* unsigned char pic30_match_wid5_lit(...) */

/******************************************************************************/

unsigned char
pic30_match_dsp_writeback (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This operand ensures that the operand value is valid for a DSP writeback
 *   operand.
 *
 ******************************************************************************/

{
   unsigned char rc = TRUE;

   switch (check->type)
   {
      case OPND_REGISTER_POST_INCREMENT_BY_N:
         rc = (check->optional_value == 2);
         /* Want to fall through to next case.  No break. */

      case OPND_REGISTER_DIRECT:
         rc &= (check->value == PIC30_DSP_WRITEBACK_REGISTER_NUMBER);
         break;

      default:
         rc = FALSE;
         break;
   } /* switch (check->type) */

   return rc;
} /* unsigned char pic30_match_dsp_writeback(...) */

/******************************************************************************/

unsigned long
pic30_insert_dsp_writeback (insn, flags, opnd, operand_value, error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the DSP writeback operand into the instruction.
 *
 ******************************************************************************/

{
   unsigned short writeback = 0;

   switch (operand_value->type)
   {
      case OPND_REGISTER_DIRECT:
         writeback = PIC30_DSP_WRITEBACK_DIRECT;
         break;

      case OPND_REGISTER_POST_INCREMENT_BY_N:
         writeback = PIC30_DSP_WRITEBACK_POST_INCREMENT_BY_N;
         break;

      default:
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "pic30_insert_dsp_writeback called with an "
                             "invalid operand type");
         break;
   } /* switch (check->type) */

   insn = PIC30_ADD_OPERAND (insn, writeback, opnd->bits, opnd->shift);

   return insn;
} /* unsigned long pic30_insert_dsp_writeback(...) */


/******************************************************************************/

char *
pic30_extract_dsp_writeback (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function extracts the DSP writeback operand from an instruction.
 *
 ******************************************************************************/

{
   char * rc = malloc (PIC30_MAX_DSP_WRITEBACK_LENGTH + 1);
   long writeback = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   switch (writeback)
   {
      case PIC30_DSP_WRITEBACK_DIRECT:
         sprintf (rc, "w%d", PIC30_DSP_WRITEBACK_REGISTER_NUMBER);
         break;

      case PIC30_DSP_WRITEBACK_POST_INCREMENT_BY_N:
         sprintf (rc, "[w%d]+=2", PIC30_DSP_WRITEBACK_REGISTER_NUMBER);
         break;

      case 2:
         strcpy (rc, "");
         break;

      case 3:
         strcpy (rc, "???");
         break;

      default:
         strcpy (rc, "");
         break;
   } /* switch (writeback) */

   record_private_data(info, writeback, -1*OPND_UNKNOWN);
   return rc;
} /* char * pic30_extract_dsp_writeback(...) */

/******************************************************************************/

unsigned char
pic30_match_dsp_x_prefetch_operation (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the operand value is valid for a DSP X-space
 *   prefetch.
 *
 ******************************************************************************/

{
   unsigned char rc = FALSE;

   switch (check->type)
   {
      case OPND_REGISTER_INDIRECT:
         if ((check->value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ||
             (check->value == PIC30_X_PREFETCH_MAC2_REGISTER_VALUE))
            rc = TRUE;

         break;

      case OPND_REGISTER_POST_INCREMENT_BY_N:
      case OPND_REGISTER_POST_DECREMENT_BY_N:
         if (((check->value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ||
              (check->value == PIC30_X_PREFETCH_MAC2_REGISTER_VALUE)) &&
             ((check->optional_value == -2) ||
              (check->optional_value == -4) ||
              (check->optional_value == -6) ||
              (check->optional_value == 2)  ||
              (check->optional_value == 4)  ||
              (check->optional_value == 6)))
            rc = TRUE;

         break;

      case OPND_REGISTER_WITH_DISPLACEMENT:
         if ((check->value == PIC30_X_PREFETCH_MAC2_REGISTER_VALUE) &&
             (check->optional_value ==
              PIC30_DSP_PREFETCH_DISPLACEMENT_REGISTER_VALUE))
            rc = TRUE;

         break;

      default:
         break;
   } /* switch (check_expression->expr.X_op) */

   return rc;
} /* unsigned char pic30_match_dsp_x_prefetch_operation(...) */

/******************************************************************************/

unsigned long
pic30_insert_dsp_x_prefetch_operation (insn, flags, opnd, operand_value,
                                       error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function inserts the DSP X-space prefetch operation into the
 *   instruction.
 *
 ******************************************************************************/

{
   long register_value = operand_value->value;
   long dsp_operation = PIC30_DSP_X_PREFETCH_OPERATION_NO_PREFETCH;

   switch (operand_value->type)
   {
      case OPND_REGISTER_INDIRECT:
         dsp_operation =
            (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
            PIC30_DSP_X_PREFETCH_OPERATION_MAC1_INDIRECT             :
            PIC30_DSP_X_PREFETCH_OPERATION_MAC2_INDIRECT;

         break;

      case OPND_REGISTER_POST_INCREMENT_BY_N:
         switch (operand_value->optional_value)
         {
            case 2:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS2                :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS2;

               break;

            case 4:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS4                :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS4;

               break;

            case 6:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS6                :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS6;

               break;

            case -2:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS2               :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS2;

               break;


            case -4:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS4               :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS4;

               break;

            case -6:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS6               :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS6;

               break;

            default:
               *error_msg = (char *) malloc (BUFSIZ);
               strcpy (*error_msg, "pic30_insert_dsp_x_prefetch_operation "
                                   "called with an invalid offset");
               break;
         } /* switch (operand_value->optional_value) */

         break;

      case OPND_REGISTER_POST_DECREMENT_BY_N:
         switch (operand_value->optional_value)
         {
            case 2:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS2               :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS2;

               break;


            case 4:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS4               :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS4;

               break;

            case 6:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS6               :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS6;

               break;

            case -2:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS2                :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS2;

               break;

            case -4:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS4                :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS4;

               break;

            case -6:
               dsp_operation =
                  (register_value == PIC30_X_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS6                :
                  PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS6;

               break;

            default:
               *error_msg = (char *) malloc (BUFSIZ);
               strcpy (*error_msg, "Internal error:  "
                                   "pic30_insert_dsp_x_prefetch_operation "
                                   "called with an invalid offset");
               break;
         } /* switch (operand_value->optional_value) */

         break;

      case OPND_REGISTER_WITH_DISPLACEMENT:
         dsp_operation = PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS_REG;
         break;

      default:
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "pic30_insert_dsp_x_prefetch_operation "
                             "called with an invalid operand type");
         break;
   } /* switch (operand_value->type) */

   insn = PIC30_ADD_OPERAND (insn, dsp_operation, opnd->bits, opnd->shift);

   return insn;
} /* unsigned long pic30_insert_dsp_x_prefetch_operation (...) */

/******************************************************************************/unsigned long
pic30_insert_page_reg (insn, flags, opnd, operand_value,
                                       error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;
{

  int i;

  for (i = 0; pic30_page_registers[i]; i++) {
    if (strcmp(pic30_page_registers[i], operand_value->value) == 0) {
      break;
    }
  }
  i = i << 10;
  
  insn = PIC30_ADD_OPERAND(insn, i, 12, 0);
   
  return(insn);
}

/******************************************************************************/unsigned long
pic30_insert_wmul_dst_reg (insn, flags, opnd, operand_value,
                                       error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;
{

  int i = operand_value->value;

  
  i = i << 7;
  
  insn = PIC30_ADD_OPERAND(insn, i, 11, 0);
   
  return(insn);
} 

/******************************************************************************/
char *
pic30_extract_dsp_x_prefetch_operation (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function extracts the DSP X-space prefetch operation from an
 *   instruction.
 *
 ******************************************************************************/

{
   char * rc = malloc (PIC30_MAX_DSP_X_PREFETCH_OPERATION_LENGTH + 1);
   long operation = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   switch (operation)
   {
      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_INDIRECT:
         sprintf (rc, "[%s]", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS2:
         sprintf (rc, "[%s]+=2", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS4:
         sprintf (rc, "[%s]+=4", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_PLUS6:
         sprintf (rc, "[%s]+=6", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS2:
         sprintf (rc, "[%s]-=2", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS4:
         sprintf (rc, "[%s]-=4", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC1_MINUS6:
         sprintf (rc, "[%s]-=6", PIC30_X_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_INDIRECT:
         sprintf (rc, "[%s]", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS2:
         sprintf (rc, "[%s]+=2", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS4:
         sprintf (rc, "[%s]+=4", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS6:
         sprintf (rc, "[%s]+=6", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS2:
         sprintf (rc, "[%s]-=2", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_PLUS_REG:
         sprintf (rc, "[%s+%s]", PIC30_X_PREFETCH_MAC2_REGISTER,
                                 PIC30_DSP_PREFETCH_DISPLACEMENT_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS4:
         sprintf (rc, "[%s]-=4", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_X_PREFETCH_OPERATION_MAC2_MINUS6:
         sprintf (rc, "[%s]-=6", PIC30_X_PREFETCH_MAC2_REGISTER);
         break;

      default:
         strcpy (rc, "");
         break;
   } /* switch (operation) */

   record_private_data(info, operation, -1*OPND_UNKNOWN);
   return rc;
} /* char * pic30_extract_dsp_x_prefetch_operation(...) */

/******************************************************************************/

unsigned char
pic30_match_dsp_prefetch_dst (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given oeprand value is a valid DSP prefetch
 *   destination.
 *
 ******************************************************************************/

{
   unsigned char rc = FALSE;

   switch (check->type)
   {
      case OPND_REGISTER_DIRECT:
         if ((check->value >= PIC30_MIN_DSP_PREFETCH_DST_REGISTER_VALUE) &&
             (check->value <= PIC30_MAX_DSP_PREFETCH_DST_REGISTER_VALUE))
            rc = TRUE;

      default:
         break;
   } /* switch (check->type) */

   return rc;
} /* unsigned char pic30_match_dsp_prefetch_dst(...) */

/******************************************************************************/

char *
pic30_extract_dsp_prefetch_dst (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function extracts a DSP prefetch destination from the instruction.
 *
 ******************************************************************************/

{
   char * rc = malloc (PIC30_MAX_REGISTER_LENGTH + 1);
   long which_register = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   /*
    * Add the minimum register number.  This is done because the register
    * first DSP prefetch destination register is encoded as 0.
    */
   which_register += PIC30_MIN_DSP_PREFETCH_DST_REGISTER_VALUE;

   strcpy(rc, pic30_registers[which_register]);

   record_private_data(info, which_register, -1*OPND_REGISTER_DIRECT);
   return rc;
} /* char * pic30_extract_dsp_x_prefetch_operation(...) */

/******************************************************************************/

unsigned char
pic30_match_dsp_y_prefetch_operation (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is a DSP Y-space
 *   prefetch operation.
 *
 ******************************************************************************/

{
   unsigned char rc = FALSE;

   switch (check->type)
   {
      case OPND_REGISTER_INDIRECT:
         if ((check->value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ||
             (check->value == PIC30_Y_PREFETCH_MAC2_REGISTER_VALUE))
            rc = TRUE;

         break;

      case OPND_REGISTER_POST_INCREMENT_BY_N:
      case OPND_REGISTER_POST_DECREMENT_BY_N:
         if (((check->value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ||
              (check->value == PIC30_Y_PREFETCH_MAC2_REGISTER_VALUE)) &&
             ((check->optional_value == -2) ||
              (check->optional_value == -4) ||
              (check->optional_value == -6) ||
              (check->optional_value == 2)  ||
              (check->optional_value == 4)  ||
              (check->optional_value == 6)))
            rc = TRUE;

         break;

      case OPND_REGISTER_WITH_DISPLACEMENT:
         if ((check->value == PIC30_Y_PREFETCH_MAC2_REGISTER_VALUE) &&
             (check->optional_value ==
              PIC30_DSP_PREFETCH_DISPLACEMENT_REGISTER_VALUE))
            rc = TRUE;

         break;

      default:
         break;
   } /* switch (check_expression->expr.X_op) */

   return rc;
} /* unsigned char pic30_match_dsp_y_prefetch_operation(...) */

/******************************************************************************/

unsigned long
pic30_insert_dsp_y_prefetch_operation (insn, flags, opnd, operand_value,
                                       error_msg)
   unsigned long insn;
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   const struct pic30_operand_value * operand_value;
   char **error_msg;

/******************************************************************************
 *
 *   This function will insert the DSP Y-space prefetch operation into the
 *   given instruction.
 *
 ******************************************************************************/

{
   long register_value = operand_value->value;
   long dsp_operation = PIC30_DSP_Y_PREFETCH_OPERATION_NO_PREFETCH;

   switch (operand_value->type)
   {
      case OPND_REGISTER_INDIRECT:
         dsp_operation =
            (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
            PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_INDIRECT             :
            PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_INDIRECT;

         break;

      case OPND_REGISTER_POST_INCREMENT_BY_N:
         switch (operand_value->optional_value)
         {
            case 2:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS2                :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS2;

               break;

            case 4:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS4                :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS4;

               break;

            case 6:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS6                :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS6;

               break;

            case -2:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS2               :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS2;

               break;


            case -4:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS4               :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS4;

               break;

            case -6:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS6               :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS6;

               break;

            default:
               *error_msg = (char *) malloc (BUFSIZ);
               strcpy (*error_msg, "pic30_insert_dsp_y_prefetch_operation "
                                   "called with an invalid offset");
               break;
         } /* switch (operand_value->optional_value) */

         break;

      case OPND_REGISTER_POST_DECREMENT_BY_N:
         switch (operand_value->optional_value)
         {
            case 2:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS2               :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS2;

               break;


            case 4:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS4               :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS4;

               break;

            case 6:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS6               :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS6;

               break;

            case -2:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS2                :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS2;

               break;

            case -4:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS4                :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS4;

               break;

            case -6:
               dsp_operation =
                  (register_value == PIC30_Y_PREFETCH_MAC1_REGISTER_VALUE) ?
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS6                :
                  PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS6;

               break;

            default:
               *error_msg = (char *) malloc (BUFSIZ);
               strcpy (*error_msg, "pic30_insert_dsp_y_prefetch_operation "
                                   "called with an invalid offset");
               break;
         } /* switch (operand_value->optional_value) */

         break;

      case OPND_REGISTER_WITH_DISPLACEMENT:
         dsp_operation = PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS_REG;
         break;

      default:
         *error_msg = (char *) malloc (BUFSIZ);
         strcpy (*error_msg, "Internal error:  "
                             "pic30_insert_dsp_y_prefetch_operation "
                             "called with an invalid operand type");
         break;
   } /* switch (operand_value->type) */

   insn = PIC30_ADD_OPERAND (insn, dsp_operation, opnd->bits, opnd->shift);

   return insn;
} /* unsigned long pic30_insert_dsp_y_prefetch_operation (...) */

/******************************************************************************/

char *
pic30_extract_dsp_y_prefetch_operation (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function will extract the DSP Y-space prefetch operation from the
 *   given instruction.
 *
 ******************************************************************************/

{
   char * rc = malloc (PIC30_MAX_DSP_Y_PREFETCH_OPERATION_LENGTH + 1);
   long operation = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   switch (operation)
   {
      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_INDIRECT:
         sprintf (rc, "[%s]", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS2:
         sprintf (rc, "[%s]+=2", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS4:
         sprintf (rc, "[%s]+=4", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_PLUS6:
         sprintf (rc, "[%s]+=6", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS2:
         sprintf (rc, "[%s]-=2", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS4:
         sprintf (rc, "[%s]-=4", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC1_MINUS6:
         sprintf (rc, "[%s]-=6", PIC30_Y_PREFETCH_MAC1_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_INDIRECT:
         sprintf (rc, "[%s]", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS2:
         sprintf (rc, "[%s]+=2", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS4:
         sprintf (rc, "[%s]+=4", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS6:
         sprintf (rc, "[%s]+=6", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_PLUS_REG:
         sprintf (rc, "[%s+%s]", PIC30_Y_PREFETCH_MAC2_REGISTER,
                                 PIC30_DSP_PREFETCH_DISPLACEMENT_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS2:
         sprintf (rc, "[%s]-=2", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS4:
         sprintf (rc, "[%s]-=4", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      case PIC30_DSP_Y_PREFETCH_OPERATION_MAC2_MINUS6:
         sprintf (rc, "[%s]-=6", PIC30_Y_PREFETCH_MAC2_REGISTER);
         break;

      default:
         strcpy (rc, "");
         break;
   } /* switch (operation) */

   record_private_data(info, operation, -1*OPND_UNKNOWN);
   return rc;
} /* char * pic30_extract_dsp_y_prefetch_operation(...) */

/******************************************************************************/

char *
pic30_extract_dsp_multiplicand (insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function extracts the DSP multiplicand operand from the given
 *   instruction.
 *
 ******************************************************************************/

{
   char * rc = malloc (PIC30_MAX_DSP_MULTIPLICAND_LENGTH + 1);
   long multiplicand = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);

   switch (multiplicand)
   {
      case PIC30_DSP_W4_W5_MULTIPLICAND:
         strcpy (rc, PIC30_DSP_W4_W5_MULTIPLICAND_STRING);
         break;

      case PIC30_DSP_W4_W6_MULTIPLICAND:
         strcpy (rc, PIC30_DSP_W4_W6_MULTIPLICAND_STRING);
         break;

      case PIC30_DSP_W4_W7_MULTIPLICAND:
         strcpy (rc, PIC30_DSP_W4_W7_MULTIPLICAND_STRING);
         break;

      case PIC30_DSP_W5_W6_MULTIPLICAND:
         strcpy (rc, PIC30_DSP_W5_W6_MULTIPLICAND_STRING);
         break;

      case PIC30_DSP_W5_W7_MULTIPLICAND:
         strcpy (rc, PIC30_DSP_W5_W7_MULTIPLICAND_STRING);
         break;

      case PIC30_DSP_W6_W7_MULTIPLICAND:
         strcpy (rc, PIC30_DSP_W6_W7_MULTIPLICAND_STRING);
         break;

      default:
         strcpy (rc, "???");
         break;
   }
   record_private_data(info, multiplicand, -1*OPND_DSP_MULTIPLICAND);
   return rc;
} /* char * pic30_extract_dsp_multiplicand(...) */

/******************************************************************************/

char *
pic30_extract_dsp_square(insn, info, flags, opnd, err)
   unsigned long insn;
   struct disassemble_info * info __attribute__ ((__unused__));
   unsigned long flags __attribute__ ((__unused__));
   const struct pic30_operand * opnd;
   unsigned char * err __attribute__ ((__unused__));

/******************************************************************************
 *
 *   This function extracts the DSP square operand from the given instruction.
 *
 ******************************************************************************/

{
   long register_number = PIC30_EXTRACT_OPERAND (insn, opnd->bits, opnd->shift);
   char * rc = malloc(strlen("Wnn*Wnn") + 1);

   /*
    * Add the minimum register number.  This is done because the register
    * first DSP prefetch destination register is encoded as 0.
    */
   register_number += PIC30_MIN_DSP_PREFETCH_DST_REGISTER_VALUE;

   sprintf(rc, "w%ld * w%ld", register_number, register_number);

   record_private_data(info, register_number, -1*OPND_DSP_SQUARE);
   return rc;
} /* char * pic30_extract_dsp_square(...) */

/******************************************************************************/

unsigned char
pic30_match_power_save_mode (check)
   const struct pic30_operand_value * check;

/******************************************************************************
 *
 *   This function ensures that the given operand value is valid for a
 *   PWRSAV mode operand.
 *
 ******************************************************************************/

{
   return ((check->modifier == PIC30_NO_MODIFIER_FOUND) &&
           (PIC30_IS_1_BIT_LITERAL (check->value)));
} /* unsigned char pic30_match_power_save_mode(...) */

/******************************************************************************/

const struct relocation_info
pic30_get_pc_relative_relocation_info ()
{
   return pic30_relocation_info[PIC30_RELOC_INFO_PCREL_BRANCH];
} /* const struct relocation_info pic30_get_pc_relative_relocation_info(void) */

/******************************************************************************/

