#ld: 
#objects: /ld-pic30-coff/cert0429a.out /ld-pic30-coff/cert0429b.out
#objdump: -d -j .text
#name: UNSIGNED_10 Relocation

.+cert0429a\.o:     file format coff-pic30[[:space:]]*

Disassembly of section \.text:[[:space:]]*

00000100 \<__reset\>:
 100:	00 00 00    	nop       
 102:	00 00 ff    	nopr      
 104:	00 00 00    	nop       
 106:	00 00 ff    	nopr      
 108:	00 00 ff    	nopr      
 10a:	18 80 b0    	addc\.w    #0x1, w8
 10c:	f7 bf b0    	addc\.w    #0x3ff, w7
 10e:	f6 9f b0    	addc\.w    #0x1ff, w6
 110:	05 80 b0    	addc\.w    #0x0, w5
 112:	04 a0 b0    	addc\.w    #0x200, w4
 114:	13 80 b0    	addc\.w    #0x1, w3
 116:	f2 bf b0    	addc\.w    #0x3ff, w2
 118:	f1 9f b0    	addc\.w    #0x1ff, w1
 11a:	00 80 b0    	addc\.w    #0x0, w0
 11c:	01 a0 b0    	addc\.w    #0x200, w1
 11e:	00 00 ff    	nopr[[:space:]]*

00000120 \<\.text\>:[[:space:]]*
 120:	00 00 00    	nop       
 122:	00 00 ff    	nopr      
 124:	00 00 00    	nop       
 126:	00 00 ff    	nopr      
 128:	00 00 ff    	nopr      
 12a:	18 80 b0    	addc\.w    #0x1, w8
 12c:	f7 bf b0    	addc\.w    #0x3ff, w7
 12e:	f6 9f b0    	addc\.w    #0x1ff, w6
 130:	05 80 b0    	addc\.w    #0x0, w5
 132:	05 a0 b0    	addc\.w    #0x200, w5
 134:	14 80 b0    	addc\.w    #0x1, w4
 136:	f3 bf b0    	addc\.w    #0x3ff, w3
 138:	f2 9f b0    	addc\.w    #0x1ff, w2
 13a:	01 80 b0    	addc\.w    #0x0, w1
 13c:	01 a0 b0    	addc\.w    #0x200, w1
 13e:	00 00 ff    	nopr[[:space:]]*
