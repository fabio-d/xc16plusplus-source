#objdump: -r
#name: BFD_RELOC_PIC30_BIT_SELECT_4_BYTE - Maximum Relocation

# Test to ensure that a BIT SELECT 4 BYTE relocation is generated for a byte
# instruction that takes a 4-bit bit selection operand which references an
# local variable with a value of 7.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 BIT SELECT 4 [(]byte[)]  \.data


