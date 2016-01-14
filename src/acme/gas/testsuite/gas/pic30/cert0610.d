#as: 
#name: Test the location-counter update in the pic30-objdump -d output
#objdump: -d -l
#source: cert0610.s

.*:     file format coff-pic30

Disassembly of section \.text:

00000000 \<_main\>:
   0:	00 20 ef    	clr\.w     0x0
   2:	00 e0 a9    	bclr\.b    0x0, #0x7
   4:	00 c0 a9    	bclr\.b    0x0, #0x6
   6:	00 00 04    	goto      0x0 \<_main\>
   8:	00 00 00 

0000000a \<test1\>:
   a:	04 20 ec    	inc\.w     0x4
   c:	12 01 c3    	clr       A
   e:	12 81 c3    	clr       B
  10:	00 20 ef    	clr\.w     0x0
  12:	f0 ff 2f    	mov\.w     #0xffff, w0
  14:	00 00 88    	mov\.w     w0, 0x0
  16:	f0 ff 27    	mov\.w     #0x7fff, w0
  18:	00 00 88    	mov\.w     w0, 0x0
  1a:	00 00 20    	mov\.w     #0x0, w0
  1c:	00 00 88    	mov\.w     w0, 0x0
  1e:	00 f0 2f    	mov\.w     #0xff00, w0
  20:	00 00 88    	mov\.w     w0, 0x0
  22:	f0 0f 20    	mov\.w     #0xff, w0
  24:	00 00 88    	mov\.w     w0, 0x0
  26:	00 00 20    	mov\.w     #0x0, w0
  28:	00 00 88    	mov\.w     w0, 0x0
  2a:	00 30 cb    	sub       A
  2c:	f0 0f 20    	mov\.w     #0xff, w0
  2e:	00 00 88    	mov\.w     w0, 0x0
  30:	00 20 a9    	bclr\.b    0x0, #0x1
  32:	00 00 e3    	cp\.w      0x0
  34:	00 20 ae    	btss\.b    0x0, #0x1
  36:	00 00 02    	call      0x0 \<_main\>
  38:	00 00 00 
  3a:	00 f0 27    	mov\.w     #0x7f00, w0
  3c:	10 00 88    	mov\.w     w0, 0x2
  3e:	00 20 a9    	bclr\.b    0x0, #0x1
  40:	00 00 e3    	cp\.w      0x0
  42:	00 20 ae    	btss\.b    0x0, #0x1
  44:	00 00 02    	call      0x0 \<_main\>
  46:	00 00 00 
  48:	00 00 20    	mov\.w     #0x0, w0
  4a:	0e e0 b7    	mov\.b     WREG, 0xe
  4c:	00 20 a9    	bclr\.b    0x0, #0x1
  4e:	00 00 e3    	cp\.w      0x0
  50:	00 20 ae    	btss\.b    0x0, #0x1
  52:	00 00 02    	call      0x0 \<_main\>
  54:	00 00 00 
  56:	10 00 e2    	cp0\.w     0x10
  58:	00 20 ae    	btss\.b    0x0, #0x1
  5a:	00 00 02    	call      0x0 \<_main\>
  5c:	00 00 00 
  5e:	00 f0 2f    	mov\.w     #0xff00, w0
  60:	00 00 88    	mov\.w     w0, 0x0
  62:	00 20 a9    	bclr\.b    0x0, #0x1
  64:	00 00 e3    	cp\.w      0x0
  66:	00 20 ae    	btss\.b    0x0, #0x1
  68:	00 00 02    	call      0x0 \<_main\>
  6a:	00 00 00 
  6c:	f0 0f 20    	mov\.w     #0xff, w0
  6e:	10 00 88    	mov\.w     w0, 0x2
  70:	00 20 a9    	bclr\.b    0x0, #0x1
  72:	00 00 e3    	cp\.w      0x0
  74:	00 20 ae    	btss\.b    0x0, #0x1
  76:	00 00 02    	call      0x0 \<_main\>
  78:	00 00 00 
  7a:	00 00 20    	mov\.w     #0x0, w0
  7c:	0e e0 b7    	mov\.b     WREG, 0xe
  7e:	00 20 a9    	bclr\.b    0x0, #0x1
  80:	00 00 e3    	cp\.w      0x0
  82:	00 20 ae    	btss\.b    0x0, #0x1
  84:	00 00 02    	call      0x0 \<_main\>
  86:	00 00 00 
  88:	10 00 e2    	cp0\.w     0x10
  8a:	00 20 ae    	btss\.b    0x0, #0x1
  8c:	00 00 02    	call      0x0 \<_main\>
  8e:	00 00 00 
  90:	06 00 a8    	bset\.b    0x6, #0x0
  92:	08 20 ef    	clr\.w     0x8
  94:	01 c0 af    	btsc\.b    0x1, #0x6
  96:	00 00 02    	call      0x0 \<_main\>
  98:	00 00 00 
  9a:	01 80 af    	btsc\.b    0x1, #0x4
  9c:	00 00 02    	call      0x0 \<_main\>
  9e:	00 00 00 
  a0:	01 60 af    	btsc\.b    0x1, #0x3
  a2:	00 00 02    	call      0x0 \<_main\>
  a4:	00 00 00 
  a6:	01 40 af    	btsc\.b    0x1, #0x2
  a8:	00 00 02    	call      0x0 \<_main\>
  aa:	00 00 00 
  ac:	01 e0 af    	btsc\.b    0x1, #0x7
  ae:	00 00 02    	call      0x0 \<_main\>
  b0:	00 00 00 
  b2:	01 a0 af    	btsc\.b    0x1, #0x5
  b4:	00 00 02    	call      0x0 \<_main\>
  b6:	00 00 00 
  b8:	00 00 04    	goto      0x0 \<_main\>
  ba:	00 00 00 

000000bc \<test2\>:
  bc:	04 20 ec    	inc\.w     0x4
  be:	12 01 c3    	clr       A
  c0:	12 81 c3    	clr       B
  c2:	00 20 ef    	clr\.w     0x0
  c4:	00 00 28    	mov\.w     #0x8000, w0
  c6:	00 00 88    	mov\.w     w0, 0x0
  c8:	f0 bf 27    	mov\.w     #0x7bff, w0
  ca:	00 00 88    	mov\.w     w0, 0x0
  cc:	00 00 20    	mov\.w     #0x0, w0
  ce:	00 00 88    	mov\.w     w0, 0x0
  d0:	f0 ff 27    	mov\.w     #0x7fff, w0
  d2:	00 00 88    	mov\.w     w0, 0x0
  d4:	f0 bf 2f    	mov\.w     #0xfbff, w0
  d6:	00 00 88    	mov\.w     w0, 0x0
  d8:	f0 ff 2f    	mov\.w     #0xffff, w0
  da:	00 00 88    	mov\.w     w0, 0x0
  dc:	00 b0 cb    	sub       B
  de:	f0 ff 2f    	mov\.w     #0xffff, w0
  e0:	00 00 88    	mov\.w     w0, 0x0
  e2:	00 20 a9    	bclr\.b    0x0, #0x1
  e4:	00 00 e3    	cp\.w      0x0
  e6:	00 20 ae    	btss\.b    0x0, #0x1
  e8:	00 00 02    	call      0x0 \<_main\>
  ea:	00 00 00 
  ec:	f0 ff 27    	mov\.w     #0x7fff, w0
  ee:	10 00 88    	mov\.w     w0, 0x2
  f0:	00 00 e3    	cp\.w      0x0
  f2:	00 20 ae    	btss\.b    0x0, #0x1
  f4:	00 00 02    	call      0x0 \<_main\>
  f6:	00 00 00 
  f8:	f0 ff 2f    	mov\.w     #0xffff, w0
  fa:	0e e0 b7    	mov\.b     WREG, 0xe
  fc:	00 00 e3    	cp\.w      0x0
  fe:	00 20 ae    	btss\.b    0x0, #0x1
 100:	00 00 02    	call      0x0 \<_main\>
 102:	00 00 00 
 104:	10 00 e2    	cp0\.w     0x10
 106:	00 20 ae    	btss\.b    0x0, #0x1
 108:	00 00 02    	call      0x0 \<_main\>
 10a:	00 00 00 
 10c:	00 00 28    	mov\.w     #0x8000, w0
 10e:	00 00 88    	mov\.w     w0, 0x0
 110:	00 20 a9    	bclr\.b    0x0, #0x1
 112:	00 00 e3    	cp\.w      0x0
 114:	00 20 ae    	btss\.b    0x0, #0x1
 116:	00 00 02    	call      0x0 \<_main\>
 118:	00 00 00 
 11a:	f0 bf 27    	mov\.w     #0x7bff, w0
 11c:	10 00 88    	mov\.w     w0, 0x2
 11e:	00 00 e3    	cp\.w      0x0
 120:	00 20 ae    	btss\.b    0x0, #0x1
 122:	00 00 02    	call      0x0 \<_main\>
 124:	00 00 00 
 126:	00 00 20    	mov\.w     #0x0, w0
 128:	0e e0 b7    	mov\.b     WREG, 0xe
 12a:	00 00 e3    	cp\.w      0x0
 12c:	00 20 ae    	btss\.b    0x0, #0x1
 12e:	00 00 02    	call      0x0 \<_main\>
 130:	00 00 00 
 132:	10 00 e2    	cp0\.w     0x10
 134:	00 20 ae    	btss\.b    0x0, #0x1
 136:	00 00 02    	call      0x0 \<_main\>
 138:	00 00 00 
 13a:	06 20 ef    	clr\.w     0x6
 13c:	08 00 a8    	bset\.b    0x8, #0x0
 13e:	01 c0 ae    	btss\.b    0x1, #0x6
 140:	00 00 02    	call      0x0 \<_main\>
 142:	00 00 00 
 144:	01 60 ae    	btss\.b    0x1, #0x3
 146:	00 00 02    	call      0x0 \<_main\>
 148:	00 00 00 
 14a:	06 00 a8    	bset\.b    0x6, #0x0
 14c:	08 20 ef    	clr\.w     0x8
 14e:	01 80 af    	btsc\.b    0x1, #0x4
 150:	00 00 02    	call      0x0 \<_main\>
 152:	00 00 00 
 154:	01 40 af    	btsc\.b    0x1, #0x2
 156:	00 00 02    	call      0x0 \<_main\>
 158:	00 00 00 
 15a:	01 e0 af    	btsc\.b    0x1, #0x7
 15c:	00 00 02    	call      0x0 \<_main\>
 15e:	00 00 00 
 160:	01 a0 af    	btsc\.b    0x1, #0x5
 162:	00 00 02    	call      0x0 \<_main\>
 164:	00 00 00 
 166:	00 00 04    	goto      0x0 \<_main\>
 168:	00 00 00 

0000016a \<test3\>:
 16a:	04 20 ec    	inc\.w     0x4
 16c:	12 01 c3    	clr       A
 16e:	12 81 c3    	clr       B
 170:	00 20 ef    	clr\.w     0x0
 172:	10 00 28    	mov\.w     #0x8001, w0
 174:	00 00 88    	mov\.w     w0, 0x0
 176:	f0 0f 20    	mov\.w     #0xff, w0
 178:	00 00 88    	mov\.w     w0, 0x0
 17a:	00 f8 2f    	mov\.w     #0xff80, w0
 17c:	00 00 88    	mov\.w     w0, 0x0
 17e:	00 00 20    	mov\.w     #0x0, w0
 180:	00 00 88    	mov\.w     w0, 0x0
 182:	00 00 20    	mov\.w     #0x0, w0
 184:	00 00 88    	mov\.w     w0, 0x0
 186:	f0 07 20    	mov\.w     #0x7f, w0
 188:	00 00 88    	mov\.w     w0, 0x0
 18a:	00 30 cb    	sub       A
 18c:	10 00 28    	mov\.w     #0x8001, w0
 18e:	00 00 88    	mov\.w     w0, 0x0
 190:	00 20 a9    	bclr\.b    0x0, #0x1
 192:	00 00 e3    	cp\.w      0x0
 194:	00 20 ae    	btss\.b    0x0, #0x1
 196:	00 00 02    	call      0x0 \<_main\>
 198:	00 00 00 
 19a:	f0 0f 20    	mov\.w     #0xff, w0
 19c:	10 00 88    	mov\.w     w0, 0x2
 19e:	00 00 e3    	cp\.w      0x0
 1a0:	00 20 ae    	btss\.b    0x0, #0x1
 1a2:	00 00 02    	call      0x0 \<_main\>
 1a4:	00 00 00 
 1a6:	10 00 20    	mov\.w     #0x1, w0
 1a8:	0e e0 b7    	mov\.b     WREG, 0xe
 1aa:	00 00 e3    	cp\.w      0x0
 1ac:	00 20 ae    	btss\.b    0x0, #0x1
 1ae:	00 00 02    	call      0x0 \<_main\>
 1b0:	00 00 00 
 1b2:	10 00 e2    	cp0\.w     0x10
 1b4:	00 20 ae    	btss\.b    0x0, #0x1
 1b6:	00 00 02    	call      0x0 \<_main\>
 1b8:	00 00 00 
 1ba:	00 00 20    	mov\.w     #0x0, w0
 1bc:	00 00 88    	mov\.w     w0, 0x0
 1be:	00 00 e3    	cp\.w      0x0
 1c0:	00 20 ae    	btss\.b    0x0, #0x1
 1c2:	00 00 02    	call      0x0 \<_main\>
 1c4:	00 00 00 
 1c6:	00 00 20    	mov\.w     #0x0, w0
 1c8:	10 00 88    	mov\.w     w0, 0x2
 1ca:	00 00 e3    	cp\.w      0x0
 1cc:	00 20 ae    	btss\.b    0x0, #0x1
 1ce:	00 00 02    	call      0x0 \<_main\>
 1d0:	00 00 00 
 1d2:	f0 07 20    	mov\.w     #0x7f, w0
 1d4:	0e e0 b7    	mov\.b     WREG, 0xe
 1d6:	00 00 e3    	cp\.w      0x0
 1d8:	00 20 ae    	btss\.b    0x0, #0x1
 1da:	00 00 02    	call      0x0 \<_main\>
 1dc:	00 00 00 
 1de:	10 00 e2    	cp0\.w     0x10
 1e0:	00 20 ae    	btss\.b    0x0, #0x1
 1e2:	00 00 02    	call      0x0 \<_main\>
 1e4:	00 00 00 
 1e6:	06 20 ef    	clr\.w     0x6
 1e8:	08 00 a8    	bset\.b    0x8, #0x0
 1ea:	01 60 ae    	btss\.b    0x1, #0x3
 1ec:	00 00 02    	call      0x0 \<_main\>
 1ee:	00 00 00 
 1f0:	01 40 ae    	btss\.b    0x1, #0x2
 1f2:	00 00 02    	call      0x0 \<_main\>
 1f4:	00 00 00 
 1f6:	01 e0 ae    	btss\.b    0x1, #0x7
 1f8:	00 00 02    	call      0x0 \<_main\>
 1fa:	00 00 00 
 1fc:	01 a0 ae    	btss\.b    0x1, #0x5
 1fe:	00 00 02    	call      0x0 \<_main\>
 200:	00 00 00 
 202:	06 00 a8    	bset\.b    0x6, #0x0
 204:	08 20 ef    	clr\.w     0x8
 206:	01 c0 af    	btsc\.b    0x1, #0x6
 208:	00 00 02    	call      0x0 \<_main\>
 20a:	00 00 00 
 20c:	01 80 af    	btsc\.b    0x1, #0x4
 20e:	00 00 02    	call      0x0 \<_main\>
 210:	00 00 00 

