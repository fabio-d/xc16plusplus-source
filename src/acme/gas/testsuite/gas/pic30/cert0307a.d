#as:
#objdump: -d
#name: .porg Advance Location Counter, text, limits

dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<main\>:
   0:	55 00 20    	mov\.w     \#0x5, w5
   2:	16 00 20    	mov\.w     \#0x1, w6

00000004 \<L11\>:
   4:	86 83 4a    	addc\.w    w5, w6, w7
   6:	06 ac b8    	mul\.us    w5, w6, w8
   8:	16 00 20    	mov\.w     \#0x1, w6

0000000a \<L21\>:
   a:	86 83 4a    	addc\.w    w5, w6, w7
   c:	06 ac b8    	mul\.us    w5, w6, w8
   e:	16 00 20    	mov\.w     \#0x1, w6
  10:	86 83 4a    	addc\.w    w5, w6, w7
  12:	00 00 37    	bra       0x14
  14:	a5 a5 a5    	\.pword 0xa5a5a5
  16:	a5 a5 a5    	\.pword 0xa5a5a5
  18:	a5 a5 a5    	\.pword 0xa5a5a5
  1a:	a5 a5 a5    	\.pword 0xa5a5a5
  1c:	a5 a5 a5    	\.pword 0xa5a5a5
  1e:	a5 a5 a5    	\.pword 0xa5a5a5
  20:	a5 a5 a5    	\.pword 0xa5a5a5
  22:	a5 a5 a5    	\.pword 0xa5a5a5
  24:	a5 a5 a5    	\.pword 0xa5a5a5
  26:	a5 a5 a5    	\.pword 0xa5a5a5
  28:	a5 a5 a5    	\.pword 0xa5a5a5
  2a:	a5 a5 a5    	\.pword 0xa5a5a5
  2c:	a5 a5 a5    	\.pword 0xa5a5a5
  2e:	a5 a5 a5    	\.pword 0xa5a5a5
  30:	a5 a5 a5    	\.pword 0xa5a5a5
  32:	a5 a5 a5    	\.pword 0xa5a5a5
  34:	a5 a5 a5    	\.pword 0xa5a5a5
  36:	a5 a5 a5    	\.pword 0xa5a5a5
  38:	a5 a5 a5    	\.pword 0xa5a5a5
  3a:	a5 a5 a5    	\.pword 0xa5a5a5
  3c:	a5 a5 a5    	\.pword 0xa5a5a5
  3e:	a5 a5 a5    	\.pword 0xa5a5a5
  40:	a5 a5 a5    	\.pword 0xa5a5a5
  42:	a5 a5 a5    	\.pword 0xa5a5a5
  44:	a5 a5 a5    	\.pword 0xa5a5a5
  46:	a5 a5 a5    	\.pword 0xa5a5a5
  48:	a5 a5 a5    	\.pword 0xa5a5a5
  4a:	a5 a5 a5    	\.pword 0xa5a5a5
  4c:	a5 a5 a5    	\.pword 0xa5a5a5
  4e:	a5 a5 a5    	\.pword 0xa5a5a5
  50:	a5 a5 a5    	\.pword 0xa5a5a5
  52:	a5 a5 a5    	\.pword 0xa5a5a5
  54:	a5 a5 a5    	\.pword 0xa5a5a5
  56:	a5 a5 a5    	\.pword 0xa5a5a5
  58:	a5 a5 a5    	\.pword 0xa5a5a5
  5a:	a5 a5 a5    	\.pword 0xa5a5a5
  5c:	a5 a5 a5    	\.pword 0xa5a5a5
  5e:	a5 a5 a5    	\.pword 0xa5a5a5
  60:	a5 a5 a5    	\.pword 0xa5a5a5
  62:	a5 a5 a5    	\.pword 0xa5a5a5
  64:	a5 a5 a5    	\.pword 0xa5a5a5
  66:	a5 a5 a5    	\.pword 0xa5a5a5
  68:	a5 a5 a5    	\.pword 0xa5a5a5
  6a:	a5 a5 a5    	\.pword 0xa5a5a5
  6c:	a5 a5 a5    	\.pword 0xa5a5a5
  6e:	a5 a5 a5    	\.pword 0xa5a5a5
  70:	a5 a5 a5    	\.pword 0xa5a5a5
  72:	a5 a5 a5    	\.pword 0xa5a5a5
  74:	a5 a5 a5    	\.pword 0xa5a5a5
  76:	a5 a5 a5    	\.pword 0xa5a5a5
  78:	a5 a5 a5    	\.pword 0xa5a5a5
  7a:	a5 a5 a5    	\.pword 0xa5a5a5
  7c:	a5 a5 a5    	\.pword 0xa5a5a5
  7e:	a5 a5 a5    	\.pword 0xa5a5a5
  80:	a5 a5 a5    	\.pword 0xa5a5a5
  82:	a5 a5 a5    	\.pword 0xa5a5a5
  84:	a5 a5 a5    	\.pword 0xa5a5a5
  86:	a5 a5 a5    	\.pword 0xa5a5a5
  88:	a5 a5 a5    	\.pword 0xa5a5a5
  8a:	a5 a5 a5    	\.pword 0xa5a5a5
  8c:	a5 a5 a5    	\.pword 0xa5a5a5
  8e:	a5 a5 a5    	\.pword 0xa5a5a5
  90:	a5 a5 a5    	\.pword 0xa5a5a5
  92:	a5 a5 a5    	\.pword 0xa5a5a5
  94:	a5 a5 a5    	\.pword 0xa5a5a5
  96:	a5 a5 a5    	\.pword 0xa5a5a5
  98:	a5 a5 a5    	\.pword 0xa5a5a5
  9a:	a5 a5 a5    	\.pword 0xa5a5a5
  9c:	a5 a5 a5    	\.pword 0xa5a5a5
  9e:	a5 a5 a5    	\.pword 0xa5a5a5
  a0:	a5 a5 a5    	\.pword 0xa5a5a5
  a2:	a5 a5 a5    	\.pword 0xa5a5a5
  a4:	a5 a5 a5    	\.pword 0xa5a5a5
  a6:	a5 a5 a5    	\.pword 0xa5a5a5
  a8:	a5 a5 a5    	\.pword 0xa5a5a5
  aa:	a5 a5 a5    	\.pword 0xa5a5a5
  ac:	a5 a5 a5    	\.pword 0xa5a5a5
  ae:	a5 a5 a5    	\.pword 0xa5a5a5
  b0:	a5 a5 a5    	\.pword 0xa5a5a5
  b2:	a5 a5 a5    	\.pword 0xa5a5a5
  b4:	a5 a5 a5    	\.pword 0xa5a5a5
  b6:	a5 a5 a5    	\.pword 0xa5a5a5
  b8:	a5 a5 a5    	\.pword 0xa5a5a5
  ba:	a5 a5 a5    	\.pword 0xa5a5a5
  bc:	a5 a5 a5    	\.pword 0xa5a5a5
  be:	a5 a5 a5    	\.pword 0xa5a5a5
  c0:	a5 a5 a5    	\.pword 0xa5a5a5
  c2:	a5 a5 a5    	\.pword 0xa5a5a5
  c4:	a5 a5 a5    	\.pword 0xa5a5a5
  c6:	a5 a5 a5    	\.pword 0xa5a5a5
  c8:	a5 a5 a5    	\.pword 0xa5a5a5
  ca:	a5 a5 a5    	\.pword 0xa5a5a5
  cc:	a5 a5 a5    	\.pword 0xa5a5a5
  ce:	a5 a5 a5    	\.pword 0xa5a5a5
  d0:	a5 a5 a5    	\.pword 0xa5a5a5
  d2:	a5 a5 a5    	\.pword 0xa5a5a5
  d4:	a5 a5 a5    	\.pword 0xa5a5a5
  d6:	a5 a5 a5    	\.pword 0xa5a5a5
  d8:	a5 a5 a5    	\.pword 0xa5a5a5
  da:	a5 a5 a5    	\.pword 0xa5a5a5
  dc:	a5 a5 a5    	\.pword 0xa5a5a5
  de:	a5 a5 a5    	\.pword 0xa5a5a5
  e0:	a5 a5 a5    	\.pword 0xa5a5a5
  e2:	a5 a5 a5    	\.pword 0xa5a5a5
  e4:	a5 a5 a5    	\.pword 0xa5a5a5
  e6:	a5 a5 a5    	\.pword 0xa5a5a5
  e8:	a5 a5 a5    	\.pword 0xa5a5a5
  ea:	a5 a5 a5    	\.pword 0xa5a5a5
  ec:	a5 a5 a5    	\.pword 0xa5a5a5
  ee:	a5 a5 a5    	\.pword 0xa5a5a5
  f0:	a5 a5 a5    	\.pword 0xa5a5a5
  f2:	a5 a5 a5    	\.pword 0xa5a5a5
  f4:	a5 a5 a5    	\.pword 0xa5a5a5
  f6:	a5 a5 a5    	\.pword 0xa5a5a5
  f8:	a5 a5 a5    	\.pword 0xa5a5a5
  fa:	a5 a5 a5    	\.pword 0xa5a5a5
  fc:	a5 a5 a5    	\.pword 0xa5a5a5
  fe:	a5 a5 a5    	\.pword 0xa5a5a5
 100:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 102:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 104:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 106:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 108:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 10a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 10c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 10e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 110:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 112:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 114:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 116:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 118:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 11a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 11c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 11e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 120:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 122:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 124:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 126:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 128:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 12a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 12c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 12e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 130:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 132:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 134:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 136:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 138:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 13a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 13c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 13e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 140:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 142:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 144:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 146:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 148:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 14a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 14c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 14e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 150:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 152:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 154:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 156:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 158:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 15a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 15c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 15e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 160:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 162:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 164:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 166:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 168:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 16a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 16c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 16e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 170:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 172:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 174:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 176:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 178:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 17a:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 17c:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 17e:	56 56 56    	sub\.b     w12, \[\+\+w6\], \[w12--\]
 180:	a5 a5 a5    	\.pword 0xa5a5a5
 182:	a5 a5 a5    	\.pword 0xa5a5a5
 184:	a5 a5 a5    	\.pword 0xa5a5a5
 186:	a5 a5 a5    	\.pword 0xa5a5a5
 188:	a5 a5 a5    	\.pword 0xa5a5a5
 18a:	a5 a5 a5    	\.pword 0xa5a5a5
 18c:	a5 a5 a5    	\.pword 0xa5a5a5
 18e:	a5 a5 a5    	\.pword 0xa5a5a5
 190:	a5 a5 a5    	\.pword 0xa5a5a5
 192:	a5 a5 a5    	\.pword 0xa5a5a5
 194:	a5 a5 a5    	\.pword 0xa5a5a5
 196:	a5 a5 a5    	\.pword 0xa5a5a5
 198:	a5 a5 a5    	\.pword 0xa5a5a5
 19a:	a5 a5 a5    	\.pword 0xa5a5a5
 19c:	a5 a5 a5    	\.pword 0xa5a5a5
 19e:	a5 a5 a5    	\.pword 0xa5a5a5
 1a0:	a5 a5 a5    	\.pword 0xa5a5a5
 1a2:	a5 a5 a5    	\.pword 0xa5a5a5
 1a4:	a5 a5 a5    	\.pword 0xa5a5a5
 1a6:	a5 a5 a5    	\.pword 0xa5a5a5
 1a8:	a5 a5 a5    	\.pword 0xa5a5a5
 1aa:	a5 a5 a5    	\.pword 0xa5a5a5
 1ac:	a5 a5 a5    	\.pword 0xa5a5a5
 1ae:	a5 a5 a5    	\.pword 0xa5a5a5
 1b0:	a5 a5 a5    	\.pword 0xa5a5a5
 1b2:	a5 a5 a5    	\.pword 0xa5a5a5
 1b4:	a5 a5 a5    	\.pword 0xa5a5a5
 1b6:	a5 a5 a5    	\.pword 0xa5a5a5
 1b8:	a5 a5 a5    	\.pword 0xa5a5a5
 1ba:	a5 a5 a5    	\.pword 0xa5a5a5
 1bc:	a5 a5 a5    	\.pword 0xa5a5a5
 1be:	a5 a5 a5    	\.pword 0xa5a5a5
 1c0:	a5 a5 a5    	\.pword 0xa5a5a5
 1c2:	a5 a5 a5    	\.pword 0xa5a5a5
 1c4:	a5 a5 a5    	\.pword 0xa5a5a5
 1c6:	a5 a5 a5    	\.pword 0xa5a5a5
 1c8:	a5 a5 a5    	\.pword 0xa5a5a5
 1ca:	a5 a5 a5    	\.pword 0xa5a5a5
 1cc:	a5 a5 a5    	\.pword 0xa5a5a5
 1ce:	a5 a5 a5    	\.pword 0xa5a5a5
 1d0:	a5 a5 a5    	\.pword 0xa5a5a5
 1d2:	a5 a5 a5    	\.pword 0xa5a5a5
 1d4:	a5 a5 a5    	\.pword 0xa5a5a5
 1d6:	a5 a5 a5    	\.pword 0xa5a5a5
 1d8:	a5 a5 a5    	\.pword 0xa5a5a5
 1da:	a5 a5 a5    	\.pword 0xa5a5a5
 1dc:	a5 a5 a5    	\.pword 0xa5a5a5
 1de:	a5 a5 a5    	\.pword 0xa5a5a5
 1e0:	a5 a5 a5    	\.pword 0xa5a5a5
 1e2:	a5 a5 a5    	\.pword 0xa5a5a5
 1e4:	a5 a5 a5    	\.pword 0xa5a5a5
 1e6:	a5 a5 a5    	\.pword 0xa5a5a5
 1e8:	a5 a5 a5    	\.pword 0xa5a5a5
 1ea:	a5 a5 a5    	\.pword 0xa5a5a5
 1ec:	a5 a5 a5    	\.pword 0xa5a5a5
 1ee:	a5 a5 a5    	\.pword 0xa5a5a5
 1f0:	ff ff 34    	bra       LE, \.
 1f2:	ff ff 34    	bra       LE, \.
 1f4:	ff ff 34    	bra       LE, \.
 1f6:	ff ff 34    	bra       LE, \.
 1f8:	ff ff 34    	bra       LE, \.
 1fa:	ff ff 34    	bra       LE, \.
 1fc:	ff ff 34    	bra       LE, \.
 1fe:	ff ff 34    	bra       LE, \.

