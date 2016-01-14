#objdump: -r
#name: BFD_RELOC_PIC30_PSVOFFSET, psvoffset(local .text) in .text

# This test ensures that the assembler creates a relocation when
# taking the psvoffset of a local .text symbol in an allocation directive
# in the .text section.
# 

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000008 PSVOFFSET         test



