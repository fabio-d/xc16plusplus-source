#ld: -M=ssr_19501.map
#objects: /ld-pic30-coff/ssr_19051a.out /ld-pic30-coff/ssr_19051b.out
#objdump: -h -j".const"
#name: SSR 19051 -- VMA of section .const is not accurate in COFF header


.+ssr_19051\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.reset        00000004  00000000  00000000  00000210  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.ivt          0000007c  00000004  00000004  00000218  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  2 \.aivt         0000007c  00000084  00000084  00000310  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  3 \.data         0000007c  00000800  00000800  00000408  2\*\*1
                  CONTENTS, ALLOC, DATA, NEVER_LOAD
  4 foo           00000128  00008100  00000100  00000500  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, PSV
  5 bar           00000008  00008228  00000228  00000750  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, PSV
  6 \.const        00000008  00008230  00000230  00000760  2\*\*1
                  CONTENTS, ALLOC, LOAD, READONLY, PSV
  7 \.text         00001494  00000238  00000238  00000770  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  8 \.dinit        00000062  000016cc  000016cc  00003098  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
  9 \.text         00000002  0000172e  0000172e  0000315c  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
 10 \.isr          00000002  00001730  00001730  00003160  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
 11 myscn         00000120  0000f000  007ff000  00003164  2\*\*1
                  CONTENTS, ALLOC, LOAD, EEDATA
