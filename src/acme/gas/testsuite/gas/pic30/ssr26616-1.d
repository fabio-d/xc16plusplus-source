#as: --listing-cont-lines=10 -W
#name: ssr 26616
#objdump: -h
#source: ssr26616-1.s


dump.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000002  00000000  00000000  00000120  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.data         00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 foo           00000004  00000000  00000000  00000124  2\*\*2
                  CONTENTS, ALLOC, READONLY, NEVER_LOAD, PSV, REVERSE
  4 bar           00000002  00000000  00000000  0000012c  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  5 test          00000002  00000000  00000000  00000130  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA, NEAR
