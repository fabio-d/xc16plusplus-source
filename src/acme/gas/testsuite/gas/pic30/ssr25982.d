#as: --listing-cont-lines=10
#name: ssr 25982: .section does not always default to data
#objdump: -h
#source: ssr25982.s


dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000002  00000000  00000000  000000f8  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.data         00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 foo           00000010  00000900  00000900  000000fc  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA, ABSOLUTE
  4 bar           00000010  00000000  00000000  0000011c  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