00000212 \<test4\>:
 212:	04 20 ec    	inc\.w     0x4
 214:	12 01 c3    	clr       A
 216:	12 81 c3    	clr       B
 218:	00 20 ef    	clr\.w     0x0
 21a:	00 00 20    	mov\.w     #0x0, w0
 21c:	00 00 88    	mov\.w     w0, 0x0
 21e:	00 00 28    	mov\.w     #0x8000, w0
 220:	00 00 88    	mov\.w     w0, 0x0
 222:	f0 ff 2f    	mov\.w     #0xffff, w0
 224:	00 00 88    	mov\.w     w0, 0x0
 226:	f0 ff 2f    	mov\.w     #0xffff, w0
 228:	00 00 88    	mov\.w     w0, 0x0
 22a:	10 00 28    	mov\.w     #0x8001, w0
 22c:	00 00 88    	mov\.w     w0, 0x0
 22e:	f0 07 20    	mov\.w     #0x7f, w0
 230:	00 00 88    	mov\.w     w0, 0x0
 232:	00 b0 cb    	sub       B
 234:	f0 ff 2f    	mov\.w     #0xffff, w0
 236:	00 00 88    	mov\.w     w0, 0x0
 238:	00 20 a9    	bclr\.b    0x0, #0x1
 23a:	00 00 e3    	cp\.w      0x0
 23c:	00 20 ae    	btss\.b    0x0, #0x1
 23e:	00 00 02    	call      0x0 \<_main\>
 240:	00 00 00 
 242:	10 00 20    	mov\.w     #0x1, w0
 244:	10 00 88    	mov\.w     w0, 0x2
 246:	00 00 e3    	cp\.w      0x0
 248:	00 20 ae    	btss\.b    0x0, #0x1
 24a:	00 00 02    	call      0x0 \<_main\>
 24c:	00 00 00 
 24e:	00 f8 2f    	mov\.w     #0xff80, w0
 250:	0e e0 b7    	mov\.b     WREG, 0xe
 252:	00 00 e3    	cp\.w      0x0
 254:	00 20 ae    	btss\.b    0x0, #0x1
 256:	00 00 02    	call      0x0 \<_main\>
 258:	00 00 00 
 25a:	10 00 e2    	cp0\.w     0x10
 25c:	00 20 ae    	btss\.b    0x0, #0x1
 25e:	00 00 02    	call      0x0 \<_main\>
 260:	00 00 00 
 262:	00 00 20    	mov\.w     #0x0, w0
 264:	00 00 88    	mov\.w     w0, 0x0
 266:	00 20 a9    	bclr\.b    0x0, #0x1
 268:	00 00 e3    	cp\.w      0x0
 26a:	00 20 ae    	btss\.b    0x0, #0x1
 26c:	00 00 02    	call      0x0 \<_main\>
 26e:	00 00 00 
 270:	00 00 28    	mov\.w     #0x8000, w0
 272:	10 00 88    	mov\.w     w0, 0x2
 274:	00 00 e3    	cp\.w      0x0
 276:	00 20 ae    	btss\.b    0x0, #0x1
 278:	00 00 02    	call      0x0 \<_main\>
 27a:	00 00 00 
 27c:	f0 ff 2f    	mov\.w     #0xffff, w0
 27e:	0e e0 b7    	mov\.b     WREG, 0xe
 280:	00 00 e3    	cp\.w      0x0
 282:	00 20 ae    	btss\.b    0x0, #0x1
 284:	00 00 02    	call      0x0 \<_main\>
 286:	00 00 00 
 288:	10 00 e2    	cp0\.w     0x10
 28a:	00 20 ae    	btss\.b    0x0, #0x1
 28c:	00 00 02    	call      0x0 \<_main\>
 28e:	00 00 00 
 290:	06 20 ef    	clr\.w     0x6
 292:	08 00 a8    	bset\.b    0x8, #0x0
 294:	01 c0 ae    	btss\.b    0x1, #0x6
 296:	00 00 02    	call      0x0 \<_main\>
 298:	00 00 00 
 29a:	01 80 ae    	btss\.b    0x1, #0x4
 29c:	00 00 02    	call      0x0 \<_main\>
 29e:	00 00 00 
 2a0:	01 60 ae    	btss\.b    0x1, #0x3
 2a2:	00 00 02    	call      0x0 \<_main\>
 2a4:	00 00 00 
 2a6:	01 40 ae    	btss\.b    0x1, #0x2
 2a8:	00 00 02    	call      0x0 \<_main\>
 2aa:	00 00 00 
 2ac:	06 00 a8    	bset\.b    0x6, #0x0
 2ae:	08 20 ef    	clr\.w     0x8
 2b0:	01 e0 af    	btsc\.b    0x1, #0x7
 2b2:	00 00 02    	call      0x0 \<_main\>
 2b4:	00 00 00 
 2b6:	01 a0 af    	btsc\.b    0x1, #0x5
 2b8:	00 00 02    	call      0x0 \<_main\>
 2ba:	00 00 00 
 2bc:	00 e0 a8    	bset\.b    0x0, #0x7
 2be:	00 c0 a8    	bset\.b    0x0, #0x6
 2c0:	00 80 a9    	bclr\.b    0x0, #0x4
 2c2:	00 00 04    	goto      0x0 \<_main\>
 2c4:	00 00 00 

000002c6 \<test5\>:
 2c6:	04 20 ec    	inc\.w     0x4
 2c8:	12 01 c3    	clr       A
 2ca:	12 81 c3    	clr       B
 2cc:	00 20 ef    	clr\.w     0x0
 2ce:	40 00 20    	mov\.w     #0x4, w0
 2d0:	00 00 88    	mov\.w     w0, 0x0
 2d2:	00 00 28    	mov\.w     #0x8000, w0
 2d4:	00 00 88    	mov\.w     w0, 0x0
 2d6:	f0 ff 2f    	mov\.w     #0xffff, w0
 2d8:	00 00 88    	mov\.w     w0, 0x0
 2da:	60 00 20    	mov\.w     #0x6, w0
 2dc:	00 00 88    	mov\.w     w0, 0x0
 2de:	00 f0 2f    	mov\.w     #0xff00, w0
 2e0:	00 00 88    	mov\.w     w0, 0x0
 2e2:	f0 ff 2f    	mov\.w     #0xffff, w0
 2e4:	00 00 88    	mov\.w     w0, 0x0
 2e6:	00 30 cb    	sub       A
 2e8:	e0 ff 2f    	mov\.w     #0xfffe, w0
 2ea:	00 00 88    	mov\.w     w0, 0x0
 2ec:	00 20 a9    	bclr\.b    0x0, #0x1
 2ee:	00 00 e3    	cp\.w      0x0
 2f0:	00 20 ae    	btss\.b    0x0, #0x1
 2f2:	00 00 02    	call      0x0 \<_main\>
 2f4:	00 00 00 
 2f6:	f0 0f 28    	mov\.w     #0x80ff, w0
 2f8:	10 00 88    	mov\.w     w0, 0x2
 2fa:	00 00 e3    	cp\.w      0x0
 2fc:	00 20 ae    	btss\.b    0x0, #0x1
 2fe:	00 00 02    	call      0x0 \<_main\>
 300:	00 00 00 
 302:	f0 ff 2f    	mov\.w     #0xffff, w0
 304:	0e e0 b7    	mov\.b     WREG, 0xe
 306:	00 00 e3    	cp\.w      0x0
 308:	00 20 ae    	btss\.b    0x0, #0x1
 30a:	00 00 02    	call      0x0 \<_main\>
 30c:	00 00 00 
 30e:	10 00 e2    	cp0\.w     0x10
 310:	00 20 ae    	btss\.b    0x0, #0x1
 312:	00 00 02    	call      0x0 \<_main\>
 314:	00 00 00 
 316:	60 00 20    	mov\.w     #0x6, w0
 318:	00 00 88    	mov\.w     w0, 0x0
 31a:	00 00 e3    	cp\.w      0x0
 31c:	00 20 ae    	btss\.b    0x0, #0x1
 31e:	00 00 02    	call      0x0 \<_main\>
 320:	00 00 00 
 322:	00 f0 2f    	mov\.w     #0xff00, w0
 324:	10 00 88    	mov\.w     w0, 0x2
 326:	00 00 e3    	cp\.w      0x0
 328:	00 20 ae    	btss\.b    0x0, #0x1
 32a:	00 00 02    	call      0x0 \<_main\>
 32c:	00 00 00 
 32e:	f0 ff 2f    	mov\.w     #0xffff, w0
 330:	0e e0 b7    	mov\.b     WREG, 0xe
 332:	00 00 e3    	cp\.w      0x0
 334:	00 20 ae    	btss\.b    0x0, #0x1
 336:	00 00 02    	call      0x0 \<_main\>
 338:	00 00 00 
 33a:	10 00 e2    	cp0\.w     0x10
 33c:	00 20 ae    	btss\.b    0x0, #0x1
 33e:	00 00 02    	call      0x0 \<_main\>
 340:	00 00 00 
 342:	06 00 a8    	bset\.b    0x6, #0x0
 344:	08 20 ef    	clr\.w     0x8
 346:	01 c0 af    	btsc\.b    0x1, #0x6
 348:	00 00 02    	call      0x0 \<_main\>
 34a:	00 00 00 
 34c:	01 80 af    	btsc\.b    0x1, #0x4
 34e:	00 00 02    	call      0x0 \<_main\>
 350:	00 00 00 
 352:	01 60 af    	btsc\.b    0x1, #0x3
 354:	00 00 02    	call      0x0 \<_main\>
 356:	00 00 00 
 358:	01 40 af    	btsc\.b    0x1, #0x2
 35a:	00 00 02    	call      0x0 \<_main\>
 35c:	00 00 00 
 35e:	01 e0 af    	btsc\.b    0x1, #0x7
 360:	00 00 02    	call      0x0 \<_main\>
 362:	00 00 00 
 364:	01 a0 af    	btsc\.b    0x1, #0x5
 366:	00 00 02    	call      0x0 \<_main\>
 368:	00 00 00 

