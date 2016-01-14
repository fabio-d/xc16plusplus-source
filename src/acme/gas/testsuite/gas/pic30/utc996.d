#objdump: -r
#name: BFD_RELOC_PIC30_PWRSAV_MODE - Local Relocation

# This test will ensure that a relocation is created for a 
# PWRSAV instruction that is declared locally in the assembly 
# source file.
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 POWER SAVE MODE   .data


