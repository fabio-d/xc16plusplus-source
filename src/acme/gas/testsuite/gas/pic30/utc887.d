#objdump: -r
#name: BFD_RELOC_PIC30_PGM_ADDR_MSB

# This test ensures that the assembler creates the MSB for a CALL instruction
# relocation.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
.*
0000000c PROGRAM ADDRESS MSB  \_foo[\t|\n| ]*

