#as:
#name: unlinked absolute PSV sections show incorrect VMA
#objdump: -h
#source: ssr27154-1.s


dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC, LOAD, CODE
  1 \.data         00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 f             00000002  0000a000  00002000  000000d0  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, PSV, ABSOLUTE
