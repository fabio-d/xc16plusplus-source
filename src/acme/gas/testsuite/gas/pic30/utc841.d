#objdump: -r
#name: BFD_RELOC_PIC30_BRANCH_ABSOLUTE - Absolute Relocation

# Test to ensure that a relocation is created for an absolute branch instruction

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 BRANCH ABSOLUTE   L0.*