00000200 \<L31\>:
 200:	06 ac b8    	mul\.us    w5, w6, w8
 202:	00 00 37    	bra       0x204
 204:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 206:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 208:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 20a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 20c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 20e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 210:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 212:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 214:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 216:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 218:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 21a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 21c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 21e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 220:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 222:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 224:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 226:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 228:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 22a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 22c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 22e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 230:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 232:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 234:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 236:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 238:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 23a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 23c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 23e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 240:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 242:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 244:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 246:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 248:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 24a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 24c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 24e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 250:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 252:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 254:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 256:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 258:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 25a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 25c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 25e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 260:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 262:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 264:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 266:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 268:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 26a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 26c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 26e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 270:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 272:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 274:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 276:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 278:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 27a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 27c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 27e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 280:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 282:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 284:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 286:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 288:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 28a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 28c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 28e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 290:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 292:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 294:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 296:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 298:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 29a:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 29c:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 29e:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2a0:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2a2:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2a4:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2a6:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2a8:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2aa:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ac:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ae:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2b0:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2b2:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2b4:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2b6:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2b8:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ba:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2bc:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2be:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2c0:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2c2:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2c4:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2c6:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2c8:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ca:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2cc:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ce:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2d0:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2d2:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2d4:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2d6:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2d8:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2da:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2dc:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2de:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2e0:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2e2:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2e4:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2e6:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2e8:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ea:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ec:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2ee:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2f0:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2f2:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2f4:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2f6:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2f8:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2fa:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2fc:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 2fe:	5a 5a 5a    	subb\.b    w4, \[\+\+w10\], \[w4\+\+\]
 300:	00 00 00    	nop       
 302:	00 00 37    	bra       0x304
 304:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 306:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 308:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 30a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 30c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 30e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 310:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 312:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 314:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 316:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 318:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 31a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 31c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 31e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 320:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 322:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 324:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 326:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 328:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 32a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 32c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 32e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 330:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 332:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 334:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 336:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 338:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 33a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 33c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 33e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 340:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 342:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 344:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 346:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 348:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 34a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 34c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 34e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 350:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 352:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 354:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 356:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 358:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 35a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 35c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 35e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 360:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 362:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 364:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 366:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 368:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 36a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 36c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 36e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 370:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 372:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 374:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 376:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 378:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 37a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 37c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 37e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 380:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 382:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 384:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 386:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 388:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 38a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 38c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 38e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 390:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 392:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 394:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 396:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 398:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 39a:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 39c:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 39e:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3a0:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3a2:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3a4:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3a6:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3a8:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3aa:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ac:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ae:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3b0:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3b2:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3b4:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3b6:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3b8:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ba:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3bc:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3be:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3c0:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3c2:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3c4:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3c6:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3c8:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ca:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3cc:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ce:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3d0:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3d2:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3d4:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3d6:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3d8:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3da:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3dc:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3de:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3e0:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3e2:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3e4:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3e6:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3e8:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ea:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ec:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3ee:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3f0:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3f2:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3f4:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3f6:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3f8:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3fa:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3fc:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 3fe:	55 55 55    	sub\.b     w10, \[\+\+w5\], \[w10--\]
 400:	00 00 00    	nop       
 402:	00 00 37    	bra       0x404
	\.\.\.
 482:	00 00 37    	bra       0x484
 484:	aa aa 00    	nop       
 486:	aa aa 00    	nop       
 488:	aa aa 00    	nop       
 48a:	aa aa 00    	nop       
 48c:	aa aa 00    	nop       
 48e:	aa aa 00    	nop       
 490:	aa aa 00    	nop       
 492:	aa aa 00    	nop       
 494:	aa aa 00    	nop       
 496:	aa aa 00    	nop       
 498:	aa aa 00    	nop       
 49a:	aa aa 00    	nop       
 49c:	aa aa 00    	nop       
 49e:	aa aa 00    	nop       
 4a0:	aa aa 00    	nop       
 4a2:	aa aa 00    	nop       
 4a4:	aa aa 00    	nop       
 4a6:	aa aa 00    	nop       
 4a8:	aa aa 00    	nop       
 4aa:	aa aa 00    	nop       
 4ac:	aa aa 00    	nop       
 4ae:	aa aa 00    	nop       
 4b0:	aa aa 00    	nop       
 4b2:	aa aa 00    	nop       
 4b4:	aa aa 00    	nop       
 4b6:	aa aa 00    	nop       
 4b8:	aa aa 00    	nop       
 4ba:	aa aa 00    	nop       
 4bc:	aa aa 00    	nop       
 4be:	aa aa 00    	nop       
 4c0:	aa aa 00    	nop       
 4c2:	aa aa 00    	nop       
 4c4:	aa aa 00    	nop       
 4c6:	aa aa 00    	nop       
 4c8:	aa aa 00    	nop       
 4ca:	aa aa 00    	nop       
 4cc:	aa aa 00    	nop       
 4ce:	aa aa 00    	nop       
 4d0:	aa aa 00    	nop       
 4d2:	aa aa 00    	nop       
 4d4:	aa aa 00    	nop       
 4d6:	aa aa 00    	nop       
 4d8:	aa aa 00    	nop       
 4da:	aa aa 00    	nop       
 4dc:	aa aa 00    	nop       
 4de:	aa aa 00    	nop       
 4e0:	aa aa 00    	nop       
 4e2:	aa aa 00    	nop       
 4e4:	aa aa 00    	nop       
 4e6:	aa aa 00    	nop       
 4e8:	aa aa 00    	nop       
 4ea:	aa aa 00    	nop       
 4ec:	aa aa 00    	nop       
 4ee:	aa aa 00    	nop       
 4f0:	aa aa 00    	nop       
 4f2:	aa aa 00    	nop       
 4f4:	aa aa 00    	nop       
 4f6:	aa aa 00    	nop       
 4f8:	aa aa 00    	nop       
 4fa:	aa aa 00    	nop       
 4fc:	aa aa 00    	nop       
 4fe:	aa aa 00    	nop       

