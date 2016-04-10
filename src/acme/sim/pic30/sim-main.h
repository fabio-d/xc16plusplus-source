/*  This file is part of the program psim.

    Copyright (C) 1994-1997, Andrew Cagney <cagney@highland.com.au>
    Copyright (C) 1997, 1998, Free Software Foundation

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
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
    */


#ifndef _SIM_MAIN_H_
#define _SIM_MAIN_H_

#include "sim-basics.h"
#include "simint.h"
#include "sim-endian.h"

#define HOST_TO_TARGET(LEN, VAL) \
do { \
   void *vp = &(VAL); \
   switch (LEN) { \
      case 1: *(unsigned_1*)vp = H2T_1(*(unsigned_1*)vp); break; \
      case 2: *(unsigned_2*)vp = H2T_2(*(unsigned_2*)vp); break; \
      case 4: *(unsigned_4*)vp = H2T_4(*(unsigned_4*)vp); break; \
      case 8: *(unsigned_8*)vp = H2T_8(*(unsigned_8*)vp); break; \
      case 16: *(unsigned_16*)vp = H2T_16(*(unsigned_16*)vp); break; \
   } \
} while (0)

#define TARGET_TO_HOST(LEN, VAL) \
do { \
  switch (LEN) { \
  case 1: VAL = T2H_1(VAL); break; \
  case 2: VAL = T2H_2(VAL); break; \
  case 4: VAL = T2H_4(VAL); break; \
  case 8: VAL = T2H_8(VAL); break; \
  case 16: VAL = T2H_16(VAL); break; \
  } \
} while (0)


typedef address_word sim_cia;

#define SIM_ENGINE_HALT_HOOK(sd, cpu, cia) \
do { \
  if (cpu) /* null if ctrl-c */ \
    CIA_SET (cpu,cia); \
} while (0)

#define SIM_ENGINE_RESTART_HOOK(sd, cpu, cia) \
do { \
  CIA_SET (cpu,cia); \
} while (0)

#include "sim-base.h"


// 16 W's and 1 PC
#define PIC30_NUM_W_REGISTERS 16
#define PIC30_NUM_REGISTERS 17

#define PC_REGNO 16

struct _sim_cpu {
  /* ... Put simulator specific members here ... */
  pic30_proc proc;
  //void *program_memory;
  //void *data_memory;
  
  /* Make all the registers as big as the largest of them. (PC)
   */
  //unsigned long working_registers[PIC30_NUM_REGISTERS];

#define CIA_GET(CPU) (pic30_get_CIA((CPU)->proc))
#define CIA_SET(CPU,CIA) (pic30_set_CIA((CPU)->proc,(CIA)))
   sim_cpu_base base;
};

struct sim_state {
  sim_cpu cpu[MAX_NR_PROCESSORS];
#if (WITH_SMP)
#define STATE_CPU(sd,n) (&(sd)->cpu[n])
#else
#define STATE_CPU(sd,n) (&(sd)->cpu[0])
#endif
  /* ... Put simulator specific members here ... */

  sim_state_base base;
};

#define SIM_HANDLES_LMA 1

#endif /* _SIM_MAIN_H_ */
