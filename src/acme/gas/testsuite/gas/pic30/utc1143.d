#objdump: -r
#name: Non-aligned relocations in .text section

.*: .*

RELOCATION RECORDS FOR \[.text\]:
OFFSET   TYPE              VALUE 
00000000 .pbyte            f1
00000000 .pbyte            f2
00000000 .pbyte            f3
00000002 .pbyte            f4