00000500 \<L22\>:
 500:	16 00 20    	mov\.w     \#0x1, w6

00000502 \<L41\>:
 502:	86 83 4a    	addc\.w    w5, w6, w7
 504:	06 ac b8    	mul\.us    w5, w6, w8
 506:	00 00 37    	bra       0x508
	\.\.\.

00000580 \<L51\>:
 580:	16 00 20    	mov\.w     \#0x1, w6
 582:	86 83 4a    	addc\.w    w5, w6, w7
 584:	16 00 20    	mov\.w     \#0x1, w6
 586:	06 ac b8    	mul\.us    w5, w6, w8

00000588 \<L61\>:
 588:	16 00 20    	mov\.w     \#0x1, w6
 58a:	86 83 4a    	addc\.w    w5, w6, w7
 58c:	06 ac b8    	mul\.us    w5, w6, w8
 58e:	01 04 78    	mov\.w     w1, w8
 590:	f5 a9 2f    	mov\.w     \#0xfa9f, w5

00000592 \<L71\>:
 592:	16 00 20    	mov\.w     \#0x1, w6
 594:	86 83 4a    	addc\.w    w5, w6, w7
 596:	06 ac b8    	mul\.us    w5, w6, w8
 598:	16 00 20    	mov\.w     \#0x1, w6

