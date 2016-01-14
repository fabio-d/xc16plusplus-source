#objdump: -r
#name: .word handle(extern .text symbol) in .data

# Test .word handle(foo) in the .data section where foo is an external symbol.

.*: .*

RELOCATION RECORDS FOR \[\.data\]:
OFFSET   TYPE              VALUE 
00000000 HANDLE [(]pointer to function[)]  foo


