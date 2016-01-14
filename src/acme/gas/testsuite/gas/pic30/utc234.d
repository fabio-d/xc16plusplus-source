#objdump: -s -j .data
#name: .word in .data

# Test to ensure that the .word directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 75746332 3334                        utc234          
