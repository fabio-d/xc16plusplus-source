#objdump: -r
#name: BFD_RELOC_PIC30_BIT_SELECT_4 - External Relocation

# Test to ensure that a BIT SELECT 4 relocation is generated for an
# instruction that takes a 4-bit bit selection operand which references an
# external variable.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 BIT SELECT 4      b4


