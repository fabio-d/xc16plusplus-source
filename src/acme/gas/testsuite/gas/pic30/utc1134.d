#objdump: -r
#name: data reference to .text section (BFD_RELOC_8)

# This test will ensure that a .byte directive can reference
# an executable symbol defined in the .text section 
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000002 .byte             here


