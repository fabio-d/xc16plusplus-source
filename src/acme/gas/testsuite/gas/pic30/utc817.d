#as: --no-warn
#objdump: -r
#name: BFD_RELOC_PIC30_DO_ABSOLUTE - Minimum Relocation

# Test to ensure that the assembler creates a relocation for the minimum
# value allowed for this relocation.

.*: .*

RELOCATION RECORDS FOR \[.text\]:
OFFSET   TYPE              VALUE 
00000002 PC RELATIVE DO    L0.*

