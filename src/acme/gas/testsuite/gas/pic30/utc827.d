#objdump: -r
#name: BFD_RELOC_PIC30_FRAME_SIZE, Local Relocation

# Test to ensure that the assembler create a relocation for a LNK
# instruction that references a variable that is declared locally.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000000 FRAME SIZE        \.data


