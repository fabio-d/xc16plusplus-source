#objdump: -r
#name: BFD_RELOC_PIC30_DSP_6 - Local Relocation

# Test to ensure that a DSP SIGNED 6 relocation is generated for a DSP
# instruction that takes a 6-bit operand which references a local variable.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 DSP SIGNED 6      \.text


