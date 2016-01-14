#objdump: -r
#name: data reference to .text section (BFD_RELOC_32)

# This test will ensure that a .long directive can reference
# an executable symbol defined in the .text section 
.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000002 .long             here


