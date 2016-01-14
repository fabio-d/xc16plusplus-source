#ld: 
#objects: /ld-pic30-coff/cert0414a.out /ld-pic30-coff/cert0414b.out
#objdump: -d -j .text
#name: PSVOFFSET Relocation in .text

.*cert0414a\.o:     file format coff-pic30

Disassembly of section \.text:

00000116 \<\.text\>:
 116:	01 00 00    	nop       

00000118 \<externfooT1\>:
 118:	a5 00 00    	nop       
 11a:	18 81 00    	nop       
 11c:	28 81 00    	nop       

0000011e \<__reset\>:
	\.\.\.
 122:	00 00 ff    	nopr      
 124:	00 00 ff    	nopr      

00000126 \<\.text\>:
 126:	02 ff 00    	nop       

00000128 \<externfooT2\>:
 128:	a6 00 00    	nop       
 12a:	18 81 00    	nop       
 12c:	28 81 00    	nop       
 12e:	00 00 ff    	nopr      
 130:	00 00 ff    	nopr      
	...
