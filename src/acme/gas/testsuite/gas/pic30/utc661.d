#objdump: -r
#name: BFD_RELOC_PIC30_DSP_PRESHIFT - Minimum Relocation

# Test to ensure that a DSP PRESHIFT relocation is generated for a DSP
# instruction that takes a 4-bit preshift operand which references a
# variable with a value of 0.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 DSP PRESHIFT      \.data


