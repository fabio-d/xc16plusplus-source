/* gdb->simulator interface.
   Copyright (C) 1992, 1993, 1994, 1997 Free Software Foundation, Inc.

This file is part of simpic30

simpic30 is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

simpic30 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with simpic30; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */

#ifndef SIMPIC30_TM_H
#define SIMPIC30_TM_H

#ifdef __cplusplus
extern "C" {
#endif

struct pic30_sim_state
{
  unsigned short m_cycles;
  unsigned long	m_currentTracePC;
  unsigned m_bFetchRegEmpty;
  unsigned m_bHalted;
  unsigned m_bDisassemble;
  unsigned m_bTracing;
  unsigned m_bIO;
  unsigned m_bRepeatActive;
};

typedef struct pic30_sim_state sim_state_type;
typedef unsigned int sim_phys_addr_type;

#define REG_PC 16

#ifdef __cplusplus
}
#endif

#endif
