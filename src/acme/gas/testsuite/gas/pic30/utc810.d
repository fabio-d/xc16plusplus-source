#objdump: -r
#name:  BFD_RELOC_PIC30_PCREL_DO - Local Relocation

# This test will ensure that a relocation is created for a DO 
# instruction that branches to a variable that is declared 
# locally in the assembly source file.
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
0000000a UNSIGNED 14       \.data
0000000c PC RELATIVE DO    here


