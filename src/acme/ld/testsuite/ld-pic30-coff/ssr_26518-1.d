#ld: 
#objects: /ld-pic30-coff/ssr_26518-1.out
#objdump: -h
#name: SSR 26518 -- Named PSV section

.+ssr_26518-1.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.reset        00000004  00000000  00000000  00000170  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.ivt          0000007c  00000004  00000004  00000178  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  2 \.aivt         0000007c  00000084  00000084  00000270  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  3 \.const        00000014  00008100  00000100  00000368  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, PSV
  4 scnpsv        00000010  00008114  00000114  00000390  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, PSV
  5 \.text         00000002  00000124  00000124  000003b0  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  6 \.dinit        00000002  00000126  00000126  000003b4  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  7 \.isr          00000002  00000128  00000128  000003b8  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
