#ld: -q
#objects: /ld-pic30-coff/cert0407a.out /ld-pic30-coff/cert0407b.out
#objdump: -d -j .text
#name: DSP_5 Relocation

.*cert0407a.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
 100:	00 00 00    	nop       
 102:	00 00 ff    	nopr      
 104:	05 00 00    	nop       
 106:	70 00 c8    	sftac     A, #0x30
 108:	40 00 c8    	sftac     A, #0x0
 10a:	7f 80 c8    	sftac     B, #0x3f
 10c:	41 80 c8    	sftac     B, #0x1
 10e:	41 00 c8    	sftac     A, #0x1
 110:	45 00 c8    	sftac     A, #0x5
 112:	44 80 c8    	sftac     B, #0x4
 114:	44 80 c8    	sftac     B, #0x4
Disassembly of section .text:

0000012c \<\.text\>:
 12c:	00 00 00    	nop       
 12e:	00 00 ff    	nopr      
 130:	04 00 00    	nop       
 132:	40 00 c8    	sftac     A, \#0x0
 134:	70 00 c8    	sftac     A, \#0x30
 136:	41 80 c8    	sftac     B, \#0x1
 138:	44 00 c8    	sftac     A, \#0x4
 13a:	44 00 c8    	sftac     A, \#0x4
 13c:	45 80 c8    	sftac     B, \#0x5
 13e:	44 80 c8    	sftac     B, \#0x4
