#objdump: -r
#name: BFD_RELOC_PIC30_PGM_ADDR_LSB

# This test ensures that the assembler creates the LSB for a CALL instruction
# relocation.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
0000000a PROGRAM ADDRESS LSB  \_foo
.*

