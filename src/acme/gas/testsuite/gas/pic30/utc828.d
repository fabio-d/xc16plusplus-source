#objdump: -r
#name: BFD_RELOC_PIC30_FRAME_SIZE, Minimum Relocation

# Test to ensure that the assembler creates a relocation for a LNK
# instruction given the minimum value for this relocation.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:

OFFSET   TYPE              VALUE 
00000000 FRAME SIZE        \.data