0000036a \<test6\>:
 36a:	04 20 ec    	inc\.w     0x4
 36c:	12 01 c3    	clr       A
 36e:	12 81 c3    	clr       B
 370:	00 20 ef    	clr\.w     0x0
 372:	40 00 2f    	mov\.w     #0xf004, w0
 374:	00 00 88    	mov\.w     w0, 0x0
 376:	a0 ff 2b    	mov\.w     #0xbffa, w0
 378:	00 00 88    	mov\.w     w0, 0x0
 37a:	f0 ff 2f    	mov\.w     #0xffff, w0
 37c:	00 00 88    	mov\.w     w0, 0x0
 37e:	40 00 2f    	mov\.w     #0xf004, w0
 380:	00 00 88    	mov\.w     w0, 0x0
 382:	80 ff 23    	mov\.w     #0x3ff8, w0
 384:	00 00 88    	mov\.w     w0, 0x0
 386:	00 00 20    	mov\.w     #0x0, w0
 388:	00 00 88    	mov\.w     w0, 0x0
 38a:	00 b0 cb    	sub       B
 38c:	00 00 20    	mov\.w     #0x0, w0
 38e:	00 00 88    	mov\.w     w0, 0x0
 390:	00 20 a9    	bclr\.b    0x0, #0x1
 392:	00 00 e3    	cp\.w      0x0
 394:	00 20 ae    	btss\.b    0x0, #0x1
 396:	00 00 02    	call      0x0 \<_main\>
 398:	00 00 00 
 39a:	e0 ff 27    	mov\.w     #0x7ffe, w0
 39c:	10 00 88    	mov\.w     w0, 0x2
 39e:	00 00 e3    	cp\.w      0x0
 3a0:	00 20 ae    	btss\.b    0x0, #0x1
 3a2:	00 00 02    	call      0x0 \<_main\>
 3a4:	00 00 00 
 3a6:	00 00 20    	mov\.w     #0x0, w0
 3a8:	0e e0 b7    	mov\.b     WREG, 0xe
 3aa:	00 00 e3    	cp\.w      0x0
 3ac:	00 20 ae    	btss\.b    0x0, #0x1
 3ae:	00 00 02    	call      0x0 \<_main\>
 3b0:	00 00 00 
 3b2:	10 00 e2    	cp0\.w     0x10
 3b4:	00 20 ae    	btss\.b    0x0, #0x1
 3b6:	00 00 02    	call      0x0 \<_main\>
 3b8:	00 00 00 
 3ba:	40 00 2f    	mov\.w     #0xf004, w0
 3bc:	00 00 88    	mov\.w     w0, 0x0
 3be:	00 00 e3    	cp\.w      0x0
 3c0:	00 20 ae    	btss\.b    0x0, #0x1
 3c2:	00 00 02    	call      0x0 \<_main\>
 3c4:	00 00 00 
 3c6:	a0 ff 2b    	mov\.w     #0xbffa, w0
 3c8:	10 00 88    	mov\.w     w0, 0x2
 3ca:	00 00 e3    	cp\.w      0x0
 3cc:	00 20 ae    	btss\.b    0x0, #0x1
 3ce:	00 00 02    	call      0x0 \<_main\>
 3d0:	00 00 00 
 3d2:	f0 ff 2f    	mov\.w     #0xffff, w0
 3d4:	0e e0 b7    	mov\.b     WREG, 0xe
 3d6:	00 00 e3    	cp\.w      0x0
 3d8:	00 20 ae    	btss\.b    0x0, #0x1
 3da:	00 00 02    	call      0x0 \<_main\>
 3dc:	00 00 00 
 3de:	10 00 e2    	cp0\.w     0x10
 3e0:	00 20 ae    	btss\.b    0x0, #0x1
 3e2:	00 00 02    	call      0x0 \<_main\>
 3e4:	00 00 00 
 3e6:	06 00 a8    	bset\.b    0x6, #0x0
 3e8:	08 20 ef    	clr\.w     0x8
 3ea:	01 c0 af    	btsc\.b    0x1, #0x6
 3ec:	00 00 02    	call      0x0 \<_main\>
 3ee:	00 00 00 
 3f0:	01 80 af    	btsc\.b    0x1, #0x4
 3f2:	00 00 02    	call      0x0 \<_main\>
 3f4:	00 00 00 
 3f6:	01 60 af    	btsc\.b    0x1, #0x3
 3f8:	00 00 02    	call      0x0 \<_main\>
 3fa:	00 00 00 
 3fc:	01 40 af    	btsc\.b    0x1, #0x2
 3fe:	00 00 02    	call      0x0 \<_main\>
 400:	00 00 00 
 402:	01 e0 af    	btsc\.b    0x1, #0x7
 404:	00 00 02    	call      0x0 \<_main\>
 406:	00 00 00 
 408:	01 a0 af    	btsc\.b    0x1, #0x5
 40a:	00 00 02    	call      0x0 \<_main\>
 40c:	00 00 00 

0000040e \<test7\>:
 40e:	04 20 ec    	inc\.w     0x4
 410:	12 01 c3    	clr       A
 412:	12 81 c3    	clr       B
 414:	00 20 ef    	clr\.w     0x0
 416:	e0 ff 2f    	mov\.w     #0xfffe, w0
 418:	00 00 88    	mov\.w     w0, 0x0
 41a:	00 80 24    	mov\.w     #0x4800, w0
 41c:	00 00 88    	mov\.w     w0, 0x0
 41e:	00 00 20    	mov\.w     #0x0, w0
 420:	00 00 88    	mov\.w     w0, 0x0
 422:	e0 ff 2f    	mov\.w     #0xfffe, w0
 424:	00 00 88    	mov\.w     w0, 0x0
 426:	00 80 2c    	mov\.w     #0xc800, w0
 428:	00 00 88    	mov\.w     w0, 0x0
 42a:	f0 0f 20    	mov\.w     #0xff, w0
 42c:	00 00 88    	mov\.w     w0, 0x0
 42e:	00 30 cb    	sub       A
 430:	f0 ff 2f    	mov\.w     #0xffff, w0
 432:	00 00 88    	mov\.w     w0, 0x0
 434:	00 20 a9    	bclr\.b    0x0, #0x1
 436:	00 00 e3    	cp\.w      0x0
 438:	00 20 ae    	btss\.b    0x0, #0x1
 43a:	00 00 02    	call      0x0 \<_main\>
 43c:	00 00 00 
 43e:	f0 ff 27    	mov\.w     #0x7fff, w0
 440:	10 00 88    	mov\.w     w0, 0x2
 442:	00 00 e3    	cp\.w      0x0
 444:	00 20 ae    	btss\.b    0x0, #0x1
 446:	00 00 02    	call      0x0 \<_main\>
 448:	00 00 00 
 44a:	00 00 20    	mov\.w     #0x0, w0
 44c:	0e e0 b7    	mov\.b     WREG, 0xe
 44e:	00 00 e3    	cp\.w      0x0
 450:	00 20 ae    	btss\.b    0x0, #0x1
 452:	00 00 02    	call      0x0 \<_main\>
 454:	00 00 00 
 456:	10 00 e2    	cp0\.w     0x10
 458:	00 20 ae    	btss\.b    0x0, #0x1
 45a:	00 00 02    	call      0x0 \<_main\>
 45c:	00 00 00 
 45e:	e0 ff 2f    	mov\.w     #0xfffe, w0
 460:	00 00 88    	mov\.w     w0, 0x0
 462:	00 00 e3    	cp\.w      0x0
 464:	00 20 ae    	btss\.b    0x0, #0x1
 466:	00 00 02    	call      0x0 \<_main\>
 468:	00 00 00 
 46a:	00 80 2c    	mov\.w     #0xc800, w0
 46c:	10 00 88    	mov\.w     w0, 0x2
 46e:	00 00 e3    	cp\.w      0x0
 470:	00 20 ae    	btss\.b    0x0, #0x1
 472:	00 00 02    	call      0x0 \<_main\>
 474:	00 00 00 
 476:	f0 ff 2f    	mov\.w     #0xffff, w0
 478:	0e e0 b7    	mov\.b     WREG, 0xe
 47a:	00 00 e3    	cp\.w      0x0
 47c:	00 20 ae    	btss\.b    0x0, #0x1
 47e:	00 00 02    	call      0x0 \<_main\>
 480:	00 00 00 
 482:	10 00 e2    	cp0\.w     0x10
 484:	00 20 ae    	btss\.b    0x0, #0x1
 486:	00 00 02    	call      0x0 \<_main\>
 488:	00 00 00 
 48a:	06 00 a8    	bset\.b    0x6, #0x0
 48c:	08 20 ef    	clr\.w     0x8
 48e:	01 c0 af    	btsc\.b    0x1, #0x6
 490:	00 00 02    	call      0x0 \<_main\>
 492:	00 00 00 
 494:	01 80 af    	btsc\.b    0x1, #0x4
 496:	00 00 02    	call      0x0 \<_main\>
 498:	00 00 00 
 49a:	01 60 af    	btsc\.b    0x1, #0x3
 49c:	00 00 02    	call      0x0 \<_main\>
 49e:	00 00 00 
 4a0:	06 20 ef    	clr\.w     0x6
 4a2:	08 00 a8    	bset\.b    0x8, #0x0
 4a4:	01 40 ae    	btss\.b    0x1, #0x2
 4a6:	00 00 02    	call      0x0 \<_main\>
 4a8:	00 00 00 
 4aa:	01 e0 af    	btsc\.b    0x1, #0x7
 4ac:	00 00 02    	call      0x0 \<_main\>
 4ae:	00 00 00 
 4b0:	01 a0 ae    	btss\.b    0x1, #0x5
 4b2:	00 00 02    	call      0x0 \<_main\>
 4b4:	00 00 00 

000004b6 \<test8\>:
 4b6:	04 20 ec    	inc\.w     0x4
 4b8:	12 01 c3    	clr       A
 4ba:	12 81 c3    	clr       B
 4bc:	00 20 ef    	clr\.w     0x0
 4be:	f0 ff 2f    	mov\.w     #0xffff, w0
 4c0:	00 00 88    	mov\.w     w0, 0x0
 4c2:	f0 ff 27    	mov\.w     #0x7fff, w0
 4c4:	00 00 88    	mov\.w     w0, 0x0
 4c6:	00 00 20    	mov\.w     #0x0, w0
 4c8:	00 00 88    	mov\.w     w0, 0x0
 4ca:	f0 ff 2f    	mov\.w     #0xffff, w0
 4cc:	00 00 88    	mov\.w     w0, 0x0
 4ce:	80 08 2c    	mov\.w     #0xc088, w0
 4d0:	00 00 88    	mov\.w     w0, 0x0
 4d2:	00 f8 2f    	mov\.w     #0xff80, w0
 4d4:	00 00 88    	mov\.w     w0, 0x0
 4d6:	00 b0 cb    	sub       B
 4d8:	00 00 20    	mov\.w     #0x0, w0
 4da:	00 00 88    	mov\.w     w0, 0x0
 4dc:	00 20 a9    	bclr\.b    0x0, #0x1
 4de:	00 00 e3    	cp\.w      0x0
 4e0:	00 20 ae    	btss\.b    0x0, #0x1
 4e2:	00 00 02    	call      0x0 \<_main\>
 4e4:	00 00 00 
 4e6:	00 00 28    	mov\.w     #0x8000, w0
 4e8:	10 00 88    	mov\.w     w0, 0x2
 4ea:	00 00 e3    	cp\.w      0x0
 4ec:	00 20 ae    	btss\.b    0x0, #0x1
 4ee:	00 00 02    	call      0x0 \<_main\>
 4f0:	00 00 00 
 4f2:	f0 ff 2f    	mov\.w     #0xffff, w0
 4f4:	0e e0 b7    	mov\.b     WREG, 0xe
 4f6:	00 00 e3    	cp\.w      0x0
 4f8:	00 20 ae    	btss\.b    0x0, #0x1
 4fa:	00 00 02    	call      0x0 \<_main\>
 4fc:	00 00 00 
 4fe:	10 00 e2    	cp0\.w     0x10
 500:	00 20 ae    	btss\.b    0x0, #0x1
 502:	00 00 02    	call      0x0 \<_main\>
 504:	00 00 00 
 506:	f0 ff 2f    	mov\.w     #0xffff, w0
 508:	00 00 88    	mov\.w     w0, 0x0
 50a:	00 00 e3    	cp\.w      0x0
 50c:	00 20 ae    	btss\.b    0x0, #0x1
 50e:	00 00 02    	call      0x0 \<_main\>
 510:	00 00 00 
 512:	f0 ff 27    	mov\.w     #0x7fff, w0
 514:	10 00 88    	mov\.w     w0, 0x2
 516:	00 00 e3    	cp\.w      0x0
 518:	00 20 ae    	btss\.b    0x0, #0x1
 51a:	00 00 02    	call      0x0 \<_main\>
 51c:	00 00 00 
 51e:	00 00 20    	mov\.w     #0x0, w0
 520:	0e e0 b7    	mov\.b     WREG, 0xe
 522:	00 00 e3    	cp\.w      0x0
 524:	00 20 ae    	btss\.b    0x0, #0x1
 526:	00 00 02    	call      0x0 \<_main\>
 528:	00 00 00 
 52a:	10 00 e2    	cp0\.w     0x10
 52c:	00 20 ae    	btss\.b    0x0, #0x1
 52e:	00 00 02    	call      0x0 \<_main\>
 530:	00 00 00 
 532:	06 20 ef    	clr\.w     0x6
 534:	08 00 a8    	bset\.b    0x8, #0x0
 536:	01 80 ae    	btss\.b    0x1, #0x4
 538:	00 00 02    	call      0x0 \<_main\>
 53a:	00 00 00 
 53c:	01 40 ae    	btss\.b    0x1, #0x2
 53e:	00 00 02    	call      0x0 \<_main\>
 540:	00 00 00 
 542:	06 00 a8    	bset\.b    0x6, #0x0
 544:	08 20 ef    	clr\.w     0x8
 546:	01 c0 af    	btsc\.b    0x1, #0x6
 548:	00 00 02    	call      0x0 \<_main\>
 54a:	00 00 00 
 54c:	01 60 af    	btsc\.b    0x1, #0x3
 54e:	00 00 02    	call      0x0 \<_main\>
 550:	00 00 00 
 552:	01 e0 af    	btsc\.b    0x1, #0x7
 554:	00 00 02    	call      0x0 \<_main\>
 556:	00 00 00 
 558:	01 a0 af    	btsc\.b    0x1, #0x5
 55a:	00 00 02    	call      0x0 \<_main\>
 55c:	00 00 00 
 55e:	00 e0 a8    	bset\.b    0x0, #0x7
 560:	00 c0 a8    	bset\.b    0x0, #0x6
 562:	00 80 a8    	bset\.b    0x0, #0x4

