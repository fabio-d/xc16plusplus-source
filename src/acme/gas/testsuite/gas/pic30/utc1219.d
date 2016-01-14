#as:
#objdump:  -h
#name: boot(n) range 0..15

.*:.*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  .*
                  ALLOC, LOAD, CODE
  1 .data         00000000  00000000  00000000  .*  .*
                  ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  .*  .*
                  ALLOC
  3 test0         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test1         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test2         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test3         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test4         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test5         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
  . test6         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test7         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test8         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test9         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test10        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test11        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test12        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test13        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test14        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
 .. test15        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, BOOT
