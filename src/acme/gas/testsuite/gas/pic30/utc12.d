#as: --relax
#objdump: -d
#name: ABS to REL Relaxation - Furthest Positive Instruction + 1

# Test to ensure that a CALL/GOTO instruction is not relaxed to an RCALL/BRA
# instruction when the function being called is the furthest positive
# instruction + 1.

.*: .*

Disassembly of section .text:

00000000 <.*>:
       0:	00 00 02    	call      0x0 <.*>
       2:	00 00 00 
       4:	00 00 04    	goto      0x0 <.*>
       6:	00 00 00 
	...

00010002 <foo>:
   10002:	00 00 ff    	nopr      
   10004:	00 00 ff    	nopr      
