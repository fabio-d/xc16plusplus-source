#objdump: -r
#name: BFD_RELOC_PIC30_BRANCH_ABSOLUTE - Maximum Relocation

# Test to ensure that a relocation is created when the addend value of an
# absolute branch instruction is the maximum value.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 PC RELATIVE BRANCH  L0.*


