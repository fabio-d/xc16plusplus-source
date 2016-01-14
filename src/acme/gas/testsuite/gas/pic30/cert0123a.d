#as: 
#objdump: -d
#name: \.rept, Repeat sequence of lines

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

00000012 \<L31\>:
  12:	06 ac b8    	mul\.us    w5, w6, w8
  14:	16 00 20    	mov\.w     \#0x1, w6

00000016 \<L41\>:
  16:	86 83 4a    	addc\.w    w5, w6, w7
  18:	06 ac b8    	mul\.us    w5, w6, w8
  1a:	00 00 37    	bra       0x1c \<L51\>

0000001c \<L51\>:
  1c:	16 00 20    	mov\.w     \#0x1, w6
  1e:	86 83 4a    	addc\.w    w5, w6, w7
  20:	16 00 20    	mov\.w     \#0x1, w6
  22:	06 ac b8    	mul\.us    w5, w6, w8

00000024 \<L61\>:
  24:	16 00 20    	mov\.w     \#0x1, w6
  26:	86 83 4a    	addc\.w    w5, w6, w7
  28:	06 ac b8    	mul\.us    w5, w6, w8
  2a:	01 04 78    	mov\.w     w1, w8
  2c:	f5 a9 2f    	mov\.w     \#0xfa9f, w5

0000002e \<L71\>:
  2e:	16 00 20    	mov\.w     \#0x1, w6
  30:	86 83 4a    	addc\.w    w5, w6, w7
  32:	06 ac b8    	mul\.us    w5, w6, w8
  34:	16 00 20    	mov\.w     \#0x1, w6

00000036 \<L81\>:
  36:	86 83 4a    	addc\.w    w5, w6, w7
  38:	06 ac b8    	mul\.us    w5, w6, w8
  3a:	16 00 20    	mov\.w     \#0x1, w6

0000003c \<L91\>:
  3c:	86 83 4a    	addc\.w    w5, w6, w7
  3e:	06 ac b8    	mul\.us    w5, w6, w8

00000040 \<L1\>:
  40:	00 00 04    	goto      0x0 \<main\>
  42:	00 00 00 

00000044 \<L2\>:
  44:	00 00 04    	goto      0x0 \<main\>
  46:	00 00 00 

00000048 \<L3\>:
  48:	00 00 04    	goto      0x0 \<main\>
  4a:	00 00 00 

0000004c \<L4\>:
  4c:	00 00 04    	goto      0x0 \<main\>
  4e:	00 00 00 

00000050 \<L5\>:
  50:	00 00 04    	goto      0x0 \<main\>
  52:	00 00 00 
