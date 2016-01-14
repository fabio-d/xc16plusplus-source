#objdump: -r
#name: .pword - External Relocation

# This test ensures that the assembler creates a relocation for a .pword
# data allocation directive that references an external variable.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE.*
[0-9]+ \.pword            foo



