#objdump: -r
#name: .pbyte Minimum Relocation

# This test ensures that the assembler creates a relocation for
# the .pbyte data allocation directive for a variable that is
# declared locally with an addend of -128

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 \.pbyte            test


