#as: 
#objdump: -s -d
#name: .fillvalue directive general functionality 2
#source: cert0280b.s

dump\.o:     file format coff-pic30

Contents of section \.text:
 0000 550020 160020 86834a 06acb8  .+
 0008 160020 86834a 06acb8 160020  .+
 0010 86834a 06acb8 160020 86834a  .+
 0018 06acb8 121200 121200 121200  .+
 0020 121200 121200 121200 121200  .+
 0028 121200 160020 86834a 06acb8  .+
 0030 160020 86834a 06acb8 160020  .+
 0038 86834a 06acb8 160020 86834a  .+
 0040 06acb8 160020 86834a 06acb8  .+
 0048 000004 000000                .+
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
  1a:	12 12 00    	nop       
  1c:	12 12 00    	nop       
  1e:	12 12 00    	nop       
  20:	12 12 00    	nop       
  22:	12 12 00    	nop       
  24:	12 12 00    	nop       
  26:	12 12 00    	nop       
  28:	12 12 00    	nop       

0000002a \<L51\>:
  2a:	16 00 20    	mov\.w     \#0x1, w6
  2c:	86 83 4a    	addc\.w    w5, w6, w7
  2e:	06 ac b8    	mul\.us    w5, w6, w8

00000030 \<L61\>:
  30:	16 00 20    	mov\.w     \#0x1, w6
  32:	86 83 4a    	addc\.w    w5, w6, w7
  34:	06 ac b8    	mul\.us    w5, w6, w8

00000036 \<L71\>:
  36:	16 00 20    	mov\.w     \#0x1, w6
  38:	86 83 4a    	addc\.w    w5, w6, w7
  3a:	06 ac b8    	mul\.us    w5, w6, w8
  3c:	16 00 20    	mov\.w     \#0x1, w6

0000003e \<L81\>:
  3e:	86 83 4a    	addc\.w    w5, w6, w7
  40:	06 ac b8    	mul\.us    w5, w6, w8
  42:	16 00 20    	mov\.w     \#0x1, w6

00000044 \<L91\>:
  44:	86 83 4a    	addc\.w    w5, w6, w7
  46:	06 ac b8    	mul\.us    w5, w6, w8

00000048 \<L1\>:
  48:	00 00 04    	goto      0x0 \<main\>
  4a:	00 00 00 
