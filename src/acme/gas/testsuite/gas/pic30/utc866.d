#objdump: -r
#name: psvpage(extern .text) in .data

# Test to ensure that taking the psvpage() of an external symbol in an
# allocation directive in the .data section creates a BFD_RELOC_PIC30_PSVPAGE
# relocation.

.*: .*

RELOCATION RECORDS FOR \[\.data\]\:
OFFSET   TYPE              VALUE 
00000000 PSVPAGE           _foo


