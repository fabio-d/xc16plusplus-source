#ld: 
#objects: /ld-pic30-coff/cert0436a.out /ld-pic30-coff/cert0436b.out
#objdump: -d -j .text
#name: WORD Relocation 



.*cert0436a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
 100:	00 00 00    	nop       
 102:	00 00 ff    	nopr      
 104:	00 00 00    	nop       
 106:	00 00 ff    	nopr      
 108:	00 00 ff    	nopr      
 10a:	00 00 ff    	nopr      
 10c:	00 00 ff    	nopr      
 10e:	40 23 21    	mov\.w     #0x1234, w0
 110:	f1 ff 2f    	mov\.w     #0xffff, w1
 112:	02 00 20    	mov\.w     #0x0, w2
 114:	f3 ff 27    	mov\.w     #0x7fff, w3
 116:	04 00 28    	mov\.w     #0x8000, w4
 118:	45 23 21    	mov\.w     #0x1234, w5
 11a:	f6 ff 2f    	mov\.w     #0xffff, w6
 11c:	07 00 20    	mov\.w     #0x0, w7
 11e:	f8 ff 27    	mov\.w     #0x7fff, w8
 120:	09 00 28    	mov\.w     #0x8000, w9
 122:	4a 23 21    	mov\.w     #0x1234, w10
 124:	fb ff 2f    	mov\.w     #0xffff, w11
 126:	0c 00 20    	mov\.w     #0x0, w12
 128:	fd ff 27    	mov\.w     #0x7fff, w13
 12a:	0e 00 28    	mov\.w     #0x8000, w14
 12c:	40 23 21    	mov\.w     #0x1234, w0
 12e:	f1 ff 2f    	mov\.w     #0xffff, w1
 130:	02 00 20    	mov\.w     #0x0, w2
 132:	f3 ff 27    	mov\.w     #0x7fff, w3
 134:	04 00 28    	mov\.w     #0x8000, w4
 136:	00 00 ff    	nopr      
 138:	00 00 ff    	nopr      
 13a:	00 00 ff    	nopr      
 13c:	00 00 ff    	nopr      
 13e:	00 00 ff    	nopr      
 140:	00 00 ff    	nopr      

00000142 \<\.text\>:
 142:	00 00 ff    	nopr      
 144:	00 00 00    	nop       
 146:	00 00 ff    	nopr      
 148:	00 00 ff    	nopr      
 14a:	00 00 ff    	nopr      
 14c:	00 00 ff    	nopr      
 14e:	40 23 21    	mov\.w     #0x1234, w0
 150:	f1 ff 2f    	mov\.w     #0xffff, w1
 152:	02 00 20    	mov\.w     #0x0, w2
 154:	f3 ff 27    	mov\.w     #0x7fff, w3
 156:	04 00 28    	mov\.w     #0x8000, w4
 158:	45 23 21    	mov\.w     #0x1234, w5
 15a:	f6 ff 2f    	mov\.w     #0xffff, w6
 15c:	07 00 20    	mov\.w     #0x0, w7
 15e:	f8 ff 27    	mov\.w     #0x7fff, w8
 160:	09 00 28    	mov\.w     #0x8000, w9
 162:	4a 23 21    	mov\.w     #0x1234, w10
 164:	fb ff 2f    	mov\.w     #0xffff, w11
 166:	0c 00 20    	mov\.w     #0x0, w12
 168:	fd ff 27    	mov\.w     #0x7fff, w13
 16a:	0e 00 28    	mov\.w     #0x8000, w14
 16c:	40 23 21    	mov\.w     #0x1234, w0
 16e:	f1 ff 2f    	mov\.w     #0xffff, w1
 170:	02 00 20    	mov\.w     #0x0, w2
 172:	f3 ff 27    	mov\.w     #0x7fff, w3
 174:	04 00 28    	mov\.w     #0x8000, w4
 176:	00 00 ff    	nopr      
 178:	00 00 ff    	nopr      
 17a:	00 00 ff    	nopr      
 17c:	00 00 ff    	nopr      
 17e:	00 00 ff    	nopr      
 180:	00 00 ff    	nopr      
