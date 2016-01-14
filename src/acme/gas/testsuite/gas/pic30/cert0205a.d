#as:
#objdump: -h
#name: All Section Types


dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000002  00000000  00000000  00000198  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.data         00000002  00000000  00000000  0000019c  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.bss          00000002  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 test          00000002  00000000  00000000  000001a0  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  4 test1         00000002  00000000  00000000  00000000  2\*\*1
                  ALLOC
  5 test2         00000002  00000000  00000000  000001a4  2\*\*1
                  CONTENTS, ALLOC, DATA, NEVER_LOAD
  6 test3         00000002  00000000  00000000  000001a8  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  7 test4         00000002  00000000  00000000  000001ac  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  8 \.comment      00000000  00000000  00000000  00000000  2\*\*1
                  
