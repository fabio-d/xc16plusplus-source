#objdump: -r
#name: tbloffset(local .text) in .text

# This test ensures that the assembler creates a relocation when
# taking the the tbloffset of a local .text symbol in a .pword
# allocation directive in the .text section.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 P-TBLOFFSET       test


