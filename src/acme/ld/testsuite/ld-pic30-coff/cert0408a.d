#ld: 
#objects: /ld-pic30-coff/cert0408a.out /ld-pic30-coff/cert0408b.out
#objdump: -d -j .text
#name: DSP_PRESHIFT Relocation

.*cert0408a.o:     file format coff-pic30

Disassembly of section .text:

00000116 \<__reset\>:
 116:	00 00 00    	nop       
 118:	00 00 ff    	nopr      
 11a:	05 00 00    	nop       
 11c:	05 00 c9    	add       w5, #0x0, A
 11e:	84 83 c9    	add       w4, #0x7, B
 120:	83 00 c9    	add       w3, #0x1, A
 122:	82 01 c9    	add       w2, #0x3, A
 124:	81 83 c9    	add       w1, #0x7, B
 126:	86 82 c9    	add       w6, #0x5, B
 128:	07 00 c9    	add       w7, #0x0, A

0000012a \<\.text\>:
 12a:	00 00 00    	nop       
 12c:	00 00 ff    	nopr      
 12e:	04 00 00    	nop       
 130:	05 00 c9    	add       w5, #0x0, A
 132:	84 83 c9    	add       w4, #0x7, B
 134:	83 00 c9    	add       w3, #0x1, A
 136:	82 01 c9    	add       w2, #0x3, A
 138:	81 83 c9    	add       w1, #0x7, B
 13a:	86 82 c9    	add       w6, #0x5, B
 13c:	07 00 c9    	add       w7, #0x0, A
