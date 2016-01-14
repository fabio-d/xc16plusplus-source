#objdump: -r
#name: BFD_RELOC_PIC30_BRANCH_ABSOLUTE - Minimum Relocation

# Test to ensure that the minimum addend is accepted for an absolute branch.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 PC RELATIVE BRANCH  L0.*


