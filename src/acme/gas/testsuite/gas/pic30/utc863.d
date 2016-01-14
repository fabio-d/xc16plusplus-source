#objdump: -r
#name: psvpage(local .text) in .data

# Test to ensure that taking the psvpage() of an local .text symbol in an
# allocation directive in the .data section creates a BFD_RELOC_PIC30_PSVPAGE
# relocation.

.*: .*

RELOCATION RECORDS FOR \[\.data\]\:
OFFSET   TYPE              VALUE 
00000004 PSVPAGE           main