00000564 \<test9\>:
 564:	04 20 ec    	inc\.w     0x4
 566:	12 01 c3    	clr       A
 568:	12 81 c3    	clr       B
 56a:	00 20 ef    	clr\.w     0x0
 56c:	f0 0f 27    	mov\.w     #0x70ff, w0
 56e:	00 00 88    	mov\.w     w0, 0x0
 570:	10 00 28    	mov\.w     #0x8001, w0
 572:	00 00 88    	mov\.w     w0, 0x0
 574:	f0 ff 2f    	mov\.w     #0xffff, w0
 576:	00 00 88    	mov\.w     w0, 0x0
 578:	f0 0f 27    	mov\.w     #0x70ff, w0
 57a:	00 00 88    	mov\.w     w0, 0x0
 57c:	10 00 20    	mov\.w     #0x1, w0
 57e:	00 00 88    	mov\.w     w0, 0x0
 580:	00 00 20    	mov\.w     #0x0, w0
 582:	00 00 88    	mov\.w     w0, 0x0
 584:	00 30 cb    	sub       A
 586:	00 00 20    	mov\.w     #0x0, w0
 588:	00 00 88    	mov\.w     w0, 0x0
 58a:	00 20 a9    	bclr\.b    0x0, #0x1
 58c:	00 00 e3    	cp\.w      0x0
 58e:	00 20 ae    	btss\.b    0x0, #0x1
 590:	00 00 02    	call      0x0 \<_main\>
 592:	00 00 00 
 594:	00 00 28    	mov\.w     #0x8000, w0
 596:	10 00 88    	mov\.w     w0, 0x2
 598:	00 00 e3    	cp\.w      0x0
 59a:	00 20 ae    	btss\.b    0x0, #0x1
 59c:	00 00 02    	call      0x0 \<_main\>
 59e:	00 00 00 
 5a0:	f0 ff 2f    	mov\.w     #0xffff, w0
 5a2:	0e e0 b7    	mov\.b     WREG, 0xe
 5a4:	00 00 e3    	cp\.w      0x0
 5a6:	00 20 ae    	btss\.b    0x0, #0x1
 5a8:	00 00 02    	call      0x0 \<_main\>
 5aa:	00 00 00 
 5ac:	10 00 e2    	cp0\.w     0x10
 5ae:	00 20 ae    	btss\.b    0x0, #0x1
 5b0:	00 00 02    	call      0x0 \<_main\>
 5b2:	00 00 00 
 5b4:	f0 0f 27    	mov\.w     #0x70ff, w0
 5b6:	00 00 88    	mov\.w     w0, 0x0
 5b8:	00 00 e3    	cp\.w      0x0
 5ba:	00 20 ae    	btss\.b    0x0, #0x1
 5bc:	00 00 02    	call      0x0 \<_main\>
 5be:	00 00 00 
 5c0:	10 00 20    	mov\.w     #0x1, w0
 5c2:	10 00 88    	mov\.w     w0, 0x2
 5c4:	00 00 e3    	cp\.w      0x0
 5c6:	00 20 ae    	btss\.b    0x0, #0x1
 5c8:	00 00 02    	call      0x0 \<_main\>
 5ca:	00 00 00 
 5cc:	00 00 20    	mov\.w     #0x0, w0
 5ce:	0e e0 b7    	mov\.b     WREG, 0xe
 5d0:	00 00 e3    	cp\.w      0x0
 5d2:	00 20 ae    	btss\.b    0x0, #0x1
 5d4:	00 00 02    	call      0x0 \<_main\>
 5d6:	00 00 00 
 5d8:	10 00 e2    	cp0\.w     0x10
 5da:	00 20 ae    	btss\.b    0x0, #0x1
 5dc:	00 00 02    	call      0x0 \<_main\>
 5de:	00 00 00 
 5e0:	06 00 a8    	bset\.b    0x6, #0x0
 5e2:	08 20 ef    	clr\.w     0x8
 5e4:	01 c0 af    	btsc\.b    0x1, #0x6
 5e6:	00 00 02    	call      0x0 \<_main\>
 5e8:	00 00 00 
 5ea:	01 80 af    	btsc\.b    0x1, #0x4
 5ec:	00 00 02    	call      0x0 \<_main\>
 5ee:	00 00 00 
 5f0:	01 60 af    	btsc\.b    0x1, #0x3
 5f2:	00 00 02    	call      0x0 \<_main\>
 5f4:	00 00 00 
 5f6:	01 40 af    	btsc\.b    0x1, #0x2
 5f8:	00 00 02    	call      0x0 \<_main\>
 5fa:	00 00 00 
 5fc:	01 e0 af    	btsc\.b    0x1, #0x7
 5fe:	00 00 02    	call      0x0 \<_main\>
 600:	00 00 00 
 602:	01 a0 af    	btsc\.b    0x1, #0x5
 604:	00 00 02    	call      0x0 \<_main\>
 606:	00 00 00 
 608:	00 00 04    	goto      0x0 \<_main\>
 60a:	00 00 00 

0000060c \<test10\>:
 60c:	04 20 ec    	inc\.w     0x4
 60e:	12 01 c3    	clr       A
 610:	12 81 c3    	clr       B
 612:	00 20 ef    	clr\.w     0x0
 614:	20 00 28    	mov\.w     #0x8002, w0
 616:	00 00 88    	mov\.w     w0, 0x0
 618:	f0 0f 2f    	mov\.w     #0xf0ff, w0
 61a:	00 00 88    	mov\.w     w0, 0x0
 61c:	f0 0f 20    	mov\.w     #0xff, w0
 61e:	00 00 88    	mov\.w     w0, 0x0
 620:	20 00 28    	mov\.w     #0x8002, w0
 622:	00 00 88    	mov\.w     w0, 0x0
 624:	f0 0f 27    	mov\.w     #0x70ff, w0
 626:	00 00 88    	mov\.w     w0, 0x0
 628:	00 00 20    	mov\.w     #0x0, w0
 62a:	00 00 88    	mov\.w     w0, 0x0
 62c:	00 b0 cb    	sub       B
 62e:	00 00 20    	mov\.w     #0x0, w0
 630:	00 00 88    	mov\.w     w0, 0x0
 632:	00 20 a9    	bclr\.b    0x0, #0x1
 634:	00 00 e3    	cp\.w      0x0
 636:	00 20 ae    	btss\.b    0x0, #0x1
 638:	00 00 02    	call      0x0 \<_main\>
 63a:	00 00 00 
 63c:	00 00 28    	mov\.w     #0x8000, w0
 63e:	10 00 88    	mov\.w     w0, 0x2
 640:	00 00 e3    	cp\.w      0x0
 642:	00 20 ae    	btss\.b    0x0, #0x1
 644:	00 00 02    	call      0x0 \<_main\>
 646:	00 00 00 
 648:	00 00 20    	mov\.w     #0x0, w0
 64a:	0e e0 b7    	mov\.b     WREG, 0xe
 64c:	00 00 e3    	cp\.w      0x0
 64e:	00 20 ae    	btss\.b    0x0, #0x1
 650:	00 00 02    	call      0x0 \<_main\>
 652:	00 00 00 
 654:	10 00 e2    	cp0\.w     0x10
 656:	00 20 ae    	btss\.b    0x0, #0x1
 658:	00 00 02    	call      0x0 \<_main\>
 65a:	00 00 00 
 65c:	20 00 28    	mov\.w     #0x8002, w0
 65e:	00 00 88    	mov\.w     w0, 0x0
 660:	00 00 e3    	cp\.w      0x0
 662:	00 20 ae    	btss\.b    0x0, #0x1
 664:	00 00 02    	call      0x0 \<_main\>
 666:	00 00 00 
 668:	f0 0f 2f    	mov\.w     #0xf0ff, w0
 66a:	10 00 88    	mov\.w     w0, 0x2
 66c:	00 00 e3    	cp\.w      0x0
 66e:	00 20 ae    	btss\.b    0x0, #0x1
 670:	00 00 02    	call      0x0 \<_main\>
 672:	00 00 00 
 674:	f0 ff 2f    	mov\.w     #0xffff, w0
 676:	0e e0 b7    	mov\.b     WREG, 0xe
 678:	00 00 e3    	cp\.w      0x0
 67a:	00 20 ae    	btss\.b    0x0, #0x1
 67c:	00 00 02    	call      0x0 \<_main\>
 67e:	00 00 00 
 680:	10 00 e2    	cp0\.w     0x10
 682:	00 20 ae    	btss\.b    0x0, #0x1
 684:	00 00 02    	call      0x0 \<_main\>
 686:	00 00 00 
 688:	06 20 ef    	clr\.w     0x6
 68a:	08 00 a8    	bset\.b    0x8, #0x0
 68c:	01 c0 ae    	btss\.b    0x1, #0x6
 68e:	00 00 02    	call      0x0 \<_main\>
 690:	00 00 00 
 692:	01 60 ae    	btss\.b    0x1, #0x3
 694:	00 00 02    	call      0x0 \<_main\>
 696:	00 00 00 
 698:	06 00 a8    	bset\.b    0x6, #0x0
 69a:	08 20 ef    	clr\.w     0x8
 69c:	01 80 af    	btsc\.b    0x1, #0x4
 69e:	00 00 02    	call      0x0 \<_main\>
 6a0:	00 00 00 
 6a2:	01 40 af    	btsc\.b    0x1, #0x2
 6a4:	00 00 02    	call      0x0 \<_main\>
 6a6:	00 00 00 
 6a8:	01 e0 af    	btsc\.b    0x1, #0x7
 6aa:	00 00 02    	call      0x0 \<_main\>
 6ac:	00 00 00 
 6ae:	01 a0 af    	btsc\.b    0x1, #0x5
 6b0:	00 00 02    	call      0x0 \<_main\>
 6b2:	00 00 00 
 6b4:	00 00 04    	goto      0x0 \<_main\>
 6b6:	00 00 00 

000006b8 \<test11\>:
 6b8:	04 20 ec    	inc\.w     0x4
 6ba:	12 01 c3    	clr       A
 6bc:	12 81 c3    	clr       B
 6be:	00 20 ef    	clr\.w     0x0
 6c0:	f0 ff 2f    	mov\.w     #0xffff, w0
 6c2:	00 00 88    	mov\.w     w0, 0x0
 6c4:	20 00 28    	mov\.w     #0x8002, w0
 6c6:	00 00 88    	mov\.w     w0, 0x0
 6c8:	f0 0f 20    	mov\.w     #0xff, w0
 6ca:	00 00 88    	mov\.w     w0, 0x0
 6cc:	00 00 20    	mov\.w     #0x0, w0
 6ce:	00 00 88    	mov\.w     w0, 0x0
 6d0:	30 f0 2f    	mov\.w     #0xff03, w0
 6d2:	00 00 88    	mov\.w     w0, 0x0
 6d4:	f0 07 20    	mov\.w     #0x7f, w0
 6d6:	00 00 88    	mov\.w     w0, 0x0
 6d8:	00 30 cb    	sub       A
 6da:	00 00 20    	mov\.w     #0x0, w0
 6dc:	00 00 88    	mov\.w     w0, 0x0
 6de:	00 20 a9    	bclr\.b    0x0, #0x1
 6e0:	00 00 e3    	cp\.w      0x0
 6e2:	00 20 ae    	btss\.b    0x0, #0x1
 6e4:	00 00 02    	call      0x0 \<_main\>
 6e6:	00 00 00 
 6e8:	00 00 20    	mov\.w     #0x0, w0
 6ea:	10 00 88    	mov\.w     w0, 0x2
 6ec:	00 00 e3    	cp\.w      0x0
 6ee:	00 20 ae    	btss\.b    0x0, #0x1
 6f0:	00 00 02    	call      0x0 \<_main\>
 6f2:	00 00 00 
 6f4:	00 f8 2f    	mov\.w     #0xff80, w0
 6f6:	0e e0 b7    	mov\.b     WREG, 0xe
 6f8:	00 00 e3    	cp\.w      0x0
 6fa:	00 20 ae    	btss\.b    0x0, #0x1
 6fc:	00 00 02    	call      0x0 \<_main\>
 6fe:	00 00 00 
 700:	10 00 e2    	cp0\.w     0x10
 702:	00 20 ae    	btss\.b    0x0, #0x1
 704:	00 00 02    	call      0x0 \<_main\>
 706:	00 00 00 
 708:	00 00 20    	mov\.w     #0x0, w0
 70a:	00 00 88    	mov\.w     w0, 0x0
 70c:	00 00 e3    	cp\.w      0x0
 70e:	00 20 ae    	btss\.b    0x0, #0x1
 710:	00 00 02    	call      0x0 \<_main\>
 712:	00 00 00 
 714:	30 f0 2f    	mov\.w     #0xff03, w0
 716:	10 00 88    	mov\.w     w0, 0x2
 718:	00 00 e3    	cp\.w      0x0
 71a:	00 20 ae    	btss\.b    0x0, #0x1
 71c:	00 00 02    	call      0x0 \<_main\>
 71e:	00 00 00 
 720:	f0 07 20    	mov\.w     #0x7f, w0
 722:	0e e0 b7    	mov\.b     WREG, 0xe
 724:	00 00 e3    	cp\.w      0x0
 726:	00 20 ae    	btss\.b    0x0, #0x1
 728:	00 00 02    	call      0x0 \<_main\>
 72a:	00 00 00 
 72c:	10 00 e2    	cp0\.w     0x10
 72e:	00 20 ae    	btss\.b    0x0, #0x1
 730:	00 00 02    	call      0x0 \<_main\>
 732:	00 00 00 
 734:	06 00 a8    	bset\.b    0x6, #0x0
 736:	08 20 ef    	clr\.w     0x8
 738:	01 c0 af    	btsc\.b    0x1, #0x6
 73a:	00 00 02    	call      0x0 \<_main\>
 73c:	00 00 00 
 73e:	01 80 af    	btsc\.b    0x1, #0x4
 740:	00 00 02    	call      0x0 \<_main\>
 742:	00 00 00 
 744:	06 20 ef    	clr\.w     0x6
 746:	08 00 a8    	bset\.b    0x8, #0x0
 748:	01 60 ae    	btss\.b    0x1, #0x3
 74a:	00 00 02    	call      0x0 \<_main\>
 74c:	00 00 00 
 74e:	01 40 ae    	btss\.b    0x1, #0x2
 750:	00 00 02    	call      0x0 \<_main\>
 752:	00 00 00 
 754:	01 e0 ae    	btss\.b    0x1, #0x7
 756:	00 00 02    	call      0x0 \<_main\>
 758:	00 00 00 
 75a:	01 a0 ae    	btss\.b    0x1, #0x5
 75c:	00 00 02    	call      0x0 \<_main\>
 75e:	00 00 00 
 760:	00 00 04    	goto      0x0 \<_main\>
 762:	00 00 00 

