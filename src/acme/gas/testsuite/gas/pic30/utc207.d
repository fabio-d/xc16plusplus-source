#objdump: -h
#name: .bss Directive

# Test to ensure that a .bss directive will assemble the statements that follow
# it in the .bss section.

.*: .*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, CODE
  1 .data         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, DATA
  2 .bss          00000002  00000000  00000000  .*  2\*\*1
                  ALLOC
