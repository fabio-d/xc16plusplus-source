#ld: 
#objects: /ld-pic30-coff/cert0430a.out /ld-pic30-coff/cert0430b.out
#objdump: -d -j .text
#name: SIGNED_10_BYTE Relocation 

.+cert0430a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
 100:	00 00 00    	nop       
 102:	00 00 ff    	nopr      
 104:	00 00 00    	nop       
 106:	00 00 ff    	nopr      
 108:	00 00 ff    	nopr      
 10a:	18 40 b2    	and\.b     #0x1, w8
 10c:	f7 47 b2    	and\.b     #0x7f, w7
 10e:	06 48 b2    	and\.b     #0x80, w6
 110:	05 40 b2    	and\.b     #0x0, w5
 112:	f4 4f b2    	and\.b     #0xff, w4
 114:	11 40 b2    	and\.b     #0x1, w1
 116:	21 40 b2    	and\.b     #0x2, w1
 118:	31 40 b2    	and\.b     #0x3, w1
 11a:	31 48 b2    	and\.b     #0x83, w1
 11c:	13 40 b2    	and\.b     #0x1, w3
 11e:	f2 47 b2    	and\.b     #0x7f, w2
 120:	01 48 b2    	and\.b     #0x80, w1
 122:	00 40 b2    	and\.b     #0x0, w0
 124:	f1 4f b2    	and\.b     #0xff, w1
 126:	11 40 b2    	and\.b     #0x1, w1
 128:	21 40 b2    	and\.b     #0x2, w1
 12a:	31 40 b2    	and\.b     #0x3, w1
 12c:	31 48 b2    	and\.b     #0x83, w1
 12e:	00 00 ff    	nopr      

00000130 \<\.text\>:
 130:	00 00 00    	nop       
 132:	00 00 ff    	nopr      
 134:	00 00 00    	nop       
 136:	00 00 ff    	nopr      
 138:	00 00 ff    	nopr      
 13a:	18 40 b2    	and\.b     #0x1, w8
 13c:	f7 47 b2    	and\.b     #0x7f, w7
 13e:	06 48 b2    	and\.b     #0x80, w6
 140:	05 40 b2    	and\.b     #0x0, w5
 142:	f5 4f b2    	and\.b     #0xff, w5
 144:	11 40 b2    	and\.b     #0x1, w1
 146:	21 40 b2    	and\.b     #0x2, w1
 148:	31 40 b2    	and\.b     #0x3, w1
 14a:	31 48 b2    	and\.b     #0x83, w1
 14c:	14 40 b2    	and\.b     #0x1, w4
 14e:	f3 47 b2    	and\.b     #0x7f, w3
 150:	02 48 b2    	and\.b     #0x80, w2
 152:	01 40 b2    	and\.b     #0x0, w1
 154:	f1 4f b2    	and\.b     #0xff, w1
 156:	11 40 b2    	and\.b     #0x1, w1
 158:	21 40 b2    	and\.b     #0x2, w1
 15a:	31 40 b2    	and\.b     #0x3, w1
 15c:	31 48 b2    	and\.b     #0x83, w1
 15e:	00 00 ff    	nopr      
