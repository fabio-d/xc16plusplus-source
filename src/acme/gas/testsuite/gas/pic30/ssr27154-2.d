#as:
#name: VMA address in unlinked absolute EEDATA section
#objdump: -h
#source: ssr27154-2.s



dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC, LOAD, CODE
  1 \.data         00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 f             00000004  00002000  00002000  000000f8  2\*\*1
                  CONTENTS, ALLOC, LOAD, EEDATA, ABSOLUTE
  4 d             00000002  00000900  00000900  00000100  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA, ABSOLUTE
