#objdump: -r
#name: data reference to a code section (BFD_RELOC_32)

# This test will ensure that a .long directive can reference
# an executable symbol defined in a code section 
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 .long             there


