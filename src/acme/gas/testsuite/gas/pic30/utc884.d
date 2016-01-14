#objdump: -r
#name: .pword - Local Relocation

# This test ensures that the assembler creates a
# relocation for a .pword directive.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE.*
[0-9]+ \.pword            locsym1


