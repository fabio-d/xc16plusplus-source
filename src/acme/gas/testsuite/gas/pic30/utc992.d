#objdump: -r
#name:  BFD_RELOC_PIC30_PWRSAV_MODE - General Functionality

# This test will ensure that a relocation is created for a 
# PWRSAV instruction for a variable that is declared externally 
# to the assembly source file. 
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 POWER SAVE MODE   foo


