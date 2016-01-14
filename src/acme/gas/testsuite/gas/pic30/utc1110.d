#objdump: -r
#name: BFD_RELOC_PIC30_PGM_ADDR_MSB - Absolute Address

# Test to ensure that relocations are created for a GOTO that takes an absolute
# address as the operand.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 PROGRAM ADDRESS LSB  L0.*
00000002 PROGRAM ADDRESS MSB  L0.*


