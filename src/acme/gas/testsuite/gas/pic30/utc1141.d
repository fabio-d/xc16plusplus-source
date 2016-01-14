#objdump: -r
#name: data reference to a code section (BFD_RELOC_16)

# This test will ensure that a .word directive can reference
# an executable symbol defined in a code section 
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 .word             there