00000764 \<test12\>:
 764:	04 20 ec    	inc\.w     0x4
 766:	12 01 c3    	clr       A
 768:	12 81 c3    	clr       B
 76a:	00 20 ef    	clr\.w     0x0
 76c:	00 00 20    	mov\.w     #0x0, w0
 76e:	00 00 88    	mov\.w     w0, 0x0
 770:	00 00 28    	mov\.w     #0x8000, w0
 772:	00 00 88    	mov\.w     w0, 0x0
 774:	f0 ff 2f    	mov\.w     #0xffff, w0
 776:	00 00 88    	mov\.w     w0, 0x0
 778:	00 00 28    	mov\.w     #0x8000, w0
 77a:	00 00 88    	mov\.w     w0, 0x0
 77c:	e0 ff 2f    	mov\.w     #0xfffe, w0
 77e:	00 00 88    	mov\.w     w0, 0x0
 780:	f0 07 20    	mov\.w     #0x7f, w0
 782:	00 00 88    	mov\.w     w0, 0x0
 784:	00 b0 cb    	sub       B
 786:	f0 ff 2f    	mov\.w     #0xffff, w0
 788:	00 00 88    	mov\.w     w0, 0x0
 78a:	00 20 a9    	bclr\.b    0x0, #0x1
 78c:	00 00 e3    	cp\.w      0x0
 78e:	00 20 ae    	btss\.b    0x0, #0x1
 790:	00 00 02    	call      0x0 \<_main\>
 792:	00 00 00 
 794:	f0 ff 2f    	mov\.w     #0xffff, w0
 796:	10 00 88    	mov\.w     w0, 0x2
 798:	00 00 e3    	cp\.w      0x0
 79a:	00 20 ae    	btss\.b    0x0, #0x1
 79c:	00 00 02    	call      0x0 \<_main\>
 79e:	00 00 00 
 7a0:	f0 07 20    	mov\.w     #0x7f, w0
 7a2:	0e e0 b7    	mov\.b     WREG, 0xe
 7a4:	00 00 e3    	cp\.w      0x0
 7a6:	00 20 ae    	btss\.b    0x0, #0x1
 7a8:	00 00 02    	call      0x0 \<_main\>
 7aa:	00 00 00 
 7ac:	10 00 e2    	cp0\.w     0x10
 7ae:	00 20 ae    	btss\.b    0x0, #0x1
 7b0:	00 00 02    	call      0x0 \<_main\>
 7b2:	00 00 00 
 7b4:	00 00 20    	mov\.w     #0x0, w0
 7b6:	00 00 88    	mov\.w     w0, 0x0
 7b8:	00 00 e3    	cp\.w      0x0
 7ba:	00 20 ae    	btss\.b    0x0, #0x1
 7bc:	00 00 02    	call      0x0 \<_main\>
 7be:	00 00 00 
 7c0:	00 00 28    	mov\.w     #0x8000, w0
 7c2:	10 00 88    	mov\.w     w0, 0x2
 7c4:	00 00 e3    	cp\.w      0x0
 7c6:	00 20 ae    	btss\.b    0x0, #0x1
 7c8:	00 00 02    	call      0x0 \<_main\>
 7ca:	00 00 00 
 7cc:	f0 ff 2f    	mov\.w     #0xffff, w0
 7ce:	0e e0 b7    	mov\.b     WREG, 0xe
 7d0:	00 00 e3    	cp\.w      0x0
 7d2:	00 20 ae    	btss\.b    0x0, #0x1
 7d4:	00 00 02    	call      0x0 \<_main\>
 7d6:	00 00 00 
 7d8:	10 00 e2    	cp0\.w     0x10
 7da:	00 20 ae    	btss\.b    0x0, #0x1
 7dc:	00 00 02    	call      0x0 \<_main\>
 7de:	00 00 00 
 7e0:	06 00 a8    	bset\.b    0x6, #0x0
 7e2:	08 20 ef    	clr\.w     0x8
 7e4:	01 e0 af    	btsc\.b    0x1, #0x7
 7e6:	00 00 02    	call      0x0 \<_main\>
 7e8:	00 00 00 
 7ea:	01 a0 af    	btsc\.b    0x1, #0x5
 7ec:	00 00 02    	call      0x0 \<_main\>
 7ee:	00 00 00 
 7f0:	06 20 ef    	clr\.w     0x6
 7f2:	08 00 a8    	bset\.b    0x8, #0x0
 7f4:	01 60 ae    	btss\.b    0x1, #0x3
 7f6:	00 00 02    	call      0x0 \<_main\>
 7f8:	00 00 00 
 7fa:	01 40 ae    	btss\.b    0x1, #0x2
 7fc:	00 00 02    	call      0x0 \<_main\>
 7fe:	00 00 00 
 800:	01 c0 ae    	btss\.b    0x1, #0x6
 802:	00 00 02    	call      0x0 \<_main\>
 804:	00 00 00 
 806:	01 80 ae    	btss\.b    0x1, #0x4
 808:	00 00 02    	call      0x0 \<_main\>
 80a:	00 00 00 
 80c:	00 80 a9    	bclr\.b    0x0, #0x4
 80e:	00 00 04    	goto      0x0 \<_main\>
 810:	00 00 00 

00000812 \<test13\>:
 812:	04 20 ec    	inc\.w     0x4
 814:	12 01 c3    	clr       A
 816:	12 81 c3    	clr       B
 818:	00 20 ef    	clr\.w     0x0
 81a:	f0 ff 2f    	mov\.w     #0xffff, w0
 81c:	00 00 88    	mov\.w     w0, 0x0
 81e:	f0 ff 27    	mov\.w     #0x7fff, w0
 820:	00 00 88    	mov\.w     w0, 0x0
 822:	00 00 20    	mov\.w     #0x0, w0
 824:	00 00 88    	mov\.w     w0, 0x0
 826:	00 00 20    	mov\.w     #0x0, w0
 828:	00 00 88    	mov\.w     w0, 0x0
 82a:	00 00 28    	mov\.w     #0x8000, w0
 82c:	00 00 88    	mov\.w     w0, 0x0
 82e:	f0 ff 2f    	mov\.w     #0xffff, w0
 830:	00 00 88    	mov\.w     w0, 0x0
 832:	00 30 cb    	sub       A
 834:	f0 ff 2f    	mov\.w     #0xffff, w0
 836:	00 00 88    	mov\.w     w0, 0x0
 838:	00 20 a9    	bclr\.b    0x0, #0x1
 83a:	00 00 e3    	cp\.w      0x0
 83c:	00 20 ae    	btss\.b    0x0, #0x1
 83e:	00 00 02    	call      0x0 \<_main\>
 840:	00 00 00 
 842:	f0 ff 27    	mov\.w     #0x7fff, w0
 844:	10 00 88    	mov\.w     w0, 0x2
 846:	00 00 e3    	cp\.w      0x0
 848:	00 20 ae    	btss\.b    0x0, #0x1
 84a:	00 00 02    	call      0x0 \<_main\>
 84c:	00 00 00 
 84e:	00 00 20    	mov\.w     #0x0, w0
 850:	0e e0 b7    	mov\.b     WREG, 0xe
 852:	00 00 e3    	cp\.w      0x0
 854:	00 20 ae    	btss\.b    0x0, #0x1
 856:	00 00 02    	call      0x0 \<_main\>
 858:	00 00 00 
 85a:	10 00 e2    	cp0\.w     0x10
 85c:	00 20 ae    	btss\.b    0x0, #0x1
 85e:	00 00 02    	call      0x0 \<_main\>
 860:	00 00 00 
 862:	00 00 20    	mov\.w     #0x0, w0
 864:	00 00 88    	mov\.w     w0, 0x0
 866:	00 00 e3    	cp\.w      0x0
 868:	00 20 ae    	btss\.b    0x0, #0x1
 86a:	00 00 02    	call      0x0 \<_main\>
 86c:	00 00 00 
 86e:	00 00 28    	mov\.w     #0x8000, w0
 870:	10 00 88    	mov\.w     w0, 0x2
 872:	00 00 e3    	cp\.w      0x0
 874:	00 20 ae    	btss\.b    0x0, #0x1
 876:	00 00 02    	call      0x0 \<_main\>
 878:	00 00 00 
 87a:	f0 ff 2f    	mov\.w     #0xffff, w0
 87c:	0e e0 b7    	mov\.b     WREG, 0xe
 87e:	00 00 e3    	cp\.w      0x0
 880:	00 20 ae    	btss\.b    0x0, #0x1
 882:	00 00 02    	call      0x0 \<_main\>
 884:	00 00 00 
 886:	10 00 e2    	cp0\.w     0x10
 888:	00 20 ae    	btss\.b    0x0, #0x1
 88a:	00 00 02    	call      0x0 \<_main\>
 88c:	00 00 00 
 88e:	06 00 a8    	bset\.b    0x6, #0x0
 890:	08 20 ef    	clr\.w     0x8
 892:	01 c0 af    	btsc\.b    0x1, #0x6
 894:	00 00 02    	call      0x0 \<_main\>
 896:	00 00 00 
 898:	01 80 af    	btsc\.b    0x1, #0x4
 89a:	00 00 02    	call      0x0 \<_main\>
 89c:	00 00 00 
 89e:	01 60 af    	btsc\.b    0x1, #0x3
 8a0:	00 00 02    	call      0x0 \<_main\>
 8a2:	00 00 00 
 8a4:	01 e0 af    	btsc\.b    0x1, #0x7
 8a6:	00 00 02    	call      0x0 \<_main\>
 8a8:	00 00 00 
 8aa:	06 20 ef    	clr\.w     0x6
 8ac:	08 00 a8    	bset\.b    0x8, #0x0
 8ae:	01 40 ae    	btss\.b    0x1, #0x2
 8b0:	00 00 02    	call      0x0 \<_main\>
 8b2:	00 00 00 
 8b4:	01 a0 ae    	btss\.b    0x1, #0x5
 8b6:	00 00 02    	call      0x0 \<_main\>
 8b8:	00 00 00 
 8ba:	00 00 04    	goto      0x0 \<_main\>
 8bc:	00 00 00 

000008be \<test14\>:
 8be:	04 20 ec    	inc\.w     0x4
 8c0:	12 01 c3    	clr       A
 8c2:	12 81 c3    	clr       B
 8c4:	00 20 ef    	clr\.w     0x0
 8c6:	10 00 20    	mov\.w     #0x1, w0
 8c8:	00 00 88    	mov\.w     w0, 0x0
 8ca:	00 00 20    	mov\.w     #0x0, w0
 8cc:	00 00 88    	mov\.w     w0, 0x0
 8ce:	00 00 20    	mov\.w     #0x0, w0
 8d0:	00 00 88    	mov\.w     w0, 0x0
 8d2:	00 00 20    	mov\.w     #0x0, w0
 8d4:	00 00 88    	mov\.w     w0, 0x0
 8d6:	00 00 28    	mov\.w     #0x8000, w0
 8d8:	00 00 88    	mov\.w     w0, 0x0
 8da:	f0 ff 2f    	mov\.w     #0xffff, w0
 8dc:	00 00 88    	mov\.w     w0, 0x0
 8de:	00 b0 cb    	sub       B
 8e0:	00 00 20    	mov\.w     #0x0, w0
 8e2:	00 00 88    	mov\.w     w0, 0x0
 8e4:	00 20 a9    	bclr\.b    0x0, #0x1
 8e6:	00 00 e3    	cp\.w      0x0
 8e8:	00 20 ae    	btss\.b    0x0, #0x1
 8ea:	00 00 02    	call      0x0 \<_main\>
 8ec:	00 00 00 
 8ee:	00 00 28    	mov\.w     #0x8000, w0
 8f0:	10 00 88    	mov\.w     w0, 0x2
 8f2:	00 00 e3    	cp\.w      0x0
 8f4:	00 20 ae    	btss\.b    0x0, #0x1
 8f6:	00 00 02    	call      0x0 \<_main\>
 8f8:	00 00 00 
 8fa:	f0 ff 2f    	mov\.w     #0xffff, w0
 8fc:	0e e0 b7    	mov\.b     WREG, 0xe
 8fe:	00 00 e3    	cp\.w      0x0
 900:	00 20 ae    	btss\.b    0x0, #0x1
 902:	00 00 02    	call      0x0 \<_main\>
 904:	00 00 00 
 906:	10 00 e2    	cp0\.w     0x10
 908:	00 20 ae    	btss\.b    0x0, #0x1
 90a:	00 00 02    	call      0x0 \<_main\>
 90c:	00 00 00 
 90e:	10 00 20    	mov\.w     #0x1, w0
 910:	00 00 88    	mov\.w     w0, 0x0
 912:	00 00 e3    	cp\.w      0x0
 914:	00 20 ae    	btss\.b    0x0, #0x1
 916:	00 00 02    	call      0x0 \<_main\>
 918:	00 00 00 
 91a:	00 00 20    	mov\.w     #0x0, w0
 91c:	00 00 88    	mov\.w     w0, 0x0
 91e:	00 00 e3    	cp\.w      0x0
 920:	00 20 ae    	btss\.b    0x0, #0x1
 922:	00 00 02    	call      0x0 \<_main\>
 924:	00 00 00 
 926:	00 00 20    	mov\.w     #0x0, w0
 928:	00 00 88    	mov\.w     w0, 0x0
 92a:	00 00 e3    	cp\.w      0x0
 92c:	00 20 ae    	btss\.b    0x0, #0x1
 92e:	00 00 02    	call      0x0 \<_main\>
 930:	00 00 00 
 932:	06 00 a8    	bset\.b    0x6, #0x0
 934:	08 20 ef    	clr\.w     0x8
 936:	01 c0 af    	btsc\.b    0x1, #0x6
 938:	00 00 02    	call      0x0 \<_main\>
 93a:	00 00 00 
 93c:	01 60 af    	btsc\.b    0x1, #0x3
 93e:	00 00 02    	call      0x0 \<_main\>
 940:	00 00 00 
 942:	01 e0 af    	btsc\.b    0x1, #0x7
 944:	00 00 02    	call      0x0 \<_main\>
 946:	00 00 00 
 948:	01 a0 af    	btsc\.b    0x1, #0x5
 94a:	00 00 02    	call      0x0 \<_main\>
 94c:	00 00 00 
 94e:	06 20 ef    	clr\.w     0x6
 950:	08 00 a8    	bset\.b    0x8, #0x0
 952:	01 80 ae    	btss\.b    0x1, #0x4
 954:	00 00 02    	call      0x0 \<_main\>
 956:	00 00 00 
 958:	01 40 ae    	btss\.b    0x1, #0x2
 95a:	00 00 02    	call      0x0 \<_main\>
 95c:	00 00 00 
 95e:	00 00 04    	goto      0x0 \<_main\>
 960:	00 00 00 

