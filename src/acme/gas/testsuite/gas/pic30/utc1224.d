#as:
#objdump:  -h
#name: boot(n) range 17..31

.*:.*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  .*
                  ALLOC, LOAD, CODE
  1 .data         00000000  00000000  00000000  .*  .*
                  ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  .*  .*
                  ALLOC
  . test17        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test18        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test19        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test20        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test21        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test22        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test23        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test24        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test25        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test26        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test27        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test28        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test29        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test30        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test31        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
