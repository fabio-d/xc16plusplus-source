#objdump: -r
#name: .word handle(local .text) in .data

# Test .word handle(foo) in the .data section where foo is a local symbol in
# the .text section.

.*: .*

RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000000 HANDLE [(]pointer to function[)]  foo