00000962 \<test15\>:
 962:	04 20 ec    	inc\.w     0x4
 964:	12 01 c3    	clr       A
 966:	12 81 c3    	clr       B
 968:	00 20 ef    	clr\.w     0x0
 96a:	00 00 20    	mov\.w     #0x0, w0
 96c:	00 00 88    	mov\.w     w0, 0x0
 96e:	00 00 28    	mov\.w     #0x8000, w0
 970:	00 00 88    	mov\.w     w0, 0x0
 972:	f0 ff 2f    	mov\.w     #0xffff, w0
 974:	00 00 88    	mov\.w     w0, 0x0
 976:	00 00 20    	mov\.w     #0x0, w0
 978:	00 00 88    	mov\.w     w0, 0x0
 97a:	00 00 28    	mov\.w     #0x8000, w0
 97c:	00 00 88    	mov\.w     w0, 0x0
 97e:	f0 ff 2f    	mov\.w     #0xffff, w0
 980:	00 00 88    	mov\.w     w0, 0x0
 982:	00 b0 cb    	sub       B
 984:	00 00 20    	mov\.w     #0x0, w0
 986:	00 00 88    	mov\.w     w0, 0x0
 988:	00 20 a9    	bclr\.b    0x0, #0x1
 98a:	00 00 e3    	cp\.w      0x0
 98c:	00 20 ae    	btss\.b    0x0, #0x1
 98e:	00 00 02    	call      0x0 \<_main\>
 990:	00 00 00 
 992:	00 00 20    	mov\.w     #0x0, w0
 994:	10 00 88    	mov\.w     w0, 0x2
 996:	00 00 e3    	cp\.w      0x0
 998:	00 20 ae    	btss\.b    0x0, #0x1
 99a:	00 00 02    	call      0x0 \<_main\>
 99c:	00 00 00 
 99e:	00 00 20    	mov\.w     #0x0, w0
 9a0:	0e e0 b7    	mov\.b     WREG, 0xe
 9a2:	00 00 e3    	cp\.w      0x0
 9a4:	00 20 ae    	btss\.b    0x0, #0x1
 9a6:	00 00 02    	call      0x0 \<_main\>
 9a8:	00 00 00 
 9aa:	10 00 e2    	cp0\.w     0x10
 9ac:	00 20 ae    	btss\.b    0x0, #0x1
 9ae:	00 00 02    	call      0x0 \<_main\>
 9b0:	00 00 00 
 9b2:	00 00 20    	mov\.w     #0x0, w0
 9b4:	00 00 88    	mov\.w     w0, 0x0
 9b6:	00 00 e3    	cp\.w      0x0
 9b8:	00 20 ae    	btss\.b    0x0, #0x1
 9ba:	00 00 02    	call      0x0 \<_main\>
 9bc:	00 00 00 
 9be:	00 00 28    	mov\.w     #0x8000, w0
 9c0:	10 00 88    	mov\.w     w0, 0x2
 9c2:	00 00 e3    	cp\.w      0x0
 9c4:	00 20 ae    	btss\.b    0x0, #0x1
 9c6:	00 00 02    	call      0x0 \<_main\>
 9c8:	00 00 00 
 9ca:	f0 ff 2f    	mov\.w     #0xffff, w0
 9cc:	0e e0 b7    	mov\.b     WREG, 0xe
 9ce:	00 00 e3    	cp\.w      0x0
 9d0:	00 20 ae    	btss\.b    0x0, #0x1
 9d2:	00 00 02    	call      0x0 \<_main\>
 9d4:	00 00 00 
 9d6:	10 00 e2    	cp0\.w     0x10
 9d8:	00 20 ae    	btss\.b    0x0, #0x1
 9da:	00 00 02    	call      0x0 \<_main\>
 9dc:	00 00 00 
 9de:	06 00 a8    	bset\.b    0x6, #0x0
 9e0:	08 20 ef    	clr\.w     0x8
 9e2:	01 c0 af    	btsc\.b    0x1, #0x6
 9e4:	00 00 02    	call      0x0 \<_main\>
 9e6:	00 00 00 
 9e8:	01 80 af    	btsc\.b    0x1, #0x4
 9ea:	00 00 02    	call      0x0 \<_main\>
 9ec:	00 00 00 
 9ee:	01 60 af    	btsc\.b    0x1, #0x3
 9f0:	00 00 02    	call      0x0 \<_main\>
 9f2:	00 00 00 
 9f4:	01 40 af    	btsc\.b    0x1, #0x2
 9f6:	00 00 02    	call      0x0 \<_main\>
 9f8:	00 00 00 
 9fa:	01 e0 af    	btsc\.b    0x1, #0x7
 9fc:	00 00 02    	call      0x0 \<_main\>
 9fe:	00 00 00 
 a00:	01 a0 af    	btsc\.b    0x1, #0x5
 a02:	00 00 02    	call      0x0 \<_main\>
 a04:	00 00 00 
 a06:	00 00 04    	goto      0x0 \<_main\>
 a08:	00 00 00 

00000a0a \<test16\>:
 a0a:	04 20 ec    	inc\.w     0x4
 a0c:	12 01 c3    	clr       A
 a0e:	12 81 c3    	clr       B
 a10:	00 20 ef    	clr\.w     0x0
 a12:	f0 ff 2f    	mov\.w     #0xffff, w0
 a14:	00 00 88    	mov\.w     w0, 0x0
 a16:	20 00 28    	mov\.w     #0x8002, w0
 a18:	00 00 88    	mov\.w     w0, 0x0
 a1a:	f0 0f 20    	mov\.w     #0xff, w0
 a1c:	00 00 88    	mov\.w     w0, 0x0
 a1e:	00 00 20    	mov\.w     #0x0, w0
 a20:	00 00 88    	mov\.w     w0, 0x0
 a22:	30 f0 2f    	mov\.w     #0xff03, w0
 a24:	00 00 88    	mov\.w     w0, 0x0
 a26:	f0 07 20    	mov\.w     #0x7f, w0
 a28:	00 00 88    	mov\.w     w0, 0x0
 a2a:	00 30 cb    	sub       A
 a2c:	00 00 20    	mov\.w     #0x0, w0
 a2e:	00 00 88    	mov\.w     w0, 0x0
 a30:	00 20 a9    	bclr\.b    0x0, #0x1
 a32:	00 00 e3    	cp\.w      0x0
 a34:	00 20 ae    	btss\.b    0x0, #0x1
 a36:	00 00 02    	call      0x0 \<_main\>
 a38:	00 00 00 
 a3a:	00 00 28    	mov\.w     #0x8000, w0
 a3c:	10 00 88    	mov\.w     w0, 0x2
 a3e:	00 00 e3    	cp\.w      0x0
 a40:	00 20 ae    	btss\.b    0x0, #0x1
 a42:	00 00 02    	call      0x0 \<_main\>
 a44:	00 00 00 
 a46:	f0 ff 2f    	mov\.w     #0xffff, w0
 a48:	0e e0 b7    	mov\.b     WREG, 0xe
 a4a:	00 00 e3    	cp\.w      0x0
 a4c:	00 20 ae    	btss\.b    0x0, #0x1
 a4e:	00 00 02    	call      0x0 \<_main\>
 a50:	00 00 00 
 a52:	10 00 e2    	cp0\.w     0x10
 a54:	00 20 ae    	btss\.b    0x0, #0x1
 a56:	00 00 02    	call      0x0 \<_main\>
 a58:	00 00 00 
 a5a:	00 00 20    	mov\.w     #0x0, w0
 a5c:	00 00 88    	mov\.w     w0, 0x0
 a5e:	00 00 e3    	cp\.w      0x0
 a60:	00 20 ae    	btss\.b    0x0, #0x1
 a62:	00 00 02    	call      0x0 \<_main\>
 a64:	00 00 00 
 a66:	30 f0 2f    	mov\.w     #0xff03, w0
 a68:	10 00 88    	mov\.w     w0, 0x2
 a6a:	00 00 e3    	cp\.w      0x0
 a6c:	00 20 ae    	btss\.b    0x0, #0x1
 a6e:	00 00 02    	call      0x0 \<_main\>
 a70:	00 00 00 
 a72:	f0 07 20    	mov\.w     #0x7f, w0
 a74:	0e e0 b7    	mov\.b     WREG, 0xe
 a76:	00 00 e3    	cp\.w      0x0
 a78:	00 20 ae    	btss\.b    0x0, #0x1
 a7a:	00 00 02    	call      0x0 \<_main\>
 a7c:	00 00 00 
 a7e:	10 00 e2    	cp0\.w     0x10
 a80:	00 20 ae    	btss\.b    0x0, #0x1
 a82:	00 00 02    	call      0x0 \<_main\>
 a84:	00 00 00 
 a86:	06 00 a8    	bset\.b    0x6, #0x0
 a88:	08 20 ef    	clr\.w     0x8
 a8a:	01 c0 af    	btsc\.b    0x1, #0x6
 a8c:	00 00 02    	call      0x0 \<_main\>
 a8e:	00 00 00 
 a90:	01 80 af    	btsc\.b    0x1, #0x4
 a92:	00 00 02    	call      0x0 \<_main\>
 a94:	00 00 00 
 a96:	01 60 af    	btsc\.b    0x1, #0x3
 a98:	00 00 02    	call      0x0 \<_main\>
 a9a:	00 00 00 
 a9c:	01 e0 af    	btsc\.b    0x1, #0x7
 a9e:	00 00 02    	call      0x0 \<_main\>
 aa0:	00 00 00 
 aa2:	06 20 ef    	clr\.w     0x6
 aa4:	08 00 a8    	bset\.b    0x8, #0x0
 aa6:	01 a0 ae    	btss\.b    0x1, #0x5
 aa8:	00 00 02    	call      0x0 \<_main\>
 aaa:	00 00 00 
 aac:	01 40 ae    	btss\.b    0x1, #0x2
 aae:	00 00 02    	call      0x0 \<_main\>
 ab0:	00 00 00 
 ab2:	00 00 04    	goto      0x0 \<_main\>
 ab4:	00 00 00 

