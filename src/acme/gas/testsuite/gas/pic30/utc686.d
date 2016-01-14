#objdump: -r
#name: BFD_RELOC_PIC30_PCREL_BRANCH - Local Relocation

# This test ensures that the assembler creates a relocation for
# a PC Relative Branch that branches to a variable that is
# declared locally to the assembly source file.
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000006 PC RELATIVE BRANCH  loctext


