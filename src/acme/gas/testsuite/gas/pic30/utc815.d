#as: --no-warn
#objdump: -d -r
#name: BFD_RELOC_PIC30_DO_ABSOLUTE

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
  10:	06 00 08    	do        \#0x6, 0x14
  12:	00 00 00 
			12: DO ABSOLUTE	L0
  14:	05 03 78    	mov.w     w5, w6
  16:	86 03 78    	mov.w     w6, w7
  18:	00 00 ff    	nopr      
