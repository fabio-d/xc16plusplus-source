#as: --relax
#objdump: -d
#name: ABS to REL Relaxation - Furthest Negative Instruction

# Test to ensure that a CALL/GOTO instruction is relaxed to an RCALL/BRA
# instruction when the function being called is the furthest possible negative
# instruction.

.*: .*


Disassembly of section .text:

00000000 <.*>:
       0:	00 00 ff    	nopr      

00000002 <foo>:
       2:	00 00 ff    	nopr      

00000004 <bar>:
	...
    fffe:	00 00 07    	rcall     0x10000
   10000:	00 00 37    	bra       0x10002
