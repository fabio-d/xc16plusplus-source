#ld: -defsym __reset=0
#objects: /ld-pic30-coff/cert0401a.out /ld-pic30-coff/cert0401b.out
#objdump:  -h -d -j .text
#name: BIT_SELECT_3 Relocation

\./\./ld-pic30-coff/tmpdir/cert0401a\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.reset        00000004  00000000  00000000  00000170  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.ivt          0000007c  00000004  00000004  00000178  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  2 \.aivt         0000007c  00000084  00000084  00000270  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  3 \.data         00000008  00000800  00000800  00000368  2\*\*1
                  CONTENTS, ALLOC, DATA, NEVER_LOAD
  4 \.text         0000001c  00000100  00000100  00000378  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  5 \.dinit        00000016  0000011c  0000011c  000003b0  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  6 \.text         0000000e  00000132  00000132  000003dc  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  7 \.isr          00000002  00000140  00000140  000003f8  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
Disassembly of section \.text:

00000100 \<\.text\>:
 100:	00 00 ff    	nopr      
 102:	00 00 00    	nop       
 104:	00 00 ff    	nopr      
 106:	00 00 00    	nop       
 108:	00 00 ff    	nopr      
 10a:	00 00 00    	nop       
 10c:	01 60 ab    	btst\.b    0x1, \#0x3
 10e:	00 00 ff    	nopr      
	\.\.\.
 114:	00 00 ff    	nopr      
 116:	00 00 ff    	nopr      
 118:	00 00 00    	nop       
 11a:	02 00 ab    	btst\.b    0x2, \#0x0
Disassembly of section \.text:

00000132 \<\.text\>:
 132:	00 00 ff    	nopr      
 134:	03 20 ab    	btst\.b    0x3, \#0x1
 136:	00 00 ff    	nopr      
 138:	00 00 ff    	nopr      
	\.\.\.
 13e:	00 40 ab    	btst\.b    0x0, \#0x2
