#objdump: -h
#name: .section - Creating a New Section

# Test to ensure that the .section directive creates a new section.

.*: .*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, CODE
  1 .data         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  .*  2\*\*1
                  ALLOC
  3 foo           00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, DATA
