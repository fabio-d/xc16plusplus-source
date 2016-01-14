#as: -W
#objdump: -h
#name: .section "w" flag

# Test to ensure that the "w" flag of the .section directive is handled
# correctly.

.*: .*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, CODE
  1 .data         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  .*  2\*\*1
                  ALLOC
  3 foo_w         00000000  00000000  00000000  .*  2\*\*1
                  ALLOC, LOAD, DATA
