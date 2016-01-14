#objdump: -r
#name: BFD_RELOC_PIC30_BIT_SELECT_4 - Maximum Relocation

# Test to ensure that a BIT SELECT 4 relocation is generated for an
# instruction that takes a 4-bit bit selection operand which references an
# local variable with a value of 15.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 BIT SELECT 4      \.data


