#as: --no-warn
#objdump: -r
#name: BFD_RELOC_PIC30_PCREL_DO - External Relocation

# This test ensures that the assembler creates a relocation for
# a PC Relative Do that references a label that is declared
# externally to the assembly source file.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
0000000a UNSIGNED 14       \.data
0000000c PC RELATIVE DO    extsym