00000ab6 \<test17\>:
 ab6:	04 20 ec    	inc\.w     0x4
 ab8:	12 01 c3    	clr       A
 aba:	12 81 c3    	clr       B
 abc:	00 20 ef    	clr\.w     0x0
 abe:	00 00 20    	mov\.w     #0x0, w0
 ac0:	00 00 88    	mov\.w     w0, 0x0
 ac2:	00 00 28    	mov\.w     #0x8000, w0
 ac4:	00 00 88    	mov\.w     w0, 0x0
 ac6:	f0 ff 2f    	mov\.w     #0xffff, w0
 ac8:	00 00 88    	mov\.w     w0, 0x0
 aca:	00 00 28    	mov\.w     #0x8000, w0
 acc:	00 00 88    	mov\.w     w0, 0x0
 ace:	e0 ff 2f    	mov\.w     #0xfffe, w0
 ad0:	00 00 88    	mov\.w     w0, 0x0
 ad2:	f0 07 20    	mov\.w     #0x7f, w0
 ad4:	00 00 88    	mov\.w     w0, 0x0
 ad6:	00 b0 cb    	sub       B
 ad8:	f0 ff 2f    	mov\.w     #0xffff, w0
 ada:	00 00 88    	mov\.w     w0, 0x0
 adc:	00 20 a9    	bclr\.b    0x0, #0x1
 ade:	00 00 e3    	cp\.w      0x0
 ae0:	00 20 ae    	btss\.b    0x0, #0x1
 ae2:	00 00 02    	call      0x0 \<_main\>
 ae4:	00 00 00 
 ae6:	f0 ff 27    	mov\.w     #0x7fff, w0
 ae8:	10 00 88    	mov\.w     w0, 0x2
 aea:	00 00 e3    	cp\.w      0x0
 aec:	00 20 ae    	btss\.b    0x0, #0x1
 aee:	00 00 02    	call      0x0 \<_main\>
 af0:	00 00 00 
 af2:	00 00 20    	mov\.w     #0x0, w0
 af4:	0e e0 b7    	mov\.b     WREG, 0xe
 af6:	00 00 e3    	cp\.w      0x0
 af8:	00 20 ae    	btss\.b    0x0, #0x1
 afa:	00 00 02    	call      0x0 \<_main\>
 afc:	00 00 00 
 afe:	10 00 e2    	cp0\.w     0x10
 b00:	00 20 ae    	btss\.b    0x0, #0x1
 b02:	00 00 02    	call      0x0 \<_main\>
 b04:	00 00 00 
 b06:	00 00 20    	mov\.w     #0x0, w0
 b08:	00 00 88    	mov\.w     w0, 0x0
 b0a:	00 00 e3    	cp\.w      0x0
 b0c:	00 20 ae    	btss\.b    0x0, #0x1
 b0e:	00 00 02    	call      0x0 \<_main\>
 b10:	00 00 00 
 b12:	00 00 28    	mov\.w     #0x8000, w0
 b14:	10 00 88    	mov\.w     w0, 0x2
 b16:	00 00 e3    	cp\.w      0x0
 b18:	00 20 ae    	btss\.b    0x0, #0x1
 b1a:	00 00 02    	call      0x0 \<_main\>
 b1c:	00 00 00 
 b1e:	f0 ff 2f    	mov\.w     #0xffff, w0
 b20:	0e e0 b7    	mov\.b     WREG, 0xe
 b22:	00 00 e3    	cp\.w      0x0
 b24:	00 20 ae    	btss\.b    0x0, #0x1
 b26:	00 00 02    	call      0x0 \<_main\>
 b28:	00 00 00 
 b2a:	10 00 e2    	cp0\.w     0x10
 b2c:	00 20 ae    	btss\.b    0x0, #0x1
 b2e:	00 00 02    	call      0x0 \<_main\>
 b30:	00 00 00 
 b32:	06 00 a8    	bset\.b    0x6, #0x0
 b34:	08 20 ef    	clr\.w     0x8
 b36:	01 e0 af    	btsc\.b    0x1, #0x7
 b38:	00 00 02    	call      0x0 \<_main\>
 b3a:	00 00 00 
 b3c:	01 a0 af    	btsc\.b    0x1, #0x5
 b3e:	00 00 02    	call      0x0 \<_main\>
 b40:	00 00 00 
 b42:	01 60 af    	btsc\.b    0x1, #0x3
 b44:	00 00 02    	call      0x0 \<_main\>
 b46:	00 00 00 
 b48:	01 c0 af    	btsc\.b    0x1, #0x6
 b4a:	00 00 02    	call      0x0 \<_main\>
 b4c:	00 00 00 
 b4e:	06 20 ef    	clr\.w     0x6
 b50:	08 00 a8    	bset\.b    0x8, #0x0
 b52:	01 40 ae    	btss\.b    0x1, #0x2
 b54:	00 00 02    	call      0x0 \<_main\>
 b56:	00 00 00 
 b58:	01 80 ae    	btss\.b    0x1, #0x4
 b5a:	00 00 02    	call      0x0 \<_main\>
 b5c:	00 00 00 
 b5e:	00 e0 a8    	bset\.b    0x0, #0x7
 b60:	00 c0 a8    	bset\.b    0x0, #0x6
 b62:	00 80 a8    	bset\.b    0x0, #0x4
 b64:	00 00 04    	goto      0x0 \<_main\>
 b66:	00 00 00 

00000b68 \<test18\>:
 b68:	04 20 ec    	inc\.w     0x4
 b6a:	12 01 c3    	clr       A
 b6c:	12 81 c3    	clr       B
 b6e:	00 20 ef    	clr\.w     0x0
 b70:	f0 ff 2f    	mov\.w     #0xffff, w0
 b72:	00 00 88    	mov\.w     w0, 0x0
 b74:	f0 ff 2f    	mov\.w     #0xffff, w0
 b76:	00 00 88    	mov\.w     w0, 0x0
 b78:	f0 07 20    	mov\.w     #0x7f, w0
 b7a:	00 00 88    	mov\.w     w0, 0x0
 b7c:	00 00 20    	mov\.w     #0x0, w0
 b7e:	00 00 88    	mov\.w     w0, 0x0
 b80:	00 00 20    	mov\.w     #0x0, w0
 b82:	00 00 88    	mov\.w     w0, 0x0
 b84:	00 08 20    	mov\.w     #0x80, w0
 b86:	00 00 88    	mov\.w     w0, 0x0
 b88:	00 30 cb    	sub       A
 b8a:	f0 ff 2f    	mov\.w     #0xffff, w0
 b8c:	00 00 88    	mov\.w     w0, 0x0
 b8e:	00 20 a9    	bclr\.b    0x0, #0x1
 b90:	00 00 e3    	cp\.w      0x0
 b92:	00 20 ae    	btss\.b    0x0, #0x1
 b94:	00 00 02    	call      0x0 \<_main\>
 b96:	00 00 00 
 b98:	f0 ff 2f    	mov\.w     #0xffff, w0
 b9a:	10 00 88    	mov\.w     w0, 0x2
 b9c:	00 00 e3    	cp\.w      0x0
 b9e:	00 20 ae    	btss\.b    0x0, #0x1
 ba0:	00 00 02    	call      0x0 \<_main\>
 ba2:	00 00 00 
 ba4:	f0 07 20    	mov\.w     #0x7f, w0
 ba6:	0e e0 b7    	mov\.b     WREG, 0xe
 ba8:	00 00 e3    	cp\.w      0x0
 baa:	00 20 ae    	btss\.b    0x0, #0x1
 bac:	00 00 02    	call      0x0 \<_main\>
 bae:	00 00 00 
 bb0:	10 00 e2    	cp0\.w     0x10
 bb2:	00 20 ae    	btss\.b    0x0, #0x1
 bb4:	00 00 02    	call      0x0 \<_main\>
 bb6:	00 00 00 
 bb8:	00 00 20    	mov\.w     #0x0, w0
 bba:	00 00 88    	mov\.w     w0, 0x0
 bbc:	00 00 e3    	cp\.w      0x0
 bbe:	00 20 ae    	btss\.b    0x0, #0x1
 bc0:	00 00 02    	call      0x0 \<_main\>
 bc2:	00 00 00 
 bc4:	00 00 20    	mov\.w     #0x0, w0
 bc6:	10 00 88    	mov\.w     w0, 0x2
 bc8:	00 00 e3    	cp\.w      0x0
 bca:	00 20 ae    	btss\.b    0x0, #0x1
 bcc:	00 00 02    	call      0x0 \<_main\>
 bce:	00 00 00 
 bd0:	00 f8 2f    	mov\.w     #0xff80, w0
 bd2:	0e e0 b7    	mov\.b     WREG, 0xe
 bd4:	00 00 e3    	cp\.w      0x0
 bd6:	00 20 ae    	btss\.b    0x0, #0x1
 bd8:	00 00 02    	call      0x0 \<_main\>
 bda:	00 00 00 
 bdc:	10 00 e2    	cp0\.w     0x10
 bde:	00 20 ae    	btss\.b    0x0, #0x1
 be0:	00 00 02    	call      0x0 \<_main\>
 be2:	00 00 00 
 be4:	06 00 a8    	bset\.b    0x6, #0x0
 be6:	08 20 ef    	clr\.w     0x8
 be8:	01 c0 af    	btsc\.b    0x1, #0x6
 bea:	00 00 02    	call      0x0 \<_main\>
 bec:	00 00 00 
 bee:	01 80 af    	btsc\.b    0x1, #0x4
 bf0:	00 00 02    	call      0x0 \<_main\>
 bf2:	00 00 00 
 bf4:	06 20 ef    	clr\.w     0x6
 bf6:	08 00 a8    	bset\.b    0x8, #0x0
 bf8:	01 60 ae    	btss\.b    0x1, #0x3
 bfa:	00 00 02    	call      0x0 \<_main\>
 bfc:	00 00 00 
 bfe:	01 40 ae    	btss\.b    0x1, #0x2
 c00:	00 00 02    	call      0x0 \<_main\>
 c02:	00 00 00 
 c04:	01 e0 ae    	btss\.b    0x1, #0x7
 c06:	00 00 02    	call      0x0 \<_main\>
 c08:	00 00 00 
 c0a:	01 a0 ae    	btss\.b    0x1, #0x5
 c0c:	00 00 02    	call      0x0 \<_main\>
 c0e:	00 00 00 
 c10:	00 00 04    	goto      0x0 \<_main\>
 c12:	00 00 00 

00000c14 \<test19\>:
 c14:	04 20 ec    	inc\.w     0x4
 c16:	12 01 c3    	clr       A
 c18:	12 81 c3    	clr       B
 c1a:	00 20 ef    	clr\.w     0x0
 c1c:	10 00 20    	mov\.w     #0x1, w0
 c1e:	00 00 88    	mov\.w     w0, 0x0
 c20:	00 00 20    	mov\.w     #0x0, w0
 c22:	00 00 88    	mov\.w     w0, 0x0
 c24:	00 00 20    	mov\.w     #0x0, w0
 c26:	00 00 88    	mov\.w     w0, 0x0
 c28:	00 00 20    	mov\.w     #0x0, w0
 c2a:	00 00 88    	mov\.w     w0, 0x0
 c2c:	00 00 20    	mov\.w     #0x0, w0
 c2e:	00 00 88    	mov\.w     w0, 0x0
 c30:	00 f8 2f    	mov\.w     #0xff80, w0
 c32:	00 00 88    	mov\.w     w0, 0x0
 c34:	00 b0 cb    	sub       B
 c36:	00 00 20    	mov\.w     #0x0, w0
 c38:	00 00 88    	mov\.w     w0, 0x0
 c3a:	00 20 a9    	bclr\.b    0x0, #0x1
 c3c:	00 00 e3    	cp\.w      0x0
 c3e:	00 20 ae    	btss\.b    0x0, #0x1
 c40:	00 00 02    	call      0x0 \<_main\>
 c42:	00 00 00 
 c44:	00 00 20    	mov\.w     #0x0, w0
 c46:	10 00 88    	mov\.w     w0, 0x2
 c48:	00 00 e3    	cp\.w      0x0
 c4a:	00 20 ae    	btss\.b    0x0, #0x1
 c4c:	00 00 02    	call      0x0 \<_main\>
 c4e:	00 00 00 
 c50:	00 f8 2f    	mov\.w     #0xff80, w0
 c52:	0e e0 b7    	mov\.b     WREG, 0xe
 c54:	00 00 e3    	cp\.w      0x0
 c56:	00 20 ae    	btss\.b    0x0, #0x1
 c58:	00 00 02    	call      0x0 \<_main\>
 c5a:	00 00 00 
 c5c:	10 00 e2    	cp0\.w     0x10
 c5e:	00 20 ae    	btss\.b    0x0, #0x1
 c60:	00 00 02    	call      0x0 \<_main\>
 c62:	00 00 00 
 c64:	10 00 20    	mov\.w     #0x1, w0
 c66:	00 00 88    	mov\.w     w0, 0x0
 c68:	00 00 e3    	cp\.w      0x0
 c6a:	00 20 ae    	btss\.b    0x0, #0x1
 c6c:	00 00 02    	call      0x0 \<_main\>
 c6e:	00 00 00 
 c70:	00 00 20    	mov\.w     #0x0, w0
 c72:	10 00 88    	mov\.w     w0, 0x2
 c74:	00 00 e3    	cp\.w      0x0
 c76:	00 20 ae    	btss\.b    0x0, #0x1
 c78:	00 00 02    	call      0x0 \<_main\>
 c7a:	00 00 00 
 c7c:	00 00 20    	mov\.w     #0x0, w0
 c7e:	0e e0 b7    	mov\.b     WREG, 0xe
 c80:	00 00 e3    	cp\.w      0x0
 c82:	00 20 ae    	btss\.b    0x0, #0x1
 c84:	00 00 02    	call      0x0 \<_main\>
 c86:	00 00 00 
 c88:	10 00 e2    	cp0\.w     0x10
 c8a:	00 20 ae    	btss\.b    0x0, #0x1
 c8c:	00 00 02    	call      0x0 \<_main\>
 c8e:	00 00 00 
 c90:	06 00 a8    	bset\.b    0x6, #0x0
 c92:	08 20 ef    	clr\.w     0x8
 c94:	01 e0 af    	btsc\.b    0x1, #0x7
 c96:	00 00 02    	call      0x0 \<_main\>
 c98:	00 00 00 
 c9a:	01 a0 af    	btsc\.b    0x1, #0x5
 c9c:	00 00 02    	call      0x0 \<_main\>
 c9e:	00 00 00 
 ca0:	06 20 ef    	clr\.w     0x6
 ca2:	08 00 a8    	bset\.b    0x8, #0x0
 ca4:	01 60 ae    	btss\.b    0x1, #0x3
 ca6:	00 00 02    	call      0x0 \<_main\>
 ca8:	00 00 00 
 caa:	01 40 ae    	btss\.b    0x1, #0x2
 cac:	00 00 02    	call      0x0 \<_main\>
 cae:	00 00 00 
 cb0:	01 c0 ae    	btss\.b    0x1, #0x6
 cb2:	00 00 02    	call      0x0 \<_main\>
 cb4:	00 00 00 
 cb6:	01 80 ae    	btss\.b    0x1, #0x4
 cb8:	00 00 02    	call      0x0 \<_main\>
 cba:	00 00 00 
 cbc:	00 00 04    	goto      0x0 \<_main\>
 cbe:	00 00 00 

