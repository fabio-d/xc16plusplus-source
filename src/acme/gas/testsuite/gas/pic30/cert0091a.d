#as: 
#objdump: -d
#name: .irp, Eval statements assigning to sym
#source: cert0091a.s

dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<main\>:
   0:	55 00 20    	mov\.w     #0x5, w5
   2:	16 00 20    	mov\.w     #0x1, w6

00000004 \<L11\>:
   4:	86 83 4a    	addc\.w    w5, w6, w7
   6:	06 ac b8    	mul\.us    w5, w6, w8
   8:	16 00 20    	mov\.w     #0x1, w6

0000000a \<L21\>:
   a:	86 83 4a    	addc\.w    w5, w6, w7
   c:	06 ac b8    	mul\.us    w5, w6, w8
   e:	16 00 20    	mov\.w     #0x1, w6
  10:	86 83 4a    	addc\.w    w5, w6, w7

00000012 \<L31\>:
  12:	06 ac b8    	mul\.us    w5, w6, w8
  14:	16 00 20    	mov\.w     #0x1, w6

00000016 \<L41\>:
  16:	86 83 4a    	addc\.w    w5, w6, w7
  18:	06 ac b8    	mul\.us    w5, w6, w8
  1a:	00 00 37    	bra       0x1c \<L51\>

0000001c \<L51\>:
  1c:	16 00 20    	mov\.w     #0x1, w6
  1e:	86 83 4a    	addc\.w    w5, w6, w7
  20:	16 00 20    	mov\.w     #0x1, w6
  22:	06 ac b8    	mul\.us    w5, w6, w8

00000024 \<L61\>:
  24:	16 00 20    	mov\.w     #0x1, w6
  26:	86 83 4a    	addc\.w    w5, w6, w7
  28:	06 ac b8    	mul\.us    w5, w6, w8
  2a:	01 04 78    	mov\.w     w1, w8
  2c:	18 00 20    	mov\.w     #0x1, w8
  2e:	28 00 20    	mov\.w     #0x2, w8
  30:	38 00 20    	mov\.w     #0x3, w8
  32:	48 00 20    	mov\.w     #0x4, w8
  34:	58 00 20    	mov\.w     #0x5, w8
  36:	68 00 20    	mov\.w     #0x6, w8
  38:	78 00 20    	mov\.w     #0x7, w8
  3a:	88 00 20    	mov\.w     #0x8, w8
  3c:	98 00 20    	mov\.w     #0x9, w8
  3e:	a8 00 20    	mov\.w     #0xa, w8
  40:	b8 00 20    	mov\.w     #0xb, w8
  42:	c8 00 20    	mov\.w     #0xc, w8
  44:	d8 00 20    	mov\.w     #0xd, w8
  46:	e8 00 20    	mov\.w     #0xe, w8
  48:	f8 00 20    	mov\.w     #0xf, w8
  4a:	08 01 20    	mov\.w     #0x10, w8
  4c:	18 01 20    	mov\.w     #0x11, w8
  4e:	28 01 20    	mov\.w     #0x12, w8
  50:	38 01 20    	mov\.w     #0x13, w8
  52:	48 01 20    	mov\.w     #0x14, w8
  54:	f5 a9 2f    	mov\.w     #0xfa9f, w5

00000056 \<L71\>:
  56:	16 00 20    	mov\.w     #0x1, w6
  58:	86 83 4a    	addc\.w    w5, w6, w7
  5a:	06 ac b8    	mul\.us    w5, w6, w8
  5c:	16 00 20    	mov\.w     #0x1, w6

0000005e \<L81\>:
  5e:	86 83 4a    	addc\.w    w5, w6, w7
  60:	06 ac b8    	mul\.us    w5, w6, w8
  62:	16 00 20    	mov\.w     #0x1, w6

00000064 \<L91\>:
  64:	86 83 4a    	addc\.w    w5, w6, w7
  66:	06 ac b8    	mul\.us    w5, w6, w8

00000068 \<L1\>:
  68:	00 00 04    	goto      0x0 \<main\>
  6a:	00 00 00 
