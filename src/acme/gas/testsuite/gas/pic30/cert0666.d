#as: --no-warn
#name: .section .pbss (default flags)
#objdump: -h
#source: cert0666.s

dump\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000120  00000000  00000000  00000198  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  1 \.data         0000010e  00000000  00000000  000003d8  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 foo_r         0000010e  00000000  00000000  000005f4  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, PSV
  4 foo_x         00000110  00000000  00000000  00000810  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  5 foo_n         0000010e  00000000  00000000  00000a30  2\*\*1
                  CONTENTS, ALLOC, RELOC, DATA, NEVER_LOAD
  6 foo_nd        0000010e  00000000  00000000  00000c4c  2\*\*1
                  CONTENTS, ALLOC, RELOC, DATA, NEVER_LOAD
  7 \.const        00000014  00000000  00000000  00000e68  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, PSV
  8 \.pbss         00000014  00000000  00000000  00000000  2\*\*1
                  ALLOC, RELOC, PERSIST
