#ld:
#name: Location counter update when switching between data and text sections
#objects: /ld-pic30-coff/cert0720a.out /ld-pic30-coff/cert0720b.out
#objdump: -D -r -S


.*cert0720a\.o:     file format coff-pic30

Disassembly of section \.reset:

00000000 \<\.reset\>:
   0:	14 01 04    	goto      0x114 \<__reset\>
   2:	00 00 00 
Disassembly of section \.text:

00000100 \<textA0\>:
 100:	00 01 00    	nop       
	\.\.\.
 106:	01 00 00    	nop       
 108:	00 00 00    	nop       
 10a:	02 00 00    	nop       
 10c:	00 00 00    	nop       

0000010e \<L0\>:
 10e:	0e 01 00    	nop       
 110:	03 00 00    	nop       
 112:	00 00 00    	nop       

00000114 \<__reset\>:
 114:	00 00 00    	nop       

00000116 \<L0\>:
 116:	16 01 04    	goto      0x116 \<L0\>
 118:	00 00 00 

0000011a \<textB0\>:
 11a:	1a 01 00    	nop       
	\.\.\.
 120:	01 00 00    	nop       
 122:	00 00 00    	nop       
 124:	02 00 00    	nop       
 126:	00 00 00    	nop       

00000128 \<L0\>:
 128:	28 01 00    	nop       
 12a:	00 00 00    	nop       
 12c:	03 00 00    	nop       
 12e:	00 00 00    	nop       
 130:	04 00 00    	nop       
 132:	00 00 00    	nop       
 134:	05 00 00    	nop       
 136:	00 00 00    	nop       
 138:	06 00 00    	nop       
 13a:	00 00 00    	nop       

0000013c \<L0\>:
 13c:	3c 01 00    	nop       
 13e:	07 00 00    	nop       
 140:	00 00 00    	nop       
Disassembly of section \.dinit:

00000142 \<\.dinit\>:
 142:	00 08 00    	nop       
 144:	42 00 00    	nop       
 146:	02 00 00    	nop       
 148:	00 08 00    	nop       
 14a:	00 00 00    	nop       
 14c:	01 00 00    	nop       
 14e:	00 02 00    	nop       
	\.\.\.
 154:	12 08 03    	\.pword 0x030812
 156:	00 00 00    	nop       
 158:	18 08 04    	goto      0x818 \<L0\>
 15a:	00 00 00 
 15c:	05 00 00    	nop       
 15e:	00 06 00    	nop       
 160:	00 00 26    	mov\.w     #0x6000, w0
 162:	08 07 00    	nop       
 164:	00 00 2c    	mov\.w     #0xc000, w0
 166:	08 00 00    	nop       
 168:	00 00 01    	call      w0
 16a:	00 00 00    	nop       
 16c:	03 00 00    	nop       
 16e:	00 3a 08    	do        #0x3a00, \. \+ 0x2
 170:	00 00 03 
	\.\.\.
Disassembly of section \.ivt:

00000004 \<\.ivt\>:
	\.\.\.
Disassembly of section \.aivt:

00000084 \<\.aivt\>:
	\.\.\.
