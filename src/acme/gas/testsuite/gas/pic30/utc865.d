#objdump: -r
#name: psvpage(local .text) in .text

# Test to ensure that taking the psvpage() of an local .text symbol in an
# allocation directive in the .text section creates a BFD_RELOC_PIC30_PSVPAGE
# relocation.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000002 PSVPAGE           main


