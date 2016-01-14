#objdump: -r
#name: BFD_RELOC_PIC30_TBLOFFSET, tbloffset(extern) in .data

# This test ensures that the assembler creates a relocation when
# taking the tbloffset of an external symbol in an allocation directive
# in the .data section.
# 

.*: .*

RELOCATION RECORDS FOR \[\.data\]\:
OFFSET   TYPE              VALUE 
00000000 TBLOFFSET         externfoo


