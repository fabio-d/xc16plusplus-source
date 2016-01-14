#objdump: -d -r
#name: No Relaxation by default


# Test to ensure that, by default, a CALL/GOTO instruction within 32k words of
# the current instruction is not relaxed to an RCALL/BRA instruction.

.*: .*

Disassembly of section .text:

00000000 <main>:
   0:	01 01 78    	mov.w     w1, w2
   2:	00 00 ff    	nopr      
   4:	00 00 ff    	nopr      
   6:	00 00 ff    	nopr      
   8:	00 00 ff    	nopr      
   a:	00 00 ff    	nopr      
   c:	00 00 ff    	nopr      
   e:	86 02 78    	mov.w     w6, w5
  10:	00 00 02    	call      0x0 <main>
  12:	00 00 00 
			10: PROGRAM ADDRESS LSB	callme
			12: PROGRAM ADDRESS MSB	callme
  14:	05 03 78    	mov.w     w5, w6
  16:	86 03 78    	mov.w     w6, w7
  18:	00 00 ff    	nopr      

0000001a <callme>:
  1a:	00 00 ff    	nopr      
  1c:	88 04 78    	mov.w     w8, w9
  1e:	00 00 04    	goto      0x0 <main>
  20:	00 00 00 
			1e: PROGRAM ADDRESS LSB	main
			20: PROGRAM ADDRESS MSB	main