0000059a \<L81\>:
 59a:	86 83 4a    	addc\.w    w5, w6, w7
 59c:	06 ac b8    	mul\.us    w5, w6, w8
 59e:	16 00 20    	mov\.w     \#0x1, w6

000005a0 \<L91\>:
 5a0:	86 83 4a    	addc\.w    w5, w6, w7
 5a2:	06 ac b8    	mul\.us    w5, w6, w8
 5a4:	01 01 00    	nop       
 5a6:	01 01 00    	nop       
 5a8:	01 01 00    	nop       
 5aa:	01 01 00    	nop       
 5ac:	01 01 00    	nop       
 5ae:	01 01 00    	nop       
 5b0:	01 01 00    	nop       
 5b2:	01 01 00    	nop       
 5b4:	01 01 00    	nop       
 5b6:	01 01 00    	nop       
 5b8:	01 01 00    	nop       
 5ba:	01 01 00    	nop       
 5bc:	01 01 00    	nop       
 5be:	01 01 00    	nop       
 5c0:	01 01 00    	nop       
 5c2:	01 01 00    	nop       
 5c4:	01 01 00    	nop       
 5c6:	01 01 00    	nop       
 5c8:	01 01 00    	nop       
 5ca:	01 01 00    	nop       
 5cc:	01 01 00    	nop       
 5ce:	01 01 00    	nop       
 5d0:	01 01 00    	nop       
 5d2:	01 01 00    	nop       
 5d4:	01 01 00    	nop       
 5d6:	01 01 00    	nop       
 5d8:	01 01 00    	nop       
 5da:	01 01 00    	nop       
 5dc:	01 01 00    	nop       
 5de:	01 01 00    	nop       
 5e0:	01 01 00    	nop       
 5e2:	01 01 00    	nop       
 5e4:	01 01 00    	nop       
 5e6:	01 01 00    	nop       
 5e8:	01 01 00    	nop       
 5ea:	01 01 00    	nop       
 5ec:	01 01 00    	nop       
 5ee:	01 01 00    	nop       
 5f0:	01 01 00    	nop       
 5f2:	01 01 00    	nop       
 5f4:	01 01 00    	nop       
 5f6:	01 01 00    	nop       
 5f8:	01 01 00    	nop       
 5fa:	01 01 00    	nop       
 5fc:	01 01 00    	nop       
 5fe:	01 01 00    	nop       

