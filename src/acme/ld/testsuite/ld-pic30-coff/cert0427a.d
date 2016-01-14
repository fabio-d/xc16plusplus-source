#ld: 
#objects: /ld-pic30-coff/cert0427a.out /ld-pic30-coff/cert0427b.out
#objdump: -h -d -j .text
#name: SFR_WORD Relocation

.*cert0427a.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.reset        00000004  00000000  00000000  00000148  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.ivt          0000007c  00000004  00000004  00000150  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  2 \.aivt         0000007c  00000084  00000084  00000248  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  3 \.data         00000014  00000800  00000800  00000340  2\*\*1
                  CONTENTS, ALLOC, DATA, NEVER_LOAD
  4 \.dinit        0000001e  00000100  00000100  00000368  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  5 \.text         0000002a  0000011e  0000011e  000003a4  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  6 \.isr          00000002  00000148  00000148  000003f8  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
Disassembly of section \.text:

0000011e \<__reset\>:
 11e:	00 00 00    	nop       
 120:	00 08 f9    	pop       0x800
 122:	02 08 f9    	pop       0x802
 124:	04 08 f9    	pop       0x804
 126:	06 08 f9    	pop       0x806
 128:	08 08 f9    	pop       0x808
 12a:	0a 08 f9    	pop       0x80a
 12c:	0c 08 f9    	pop       0x80c
 12e:	0e 08 f9    	pop       0x80e
 130:	10 08 f9    	pop       0x810
 132:	12 08 f9    	pop       0x812

00000134 \<\.text\>:
 134:	00 08 f9    	pop       0x800
 136:	02 08 f9    	pop       0x802
 138:	04 08 f9    	pop       0x804
 13a:	06 08 f9    	pop       0x806
 13c:	08 08 f9    	pop       0x808
 13e:	0a 08 f9    	pop       0x80a
 140:	0c 08 f9    	pop       0x80c
 142:	0e 08 f9    	pop       0x80e
 144:	10 08 f9    	pop       0x810
 146:	12 08 f9    	pop       0x812
