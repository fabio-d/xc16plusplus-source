#as:
#objdump: -h
#name: Assemble code into Section using .section directive, subsegment


dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000016  00000000  00000000  00000148  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  1 \.data         00000004  00000000  00000000  00000174  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 data1         00000004  00000000  00000000  0000017c  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  4 bsstest       00000004  00000000  00000000  00000000  2\*\*1
                  ALLOC
  5 testn         0000000a  00000000  00000000  00000184  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  6 testx         0000001a  00000000  00000000  00000198  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
