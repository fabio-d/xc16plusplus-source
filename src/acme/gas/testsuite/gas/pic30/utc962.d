#objdump: -r
#name: tblpage(extern) in .text

# This test ensures that the assembler creates a relocation when
# taking the the TBLPAGE() of an external symbol in a .pword
# allocation directive in the .text section.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 P-TBLPAGE         extsym


