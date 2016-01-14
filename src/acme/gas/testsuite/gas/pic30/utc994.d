#objdump: -r
#name: BFD_RELOC_PIC30_PWRSAV_MODE - Minimum Relocation

# This test will ensure that a relocation is created for 
# the minimum value allowed for this relocation (0).
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 POWER SAVE MODE   .data


