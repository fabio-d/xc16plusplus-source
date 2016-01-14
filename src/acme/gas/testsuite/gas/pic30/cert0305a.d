#as: 
#objdump: -d
#name: \.org Advance Location Counter
#source: cert0305a\.s


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
  12:	a5 a5 00    	nop       
  14:	a5 a5 00    	nop       
  16:	a5 a5 00    	nop       
  18:	a5 a5 00    	nop       
  1a:	a5 a5 00    	nop       
  1c:	a5 a5 00    	nop       
  1e:	a5 a5 00    	nop       
  20:	a5 a5 00    	nop       
  22:	a5 a5 00    	nop       
  24:	a5 a5 00    	nop       
  26:	a5 a5 00    	nop       
  28:	a5 a5 00    	nop       
  2a:	a5 a5 00    	nop       
  2c:	a5 a5 00    	nop       
  2e:	a5 a5 00    	nop       
  30:	a5 a5 00    	nop       
  32:	a5 a5 00    	nop       
  34:	a5 a5 00    	nop       
  36:	a5 a5 00    	nop       
  38:	a5 a5 00    	nop       
  3a:	a5 a5 00    	nop       
  3c:	a5 a5 00    	nop       
  3e:	a5 a5 00    	nop       
  40:	a5 a5 00    	nop       
  42:	a5 a5 00    	nop       
  44:	a5 a5 00    	nop       
  46:	a5 a5 00    	nop       
  48:	a5 a5 00    	nop       
  4a:	a5 a5 00    	nop       
  4c:	a5 a5 00    	nop       
  4e:	a5 a5 00    	nop       
  50:	a5 a5 00    	nop       
  52:	a5 a5 00    	nop       
  54:	a5 a5 00    	nop       
  56:	a5 a5 00    	nop       
  58:	a5 a5 00    	nop       
  5a:	a5 a5 00    	nop       
  5c:	a5 a5 00    	nop       
  5e:	a5 a5 00    	nop       
  60:	a5 a5 00    	nop       
  62:	a5 a5 00    	nop       
  64:	a5 a5 00    	nop       
  66:	a5 a5 00    	nop       
  68:	a5 a5 00    	nop       
  6a:	a5 a5 00    	nop       
  6c:	a5 a5 00    	nop       
  6e:	a5 a5 00    	nop       
  70:	a5 a5 00    	nop       
  72:	a5 a5 00    	nop       
  74:	a5 a5 00    	nop       
  76:	a5 a5 00    	nop       
  78:	a5 a5 00    	nop       
  7a:	a5 a5 00    	nop       
  7c:	a5 a5 00    	nop       
  7e:	a5 a5 00    	nop       
  80:	a5 a5 00    	nop       
  82:	a5 a5 00    	nop       
  84:	a5 a5 00    	nop       
  86:	a5 a5 00    	nop       
  88:	a5 a5 00    	nop       
  8a:	a5 a5 00    	nop       
  8c:	a5 a5 00    	nop       
  8e:	a5 a5 00    	nop       
  90:	a5 a5 00    	nop       
  92:	a5 a5 00    	nop       
  94:	a5 a5 00    	nop       
  96:	a5 a5 00    	nop       
  98:	a5 a5 00    	nop       
  9a:	a5 a5 00    	nop       
  9c:	a5 a5 00    	nop       
  9e:	a5 a5 00    	nop       
  a0:	a5 a5 00    	nop       
  a2:	a5 a5 00    	nop       
  a4:	a5 a5 00    	nop       
  a6:	a5 a5 00    	nop       
  a8:	a5 a5 00    	nop       
  aa:	a5 a5 00    	nop       
  ac:	a5 a5 00    	nop       
  ae:	a5 a5 00    	nop       
  b0:	a5 a5 00    	nop       
  b2:	a5 a5 00    	nop       
  b4:	a5 a5 00    	nop       
  b6:	a5 a5 00    	nop       
  b8:	a5 a5 00    	nop       
  ba:	a5 a5 00    	nop       
  bc:	a5 a5 00    	nop       
  be:	a5 a5 00    	nop       
  c0:	a5 a5 00    	nop       
  c2:	a5 a5 00    	nop       
  c4:	a5 a5 00    	nop       
  c6:	a5 a5 00    	nop       
  c8:	a5 a5 00    	nop       
  ca:	a5 a5 00    	nop       
  cc:	a5 a5 00    	nop       
  ce:	a5 a5 00    	nop       
  d0:	a5 a5 00    	nop       
  d2:	a5 a5 00    	nop       
  d4:	a5 a5 00    	nop       
  d6:	a5 a5 00    	nop       
  d8:	a5 a5 00    	nop       
  da:	a5 a5 00    	nop       
  dc:	a5 a5 00    	nop       
  de:	a5 a5 00    	nop       
  e0:	a5 a5 00    	nop       
  e2:	a5 a5 00    	nop       
  e4:	a5 a5 00    	nop       
  e6:	a5 a5 00    	nop       
  e8:	a5 a5 00    	nop       
  ea:	a5 a5 00    	nop       
  ec:	a5 a5 00    	nop       
  ee:	a5 a5 00    	nop       
  f0:	a5 a5 00    	nop       
  f2:	a5 a5 00    	nop       
  f4:	a5 a5 00    	nop       
  f6:	a5 a5 00    	nop       
  f8:	a5 a5 00    	nop       
  fa:	a5 a5 00    	nop       
  fc:	a5 a5 00    	nop       
  fe:	a5 a5 00    	nop       

00000100 \<L31\>:
 100:	06 ac b8    	mul\.us    w5, w6, w8
 102:	16 00 20    	mov\.w     \#0x1, w6

00000104 \<L41\>:
 104:	86 83 4a    	addc\.w    w5, w6, w7
 106:	06 ac b8    	mul\.us    w5, w6, w8
 108:	00 00 37    	bra       0x10a \<L51\>

0000010a \<L51\>:
 10a:	16 00 20    	mov\.w     \#0x1, w6
 10c:	86 83 4a    	addc\.w    w5, w6, w7
 10e:	16 00 20    	mov\.w     \#0x1, w6
 110:	06 ac b8    	mul\.us    w5, w6, w8

00000112 \<L61\>:
 112:	16 00 20    	mov\.w     \#0x1, w6
 114:	86 83 4a    	addc\.w    w5, w6, w7
 116:	06 ac b8    	mul\.us    w5, w6, w8
 118:	01 04 78    	mov\.w     w1, w8
 11a:	f5 a9 2f    	mov\.w     \#0xfa9f, w5

0000011c \<L71\>:
 11c:	16 00 20    	mov\.w     \#0x1, w6
 11e:	86 83 4a    	addc\.w    w5, w6, w7
 120:	06 ac b8    	mul\.us    w5, w6, w8
 122:	16 00 20    	mov\.w     \#0x1, w6

00000124 \<L81\>:
 124:	86 83 4a    	addc\.w    w5, w6, w7
 126:	06 ac b8    	mul\.us    w5, w6, w8
 128:	16 00 20    	mov\.w     \#0x1, w6

0000012a \<L91\>:
 12a:	86 83 4a    	addc\.w    w5, w6, w7
 12c:	06 ac b8    	mul\.us    w5, w6, w8

0000012e \<L1\>:
 12e:	00 00 04    	goto      0x0 \<main\>
 130:	00 00 00 
