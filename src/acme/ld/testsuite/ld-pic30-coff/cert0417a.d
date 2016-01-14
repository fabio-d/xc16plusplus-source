#ld:
#objects: /ld-pic30-coff/cert0417a.out /ld-pic30-coff/cert0417b.out
#objdump: -d -j .text
#name: PCREL_DO Relocations


.+cert0417a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<\.text\>:
 100:	01 00 00    	nop       
 102:	05 a5 00    	nop       
 104:	ff ff 00    	nop       
	\.\.\.

0000010c \<L0\>:
 10c:	08 00 08    	do        \#0x8, \. \+ 0x120
 10e:	08 00 00 
 110:	00 00 ff    	nopr      
 112:	00 00 ff    	nopr      
	\.\.\.
 118:	00 00 ff    	nopr      
 11a:	00 00 ff    	nopr      
	\.\.\.
 120:	00 00 ff    	nopr      
 122:	00 00 ff    	nopr      
 124:	00 00 ff    	nopr      
 126:	00 00 ff    	nopr      
Disassembly of section \.text:

00000140 \<\.text\>:
 140:	01 00 00    	nop       
 142:	05 a5 00    	nop       
 144:	ff ff 00    	nop       
 146:	00 00 00    	nop       

00000148 \<__reset\>:
	\.\.\.

0000014c \<L0\>:
 14c:	05 00 08    	do        #0x5, 0x13c
 14e:	f6 ff 00 
 150:	00 00 ff    	nopr      
 152:	00 00 ff    	nopr      
