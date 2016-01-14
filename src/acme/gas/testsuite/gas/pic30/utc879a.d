#objdump: -r
#name: .pbyte Local .data Relocation

# This test ensures that the assembler creates a relocation for
# the .pbyte data allocation directive for a variable that is
# declared locally in the .data section

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 \.pbyte            datasym


