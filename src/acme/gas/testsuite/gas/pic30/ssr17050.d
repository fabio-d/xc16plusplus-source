#as: 
#objdump: -d
#name: SSR 17050 -- Disassembly of text section with labels on odd addresses can be confusing


dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 <\.text>:
   0:	12 34 00    	nop       

00000002 <label>:
   2:	56 00 00    	nop       

00000004 <new_label>:
   4:	78 9a 00    	nop       
   6:	bc de 00    	nop       
