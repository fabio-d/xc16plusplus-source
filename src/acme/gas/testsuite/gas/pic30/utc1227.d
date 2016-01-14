#as:
#objdump:  -h
#name: secure(n) range 0..15

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
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test1         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test2         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test3         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test4         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test5         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test6         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test7         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test8         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test9         00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test10        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test11        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test12        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test13        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test14        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test15        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
