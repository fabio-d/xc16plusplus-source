#objdump: -r
#name:  BFD_RELOC_PIC30_PWRSAV_MODE - Maximum Relocation

# This test will ensure that a relocation is created for 
# the maximum value allowed for this relocation (1).
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 POWER SAVE MODE   .data


