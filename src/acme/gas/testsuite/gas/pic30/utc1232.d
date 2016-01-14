#as:
#objdump:  -h
#name: secure(n) range 17..31

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
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test18        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test19        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test20        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test21        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test22        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
  . test23        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test24        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test25        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test26        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test27        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test28        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test29        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test30        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
 .. test31        00000002  00000000  00000000  .*  .*
                  CONTENTS, ALLOC, LOAD, CODE, SECURE
