#objdump: -r
#name: .pbyte Maximum .text Relocation

# This test ensures that the assembler creates a relocation for
# the .pbyte data allocation directive for a variable that is
# declared locally in the .text section plus an addend of 0xFF.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 \.pbyte            test


