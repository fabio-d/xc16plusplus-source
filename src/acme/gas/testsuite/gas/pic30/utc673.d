#objdump: -r
#name: BFD_RELOC_PIC30_LOOP_COUNT, Minimum Relocation

# Test to ensure that the assembler generates a relocation for
# an instruction that takes a loop-count operand.  The value
# of loop count is the minimum allowed for this relocation.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:

OFFSET   TYPE              VALUE 
00000000 UNSIGNED 14       \.data
00000002 PC RELATIVE DO    here

