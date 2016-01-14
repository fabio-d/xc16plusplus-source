#as:
#objdump: -d
#name: .equiv Set Value of an undefined symbol
#source: cert0070a.s


dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<\.text\>:
   0:	00 00 04    	goto      0x0 \<\.text\>
   2:	00 00 00 
   4:	00 00 04    	goto      0x0 \<\.text\>
   6:	00 00 00 
   8:	00 00 ff    	nopr      

0000000a \<foo\>:
   a:	00 00 ff    	nopr      

0000000c \<main\>:
   c:	16 00 80    	mov\.w     0x2, w6
   e:	26 00 80    	mov\.w     0x4, w6
  10:	36 00 80    	mov\.w     0x6, w6
  12:	46 00 80    	mov\.w     0x8, w6
  14:	56 00 80    	mov\.w     0xa, w6
  16:	66 00 80    	mov\.w     0xc, w6
  18:	55 00 20    	mov\.w     \#0x5, w5
  1a:	16 00 20    	mov\.w     \#0x1, w6

0000001c \<L11\>:
  1c:	86 83 4a    	addc\.w    w5, w6, w7
  1e:	06 ac b8    	mul\.us    w5, w6, w8
  20:	16 00 20    	mov\.w     \#0x1, w6

00000022 \<L21\>:
  22:	86 83 4a    	addc\.w    w5, w6, w7
  24:	06 ac b8    	mul\.us    w5, w6, w8
  26:	16 00 20    	mov\.w     \#0x1, w6
  28:	86 83 4a    	addc\.w    w5, w6, w7

0000002a \<L31\>:
  2a:	06 ac b8    	mul\.us    w5, w6, w8
  2c:	16 00 20    	mov\.w     \#0x1, w6

0000002e \<L41\>:
  2e:	86 83 4a    	addc\.w    w5, w6, w7
  30:	06 ac b8    	mul\.us    w5, w6, w8

00000032 \<L51\>:
  32:	16 00 20    	mov\.w     \#0x1, w6
  34:	86 83 4a    	addc\.w    w5, w6, w7
  36:	06 ac b8    	mul\.us    w5, w6, w8

00000038 \<L61\>:
  38:	16 00 20    	mov\.w     \#0x1, w6
  3a:	86 83 4a    	addc\.w    w5, w6, w7
  3c:	06 ac b8    	mul\.us    w5, w6, w8

0000003e \<L71\>:
  3e:	16 00 20    	mov\.w     \#0x1, w6
  40:	86 83 4a    	addc\.w    w5, w6, w7
  42:	06 ac b8    	mul\.us    w5, w6, w8
  44:	16 00 20    	mov\.w     \#0x1, w6

00000046 \<L81\>:
  46:	86 83 4a    	addc\.w    w5, w6, w7
  48:	06 ac b8    	mul\.us    w5, w6, w8
  4a:	16 00 20    	mov\.w     \#0x1, w6

0000004c \<L91\>:
  4c:	86 83 4a    	addc\.w    w5, w6, w7
  4e:	06 ac b8    	mul\.us    w5, w6, w8

00000050 \<L1\>:
  50:	00 00 04    	goto      0x0 \<\.text\>
  52:	00 00 00 
  54:	00 00 04    	goto      0x0 \<\.text\>
  56:	00 00 00 
  58:	00 00 04    	goto      0x0 \<\.text\>
  5a:	00 00 00 
  5c:	00 00 04    	goto      0x0 \<\.text\>
  5e:	00 00 00 
  60:	00 00 04    	goto      0x0 \<\.text\>
  62:	00 00 00 
  64:	00 00 04    	goto      0x0 \<\.text\>
  66:	00 00 00 
  68:	00 00 04    	goto      0x0 \<\.text\>
  6a:	00 00 00 
  6c:	00 00 04    	goto      0x0 \<\.text\>
  6e:	00 00 00 
  70:	00 00 04    	goto      0x0 \<\.text\>
  72:	00 00 00 
  74:	00 00 04    	goto      0x0 \<\.text\>
  76:	00 00 00 
  78:	00 00 04    	goto      0x0 \<\.text\>
  7a:	00 00 00 
