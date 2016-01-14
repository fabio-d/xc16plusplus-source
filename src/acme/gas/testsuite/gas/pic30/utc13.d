#as: --relax
#objdump: -d
#name: ABS to REL Relaxation - Furthest Negative Instruction - 1

# Test to ensure that a CALL/GOTO instruction is not relaxed to an RCALL/BRA
# instruction when the function being called is the furthest negative
# instruction - 1.

.*: .*

Disassembly of section .text:

00000000 <foo>:
       0:	00 00 ff    	nopr      

00000002 <bar>:
	...
   10000:	00 00 02    	call      0x0 <foo>
   10002:	00 00 00 
   10004:	00 00 04    	goto      0x0 <foo>
   10006:	00 00 00 
