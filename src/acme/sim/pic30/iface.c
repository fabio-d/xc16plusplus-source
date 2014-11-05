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


#include <assert.h>
#include "ansidecl.h"
#include "tm.h"
#include "signal.h"
#include "bfd.h"
#include "callback.h"
#include "remote-sim.h"
#include "sim-main.h"

#include "simint.h"

#ifndef NULL
#define NULL 0
#endif

/* dump lots and lots of debug info when running */
#define DEBUG_TRACE 0


int 
sim_read (SIM_DESC sd, SIM_ADDR mem, unsigned char *buf, int length)
{
  /* data memory addresses have bit 31 set */
  if (mem & 0x80000000)
    {
      return pic30_read_datamem (STATE_CPU (sd, 0)->proc, 
                                 (mem&0xffff), length, buf);
    }
  else
    {
      return pic30_read_progmem (STATE_CPU (sd, 0)->proc, mem, length, buf);
    }
}

int 
sim_write (SIM_DESC sd, SIM_ADDR mem, unsigned char *buf, int length)
{
  /* data memory addresses have bit 31 set */
  if (mem & 0x80000000)
    {
      return pic30_write_datamem (STATE_CPU (sd, 0)->proc, 
                                 (mem&0xffff), length, buf);
    }
  else
    {
      return pic30_write_progmem (STATE_CPU (sd, 0)->proc, mem, length, buf);
    }
}

void
sim_size (int n)
{
  /* Size is fixed.  */
  if (DEBUG_TRACE) printf ("enter sim_size(0x%x)\n", n);
  if (DEBUG_TRACE) printf ("exit sim_size\n");
}

int
sim_store_register (sd, regno, value, length)
     SIM_DESC sd;
     int regno;
     unsigned char *value;
     int length;
{
  int rc = 0;
  if (DEBUG_TRACE) printf ("enter sim_store_register\n");

  if ((regno >= 0) && (regno < PIC30_NUM_W_REGISTERS))
    {
      pic30_write_datamem (STATE_CPU (sd, 0)->proc, 
                           W0_ADDR + (regno*2), 
                           length, 
                           value);
      rc = length;
    }
  else if (regno == PC_REGNO)
    {
      unsigned32 pc;
      if (length > 4)
        abort();
      memcpy (&pc, value, length);
      pic30_set_CIA (STATE_CPU (sd, 0)->proc, pc);
      rc = length;
    }

  if (DEBUG_TRACE) printf ("exit sim_store_register\n");
  return rc;
}

int
sim_fetch_register (sd, regno, buf, length)
     SIM_DESC sd;
     int regno;
     unsigned char *buf;
     int length;
{
  int rc = 0;

  if (DEBUG_TRACE) printf ("enter sim_fetch_register\n");

  if ((regno >= 0) && (regno < PIC30_NUM_W_REGISTERS))
  {
      pic30_read_datamem (STATE_CPU (sd, 0)->proc, 
                          W0_ADDR + (regno*2), 
                          length,
                          buf);
     rc = length;
  }
  else if (regno == PC_REGNO)
    {
      unsigned32 pc;
      pc = pic30_get_CIA (STATE_CPU (sd, 0)->proc);
      if (length > 4)
        abort();
      memcpy (buf, &pc, length);
      HOST_TO_TARGET (length, *buf);
      rc = length;
    }
  else
    {
      printf ("attempt to fetch unknown register: %d\n", regno);
    }


  if (DEBUG_TRACE) printf ("exit sim_fetch_register\n");
  return rc;
}

SIM_DESC
sim_open (kind, cb, abfd, argv)
     SIM_OPEN_KIND kind;
     host_callback *cb;
     struct _bfd *abfd;
     char **argv;
{
  SIM_DESC sd;

  if (DEBUG_TRACE) printf ("enter sim_open\n");

  sd = sim_state_alloc (kind, cb);

  STATE_CPU (sd, 0)->proc = pic30_openproc ();

  if (sim_pre_argv_init (sd, argv[0]) != SIM_RC_OK)
    return 0;


  if (DEBUG_TRACE) printf ("exit sim_open\n");
  /* fudge our descriptor for now */
  return (SIM_DESC) sd;
}

void
sim_close (sd, quitting)
     SIM_DESC sd;
     int quitting;
{
  if (DEBUG_TRACE) printf ("enter sim_close\n");

  pic30_closeproc (STATE_CPU (sd, 0)->proc);

  /* Uninstall the module to avoid memory leaks, file descriptor leaks, ...  */
  sim_module_uninstall (sd);
  if (DEBUG_TRACE) printf ("exit sim_close\n");
}

SIM_RC
sim_create_inferior (sd, abfd, argv, env)
     SIM_DESC sd;
     struct _bfd *abfd;
     char **argv;
     char **env;
{
  if (DEBUG_TRACE) printf ("enter sim_create_inferior\n");
  /* clear all registers */
  //&(sd)->cpu[0]->working_registers
  //memset (&(STATE_CPU (sd, 0)->working_registers), 0,
  //        sizeof (STATE_CPU (sd, 0)->working_registers));
  sim_module_init (sd);

  pic30_resetproc (STATE_CPU (sd, 0)->proc);
  
  if (DEBUG_TRACE) printf ("exit sim_create_inferior\n");
  return SIM_RC_OK;
}

void
sim_do_command (sd, cmd)
     SIM_DESC sd;
     char *cmd;
{
  if (DEBUG_TRACE) printf ("enter sim_do_command\n");
  if (DEBUG_TRACE) printf ("exit sim_do_command\n");
}

void
sim_set_callbacks (ptr)
     host_callback *ptr;
{
  /* we don't need this */
}

int
sim_trace (sd)
     SIM_DESC sd;
{
  if (DEBUG_TRACE) printf ("enter sim_trace\n");
  //  tracing = 1;

  //  sim_resume (sd, 0, 0);

  //  tracing = 0;

  if (DEBUG_TRACE) printf ("exit sim_trace\n");
  return 1;
}


void
sim_engine_run (SIM_DESC sd,
		int next_cpu_nr, /* ignore */
		int nr_cpus, /* ignore */
		int siggnal) /* ignore */
{
  SIM_ADDR cia;
  sim_cpu *cpu;

  if (DEBUG_TRACE) printf ("enter sim_engine_run\n");

  SIM_ASSERT (STATE_MAGIC (sd) == SIM_MAGIC_NUMBER);
  cpu = STATE_CPU (sd, 0);
  while (1)
    {
      int halted;
      cia = CIA_GET (cpu);
      halted = pic30_dispatch (cpu->proc);

      if (halted)
        {
          sim_engine_halt (sd, cpu, NULL, cia, sim_stopped, SIM_SIGTRAP);
        }
      /* process any events */
      if (sim_events_tick (sd))
	{
	  sim_events_process (sd);
	}
    }
  if (DEBUG_TRACE) printf ("exit sim_engine_run\n");
}