00000600 \<L1\>:
 600:	00 00 04    	goto      0x0 \<main\>
 602:	00 00 00 
 604:	00 00 04    	goto      0x0 \<main\>
 606:	00 00 00 
 608:	00 00 04    	goto      0x0 \<main\>
 60a:	00 00 00 
	\.\.\.
 680:	00 00 04    	goto      0x0 \<main\>
 682:	00 00 00 
 684:	00 00 04    	goto      0x0 \<main\>
 686:	00 00 00 
 688:	00 00 04    	goto      0x0 \<main\>
 68a:	00 00 00 
 68c:	00 00 04    	goto      0x0 \<main\>
 68e:	00 00 00 
 690:	ff ff ff    	nopr      
 692:	ff ff ff    	nopr      
 694:	ff ff ff    	nopr      
 696:	ff ff ff    	nopr      
 698:	ff ff ff    	nopr      
 69a:	ff ff ff    	nopr      
 69c:	ff ff ff    	nopr      
 69e:	ff ff ff    	nopr      
 6a0:	ff ff ff    	nopr      
 6a2:	ff ff ff    	nopr      
 6a4:	ff ff ff    	nopr      
 6a6:	ff ff ff    	nopr      
 6a8:	ff ff ff    	nopr      
 6aa:	ff ff ff    	nopr      
 6ac:	ff ff ff    	nopr      
 6ae:	ff ff ff    	nopr      
 6b0:	ff ff ff    	nopr      
 6b2:	ff ff ff    	nopr      
 6b4:	ff ff ff    	nopr      
 6b6:	ff ff ff    	nopr      
 6b8:	ff ff ff    	nopr      
 6ba:	ff ff ff    	nopr      
 6bc:	ff ff ff    	nopr      
 6be:	ff ff ff    	nopr      
 6c0:	ff ff ff    	nopr      
 6c2:	ff ff ff    	nopr      
 6c4:	ff ff ff    	nopr      
 6c6:	ff ff ff    	nopr      
 6c8:	ff ff ff    	nopr      
 6ca:	ff ff ff    	nopr      
 6cc:	ff ff ff    	nopr      
 6ce:	ff ff ff    	nopr      
 6d0:	ff ff ff    	nopr      
 6d2:	ff ff ff    	nopr      
 6d4:	ff ff ff    	nopr      
 6d6:	ff ff ff    	nopr      
 6d8:	ff ff ff    	nopr      
 6da:	ff ff ff    	nopr      
 6dc:	ff ff ff    	nopr      
 6de:	ff ff ff    	nopr      
 6e0:	ff ff ff    	nopr      
 6e2:	ff ff ff    	nopr      
 6e4:	ff ff ff    	nopr      
 6e6:	ff ff ff    	nopr      
 6e8:	ff ff ff    	nopr      
 6ea:	ff ff ff    	nopr      
 6ec:	ff ff ff    	nopr      
 6ee:	ff ff ff    	nopr      
 6f0:	ff ff ff    	nopr      
 6f2:	ff ff ff    	nopr      
 6f4:	ff ff ff    	nopr      
 6f6:	ff ff ff    	nopr      
 6f8:	ff ff ff    	nopr      
 6fa:	ff ff ff    	nopr      
 6fc:	ff ff ff    	nopr      
 6fe:	ff ff ff    	nopr      
 700:	00 00 04    	goto      0x0 \<main\>
 702:	00 00 00 
 704:	00 00 04    	goto      0x0 \<main\>
 706:	00 00 00 
 708:	00 00 04    	goto      0x0 \<main\>
 70a:	00 00 00 
 70c:	00 00 04    	goto      0x0 \<main\>
 70e:	00 00 00 