00000cc0 \<test20\>:
 cc0:	04 20 ec    	inc\.w     0x4
 cc2:	12 01 c3    	clr       A
 cc4:	12 81 c3    	clr       B
 cc6:	00 20 ef    	clr\.w     0x0
 cc8:	00 00 20    	mov\.w     #0x0, w0
 cca:	00 00 88    	mov\.w     w0, 0x0
 ccc:	00 00 20    	mov\.w     #0x0, w0
 cce:	00 00 88    	mov\.w     w0, 0x0
 cd0:	00 f8 2f    	mov\.w     #0xff80, w0
 cd2:	00 00 88    	mov\.w     w0, 0x0
 cd4:	00 00 20    	mov\.w     #0x0, w0
 cd6:	00 00 88    	mov\.w     w0, 0x0
 cd8:	00 00 20    	mov\.w     #0x0, w0
 cda:	00 00 88    	mov\.w     w0, 0x0
 cdc:	00 f8 2f    	mov\.w     #0xff80, w0
 cde:	00 00 88    	mov\.w     w0, 0x0
 ce0:	00 b0 cb    	sub       B
 ce2:	00 00 20    	mov\.w     #0x0, w0
 ce4:	00 00 88    	mov\.w     w0, 0x0
 ce6:	00 20 a9    	bclr\.b    0x0, #0x1
 ce8:	00 00 e3    	cp\.w      0x0
 cea:	00 20 ae    	btss\.b    0x0, #0x1
 cec:	00 00 02    	call      0x0 \<_main\>
 cee:	00 00 00 
 cf0:	00 00 20    	mov\.w     #0x0, w0
 cf2:	10 00 88    	mov\.w     w0, 0x2
 cf4:	00 00 e3    	cp\.w      0x0
 cf6:	00 20 ae    	btss\.b    0x0, #0x1
 cf8:	00 00 02    	call      0x0 \<_main\>
 cfa:	00 00 00 
 cfc:	00 00 20    	mov\.w     #0x0, w0
 cfe:	0e e0 b7    	mov\.b     WREG, 0xe
 d00:	00 00 e3    	cp\.w      0x0
 d02:	00 20 ae    	btss\.b    0x0, #0x1
 d04:	00 00 02    	call      0x0 \<_main\>
 d06:	00 00 00 
 d08:	10 00 e2    	cp0\.w     0x10
 d0a:	00 20 ae    	btss\.b    0x0, #0x1
 d0c:	00 00 02    	call      0x0 \<_main\>
 d0e:	00 00 00 
 d10:	00 00 20    	mov\.w     #0x0, w0
 d12:	00 00 88    	mov\.w     w0, 0x0
 d14:	00 00 e3    	cp\.w      0x0
 d16:	00 20 ae    	btss\.b    0x0, #0x1
 d18:	00 00 02    	call      0x0 \<_main\>
 d1a:	00 00 00 
 d1c:	00 00 20    	mov\.w     #0x0, w0
 d1e:	10 00 88    	mov\.w     w0, 0x2
 d20:	00 00 e3    	cp\.w      0x0
 d22:	00 20 ae    	btss\.b    0x0, #0x1
 d24:	00 00 02    	call      0x0 \<_main\>
 d26:	00 00 00 
 d28:	00 f8 2f    	mov\.w     #0xff80, w0
 d2a:	0e e0 b7    	mov\.b     WREG, 0xe
 d2c:	00 00 e3    	cp\.w      0x0
 d2e:	00 20 ae    	btss\.b    0x0, #0x1
 d30:	00 00 02    	call      0x0 \<_main\>
 d32:	00 00 00 
 d34:	10 00 e2    	cp0\.w     0x10
 d36:	00 20 ae    	btss\.b    0x0, #0x1
 d38:	00 00 02    	call      0x0 \<_main\>
 d3a:	00 00 00 
 d3c:	06 00 a8    	bset\.b    0x6, #0x0
 d3e:	08 20 ef    	clr\.w     0x8
 d40:	01 e0 af    	btsc\.b    0x1, #0x7
 d42:	00 00 02    	call      0x0 \<_main\>
 d44:	00 00 00 
 d46:	01 a0 af    	btsc\.b    0x1, #0x5
 d48:	00 00 02    	call      0x0 \<_main\>
 d4a:	00 00 00 
 d4c:	01 60 af    	btsc\.b    0x1, #0x3
 d4e:	00 00 02    	call      0x0 \<_main\>
 d50:	00 00 00 
 d52:	01 40 af    	btsc\.b    0x1, #0x2
 d54:	00 00 02    	call      0x0 \<_main\>
 d56:	00 00 00 
 d58:	01 c0 af    	btsc\.b    0x1, #0x6
 d5a:	00 00 02    	call      0x0 \<_main\>
 d5c:	00 00 00 
 d5e:	01 80 af    	btsc\.b    0x1, #0x4
 d60:	00 00 02    	call      0x0 \<_main\>
 d62:	00 00 00 
 d64:	00 a0 bf    	mov\.w     0x0
 d66:	00 00 32    	bra       Z, 0xd68
 d68:	00 00 04    	goto      0x0 \<_main\>
 d6a:	00 00 00 

00000d6c \<Fail\>:
 d6c:	00 00 04    	goto      0x0 \<_main\>
 d6e:	00 00 00 
 d70:	00 40 da    	\.pword 0xda4000
 d72:	00 00 04    	goto      0x0 \<_main\>
 d74:	00 00 00 

00000d76 \<Pass\>:
 d76:	00 00 04    	goto      0x0 \<_main\>
 d78:	00 00 00 

00000d7a \<accADisplay\>:
 d7a:	10 20 ef    	clr\.w     0x10
 d7c:	00 00 f8    	push      0x0
 d7e:	00 00 f8    	push      0x0
 d80:	00 00 80    	mov\.w     0x0, w0
 d82:	01 60 ef    	clr\.b     0x1
 d84:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 d86:	00 00 f8    	push      0x0
 d88:	02 00 f8    	push      0x2
 d8a:	04 00 f8    	push      0x4
 d8c:	00 00 20    	mov\.w     #0x0, w0
 d8e:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 d90:	00 00 02    	call      0x0 \<_main\>
 d92:	00 00 00 
 d94:	ee 87 57    	sub\.w     w15, #0xe, w15
 d96:	00 00 06    	return    

00000d98 \<accBDisplay\>:
 d98:	10 20 ef    	clr\.w     0x10
 d9a:	00 00 f8    	push      0x0
 d9c:	00 00 f8    	push      0x0
 d9e:	00 00 80    	mov\.w     0x0, w0
 da0:	01 60 ef    	clr\.b     0x1
 da2:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 da4:	00 00 f8    	push      0x0
 da6:	02 00 f8    	push      0x2
 da8:	04 00 f8    	push      0x4
 daa:	00 00 20    	mov\.w     #0x0, w0
 dac:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 dae:	00 00 02    	call      0x0 \<_main\>
 db0:	00 00 00 
 db2:	ee 87 57    	sub\.w     w15, #0xe, w15
 db4:	00 00 06    	return    

00000db6 \<fail_AccAChk\>:
 db6:	00 20 ec    	inc\.w     0x0
 db8:	10 20 ec    	inc\.w     0x10
 dba:	00 00 f8    	push      0x0
 dbc:	00 00 20    	mov\.w     #0x0, w0
 dbe:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 dc0:	00 00 02    	call      0x0 \<_main\>
 dc2:	00 00 00 
 dc4:	e4 87 57    	sub\.w     w15, #0x4, w15
 dc6:	00 00 06    	return    
 dc8:	00 00 04    	goto      0x0 \<_main\>
 dca:	00 00 00 
 dcc:	00 40 da    	\.pword 0xda4000

00000dce \<fail_AccBChk\>:
 dce:	00 20 ec    	inc\.w     0x0
 dd0:	10 20 ec    	inc\.w     0x10
 dd2:	00 00 f8    	push      0x0
 dd4:	00 00 20    	mov\.w     #0x0, w0
 dd6:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 dd8:	00 00 02    	call      0x0 \<_main\>
 dda:	00 00 00 
 ddc:	e4 87 57    	sub\.w     w15, #0x4, w15
 dde:	00 00 06    	return    
 de0:	00 00 04    	goto      0x0 \<_main\>
 de2:	00 00 00 
 de4:	00 40 da    	\.pword 0xda4000

00000de6 \<fail_OA\>:
 de6:	00 20 ec    	inc\.w     0x0
 de8:	00 00 f8    	push      0x0
 dea:	00 00 20    	mov\.w     #0x0, w0
 dec:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 dee:	00 00 02    	call      0x0 \<_main\>
 df0:	00 00 00 
 df2:	e4 87 57    	sub\.w     w15, #0x4, w15
 df4:	00 00 f8    	push      0x0
 df6:	00 00 f8    	push      0x0
 df8:	00 00 20    	mov\.w     #0x0, w0
 dfa:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 dfc:	00 00 02    	call      0x0 \<_main\>
 dfe:	00 00 00 
 e00:	e6 87 57    	sub\.w     w15, #0x6, w15
 e02:	00 00 06    	return    
 e04:	00 00 04    	goto      0x0 \<_main\>
 e06:	00 00 00 
 e08:	00 40 da    	\.pword 0xda4000

00000e0a \<fail_OB\>:
 e0a:	00 20 ec    	inc\.w     0x0
 e0c:	00 00 f8    	push      0x0
 e0e:	00 00 20    	mov\.w     #0x0, w0
 e10:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e12:	00 00 02    	call      0x0 \<_main\>
 e14:	00 00 00 
 e16:	e4 87 57    	sub\.w     w15, #0x4, w15
 e18:	00 00 f8    	push      0x0
 e1a:	00 00 f8    	push      0x0
 e1c:	00 00 20    	mov\.w     #0x0, w0
 e1e:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e20:	00 00 02    	call      0x0 \<_main\>
 e22:	00 00 00 
 e24:	e6 87 57    	sub\.w     w15, #0x6, w15
 e26:	00 00 06    	return    
 e28:	00 00 04    	goto      0x0 \<_main\>
 e2a:	00 00 00 
 e2c:	00 40 da    	\.pword 0xda4000

00000e2e \<fail_SA\>:
 e2e:	00 20 ec    	inc\.w     0x0
 e30:	00 00 f8    	push      0x0
 e32:	00 00 20    	mov\.w     #0x0, w0
 e34:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e36:	00 00 02    	call      0x0 \<_main\>
 e38:	00 00 00 
 e3a:	e4 87 57    	sub\.w     w15, #0x4, w15
 e3c:	00 00 f8    	push      0x0
 e3e:	00 00 f8    	push      0x0
 e40:	00 00 20    	mov\.w     #0x0, w0
 e42:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e44:	00 00 02    	call      0x0 \<_main\>
 e46:	00 00 00 
 e48:	e6 87 57    	sub\.w     w15, #0x6, w15
 e4a:	00 00 06    	return    
 e4c:	00 00 04    	goto      0x0 \<_main\>
 e4e:	00 00 00 
 e50:	00 40 da    	\.pword 0xda4000

00000e52 \<fail_SB\>:
 e52:	00 20 ec    	inc\.w     0x0
 e54:	00 00 f8    	push      0x0
 e56:	00 00 20    	mov\.w     #0x0, w0
 e58:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e5a:	00 00 02    	call      0x0 \<_main\>
 e5c:	00 00 00 
 e5e:	e4 87 57    	sub\.w     w15, #0x4, w15
 e60:	00 00 f8    	push      0x0
 e62:	00 00 f8    	push      0x0
 e64:	00 00 20    	mov\.w     #0x0, w0
 e66:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e68:	00 00 02    	call      0x0 \<_main\>
 e6a:	00 00 00 
 e6c:	e6 87 57    	sub\.w     w15, #0x6, w15
 e6e:	00 00 06    	return    
 e70:	00 00 04    	goto      0x0 \<_main\>
 e72:	00 00 00 
 e74:	00 40 da    	\.pword 0xda4000

00000e76 \<fail_OAB\>:
 e76:	00 20 ec    	inc\.w     0x0
 e78:	00 00 f8    	push      0x0
 e7a:	00 00 20    	mov\.w     #0x0, w0
 e7c:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e7e:	00 00 02    	call      0x0 \<_main\>
 e80:	00 00 00 
 e82:	e4 87 57    	sub\.w     w15, #0x4, w15
 e84:	00 00 f8    	push      0x0
 e86:	00 00 f8    	push      0x0
 e88:	00 00 20    	mov\.w     #0x0, w0
 e8a:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 e8c:	00 00 02    	call      0x0 \<_main\>
 e8e:	00 00 00 
 e90:	e6 87 57    	sub\.w     w15, #0x6, w15
 e92:	00 00 06    	return    
 e94:	00 00 04    	goto      0x0 \<_main\>
 e96:	00 00 00 
 e98:	00 40 da    	\.pword 0xda4000

00000e9a \<fail_SAB\>:
 e9a:	00 20 ec    	inc\.w     0x0
 e9c:	00 00 f8    	push      0x0
 e9e:	00 00 20    	mov\.w     #0x0, w0
 ea0:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 ea2:	00 00 02    	call      0x0 \<_main\>
 ea4:	00 00 00 
 ea6:	e4 87 57    	sub\.w     w15, #0x4, w15
 ea8:	00 00 f8    	push      0x0
 eaa:	00 00 f8    	push      0x0
 eac:	00 00 20    	mov\.w     #0x0, w0
 eae:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 eb0:	00 00 02    	call      0x0 \<_main\>
 eb2:	00 00 00 
 eb4:	e6 87 57    	sub\.w     w15, #0x6, w15
 eb6:	00 00 06    	return    
 eb8:	00 00 04    	goto      0x0 \<_main\>
 eba:	00 00 00 
 ebc:	00 40 da    	\.pword 0xda4000

00000ebe \<Fail_end\>:
 ebe:	00 00 20    	mov\.w     #0x0, w0
 ec0:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 ec2:	00 00 02    	call      0x0 \<_main\>
 ec4:	00 00 00 
 ec6:	8f 07 e9    	dec\.w     w15, w15
 ec8:	00 40 da    	\.pword 0xda4000

00000eca \<Pass_end\>:
 eca:	00 00 20    	mov\.w     #0x0, w0
 ecc:	80 1f 78    	mov\.w     w0, \[w15\+\+\]
 ece:	00 00 02    	call      0x0 \<_main\>
 ed0:	00 00 00 
 ed2:	8f 07 e9    	dec\.w     w15, w15
 ed4:	00 40 da    	\.pword 0xda4000
Disassembly of section __FWDT:

00000000 \<__FWDT\>:
   0:	c0 7f 00    	nop       
