#ld:
#objects: /ld-pic30-coff/ssr_21573.out
#objdump: -h
#name: SSR 21573


.*ssr_21573.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.reset        00000004  00000000  00000000  00000148  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.comment      00000006  00000000  00000000  00000150  2\*\*1
                  CONTENTS, NEVER_LOAD
  2 \.ivt          0000007c  00000004  00000004  0000015c  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  3 \.aivt         0000007c  00000084  00000084  00000254  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  4 \.text         00000002  00000100  00000100  0000034c  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  5 \.dinit        00000002  00000102  00000102  00000350  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  6 \.isr          00000002  00000104  00000104  00000354  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
