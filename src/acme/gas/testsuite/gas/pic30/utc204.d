#objdump: -s -j .data
#name: .asciz in .data

# Test to ensure that the .asciz directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 75746332 30340000                    utc204..        
