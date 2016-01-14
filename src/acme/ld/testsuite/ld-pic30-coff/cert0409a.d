#ld: 
#objects: /ld-pic30-coff/cert0409a.out /ld-pic30-coff/cert0409b.out
#objdump: -d -j .text -r
#name: FRAME_SIZE Relocation

.+cert0409a\.o:     file format coff-pic30

Disassembly of section \.text:

00000126 \<__reset\>:
 126:	02 08 fa    	lnk       \#0x802
 128:	00 08 fa    	lnk       \#0x800
 12a:	04 08 fa    	lnk       \#0x804

0000012c \<\.text\>:
 12c:	00 08 fa    	lnk       \#0x800
 12e:	12 08 fa    	lnk       \#0x812
 130:	04 08 fa    	lnk       \#0x804
