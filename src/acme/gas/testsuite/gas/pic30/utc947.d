#objdump: -r
#name: handle(local .text) in .text

# This test ensures that the assembler creates a relocation when
# taking the the handle() of a local symbol in a .pword allocation
# directive in the .text section.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 P-HANDLE          test


