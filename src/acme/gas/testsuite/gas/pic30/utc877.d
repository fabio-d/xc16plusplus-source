#objdump: -r
#name: .pbyte External Relocation

# This test ensures that the assembler creates a relocation for
# the .pbyte data allocation directive for a variable that is
# declared externally to the assembly source file.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000004 \.pbyte            extsym


