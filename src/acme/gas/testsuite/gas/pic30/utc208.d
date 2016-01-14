#objdump: -h
#name: .data Directive

# Test to ensure that a .data directive will assemble the statements that follow
# it in the .data section.

.*: .*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, CODE
  1 .data         00000002  00000000  00000000  .*  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  .*  2\*\*1
                  ALLOC
