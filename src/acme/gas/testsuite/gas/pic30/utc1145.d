#as: -W
#objdump: -r
#name: Non-aligned relocations in DATA section

.*: .*

RELOCATION RECORDS FOR \[dat\]:
OFFSET   TYPE              VALUE 
00000000 .byte             f1
00000001 .byte             f2
00000002 .byte             f3
00000003 .byte             f4
