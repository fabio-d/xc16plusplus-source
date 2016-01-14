#as: --relax
#objdump: -d
#name: ABS to REL Relaxation - Furthest Positive Instruction

# Test to ensure that a CALL/GOTO instruction is relaxed to an RCALL/BRA
# instruction when the function being called is the furthest possible positive
# instruction.

.*: .*

Disassembly of section .text:

00000000 <.*>:
       0:	00 00 07    	rcall     0x2
       2:	00 00 37    	bra       0x4
	...

00010000 <foo>:
   10000:	00 00 ff    	nopr      
