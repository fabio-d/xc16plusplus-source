#as: 
#name: .pbss section
#objdump: -h
#source: cert0530.s

dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         000004a0  00000000  00000000  00000120  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  1 \.data         00000042  00000000  00000000  00000a60  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.bss          00000002  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 __FWDT        00000002  00000000  00000000  00000ae4  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  4 \.pbss         00000106  00000000  00000000  00000000  2\*\*1
                  ALLOC, PERSIST
  5 mypbss        00000002  00000000  00000000  00000000  2\*\*1
                  ALLOC, PERSIST
