#ld: 
#name: LNK instruction on code symbol
#objects: /ld-pic30-coff/cert0740a.out /ld-pic30-coff/cert0740b.out
#objdump: -D -Msymbolic


.*cert0740\.o:     file format coff-pic30

Disassembly of section \.reset:

00000000 \<\.reset\>:
   0:	00 01 04    	goto      0x100 \<__reset\>
   2:	00 00 00 
Disassembly of section \.text:

00000100 \<__reset\>:
	\.\.\.
 104:	00 00 fa    	lnk       #0x0 \<WREG0\>
 106:	00 00 fa    	lnk       #0x0 \<WREG0\>
 108:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 10a:	00 00 fa    	lnk       #0x0 \<WREG0\>
 10c:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 10e:	02 00 fa    	lnk       #0x2 \<WREG1\>
 110:	06 08 fa    	lnk       #0x806 \<dat0b\>
 112:	08 08 fa    	lnk       #0x808 \<dat1b\>
 114:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 116:	02 00 fa    	lnk       #0x2 \<WREG1\>
 118:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 11a:	00 00 00    	nop       
 11c:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
	\.\.\.
 124:	00 00 fa    	lnk       #0x0 \<WREG0\>
 126:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 128:	00 00 fa    	lnk       #0x0 \<WREG0\>
 12a:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 12c:	02 00 fa    	lnk       #0x2 \<WREG1\>
 12e:	06 08 fa    	lnk       #0x806 \<dat0b\>
 130:	08 08 fa    	lnk       #0x808 \<dat1b\>
 132:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 134:	02 00 fa    	lnk       #0x2 \<WREG1\>
 136:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
	\.\.\.

0000013c \<\.text\>:
	\.\.\.
 140:	00 00 fa    	lnk       #0x0 \<WREG0\>
 142:	00 00 fa    	lnk       #0x0 \<WREG0\>
 144:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 146:	00 00 fa    	lnk       #0x0 \<WREG0\>
 148:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 14a:	02 00 fa    	lnk       #0x2 \<WREG1\>
 14c:	00 08 fa    	lnk       #0x800 \<dat0a\>
 14e:	02 08 fa    	lnk       #0x802 \<dat1a\>
 150:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 152:	02 00 fa    	lnk       #0x2 \<WREG1\>
 154:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 156:	00 00 00    	nop       
 158:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
	\.\.\.
 160:	00 00 fa    	lnk       #0x0 \<WREG0\>
 162:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 164:	00 00 fa    	lnk       #0x0 \<WREG0\>
 166:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 168:	02 00 fa    	lnk       #0x2 \<WREG1\>
 16a:	06 08 fa    	lnk       #0x806 \<dat0b\>
 16c:	02 08 fa    	lnk       #0x802 \<dat1a\>
 16e:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 170:	02 00 fa    	lnk       #0x2 \<WREG1\>
 172:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
	\.\.\.
Disassembly of section \.dinit:

00000178 \<\.dinit\>:
 178:	00 08 00    	nop       
 17a:	0c 00 00    	nop       
 17c:	02 00 00    	nop       
 17e:	01 00 01    	call      w1
 180:	00 00 00    	nop       
 182:	01 00 01    	call      w1
	\.\.\.
Disassembly of section \.ivt:

00000004 \<\.ivt\>:
	\.\.\.
Disassembly of section \.aivt:

00000084 \<\.aivt\>:
	\.\.\.
Disassembly of section foo:

00000188 \<foo\>:
	\.\.\.
 18c:	00 00 fa    	lnk       #0x0 \<WREG0\>
 18e:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 190:	00 00 fa    	lnk       #0x0 \<WREG0\>
 192:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 194:	02 00 fa    	lnk       #0x2 \<WREG1\>
 196:	06 08 fa    	lnk       #0x806 \<dat0b\>
 198:	08 08 fa    	lnk       #0x808 \<dat1b\>
 19a:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 19c:	02 00 fa    	lnk       #0x2 \<WREG1\>
 19e:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
	\.\.\.
 1a8:	00 00 fa    	lnk       #0x0 \<WREG0\>
 1aa:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1ac:	00 00 fa    	lnk       #0x0 \<WREG0\>
 1ae:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1b0:	02 00 fa    	lnk       #0x2 \<WREG1\>
 1b2:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1b4:	02 00 fa    	lnk       #0x2 \<WREG1\>
 1b6:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>

000001b8 \<foo\>:
	\.\.\.
 1bc:	00 00 fa    	lnk       #0x0 \<WREG0\>
 1be:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1c0:	00 00 fa    	lnk       #0x0 \<WREG0\>
 1c2:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1c4:	02 00 fa    	lnk       #0x2 \<WREG1\>
 1c6:	00 08 fa    	lnk       #0x800 \<dat0a\>
 1c8:	02 08 fa    	lnk       #0x802 \<dat1a\>
 1ca:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1cc:	02 00 fa    	lnk       #0x2 \<WREG1\>
 1ce:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
	\.\.\.
 1d8:	00 00 fa    	lnk       #0x0 \<WREG0\>
 1da:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1dc:	00 00 fa    	lnk       #0x0 \<WREG0\>
 1de:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1e0:	02 00 fa    	lnk       #0x2 \<WREG1\>
 1e2:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>
 1e4:	02 00 fa    	lnk       #0x2 \<WREG1\>
 1e6:	fe 3f fa    	lnk       #0x3ffe \<foo1a\>

