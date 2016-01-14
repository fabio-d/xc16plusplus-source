#as:
#objdump: -h -d
#name: Assemble code into Section using .section directive, functionality


dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000016  00000000  00000000  00000170  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  1 \.data         00000004  00000000  00000000  0000019c  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 data1         00000004  00000000  00000000  000001a4  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  4 testw         00000008  00000000  00000000  000001ac  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  5 bsstest       00000004  00000000  00000000  00000000  2\*\*1
                  ALLOC
  6 testn         00000008  00000000  00000000  000001bc  2\*\*1
                  CONTENTS, ALLOC, DATA, NEVER_LOAD
  7 testx         00000024  00000000  00000000  000001cc  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
Disassembly of section \.text:

00000000 <main>:
   0:	55 00 20    	mov\.w     \#0x5, w5
   2:	16 00 20    	mov\.w     \#0x1, w6
   4:	86 83 4a    	addc\.w    w5, w6, w7
   6:	06 ac b8    	mul\.us    w5, w6, w8
   8:	16 00 20    	mov\.w     \#0x1, w6
   a:	86 83 4a    	addc\.w    w5, w6, w7
   c:	06 ac b8    	mul\.us    w5, w6, w8
   e:	16 00 20    	mov\.w     \#0x1, w6
  10:	86 83 4a    	addc\.w    w5, w6, w7
  12:	00 00 04    	goto      0x0 \<main\>
  14:	00 00 00 
Disassembly of section testx:

00000000 <testx>:
   0:	16 00 20    	mov\.w     \#0x1, w6
   2:	86 83 4a    	addc\.w    w5, w6, w7
   4:	16 00 20    	mov\.w     \#0x1, w6
   6:	06 ac b8    	mul\.us    w5, w6, w8
   8:	16 00 20    	mov\.w     \#0x1, w6
   a:	86 83 4a    	addc\.w    w5, w6, w7
   c:	06 ac b8    	mul\.us    w5, w6, w8
   e:	01 04 78    	mov\.w     w1, w8
  10:	f5 a9 2f    	mov\.w     \#0xfa9f, w5
  12:	16 00 20    	mov\.w     \#0x1, w6
  14:	86 83 4a    	addc\.w    w5, w6, w7
  16:	06 ac b8    	mul\.us    w5, w6, w8
  18:	16 00 20    	mov\.w     \#0x1, w6
  1a:	86 83 4a    	addc\.w    w5, w6, w7
  1c:	06 ac b8    	mul\.us    w5, w6, w8
  1e:	16 00 20    	mov\.w     \#0x1, w6
  20:	86 83 4a    	addc\.w    w5, w6, w7
  22:	06 ac b8    	mul\.us    w5, w6, w8
