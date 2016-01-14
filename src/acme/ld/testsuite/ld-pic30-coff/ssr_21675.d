#ld: 
#objects: /ld-pic30-coff/ssr_21675.out
#objdump: -h
#name: SSR 21675 -- .comm directive broken


.+ssr_21675.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.reset        00000004  00000000  00000000  00000120  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.ivt          0000007c  00000004  00000004  00000128  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  2 \.aivt         0000007c  00000084  00000084  00000220  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  3 \.bss          00000010  00000800  00000800  00000000  2\*\*1
                  ALLOC
  4 \.dinit        00000002  00000100  00000100  00000318  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  5 \.isr          00000002  00000102  00000102  0000031c  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
