#as:
#objdump:  -h
#name: .section secure,eedata

.*:.*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  .*
                  ALLOC, LOAD, CODE
  1 .data         00000000  00000000  00000000  .*  .*
                  ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  .*  .*
                  ALLOC
  3 test          00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, EEDATA, SECURE
