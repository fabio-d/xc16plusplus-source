#objdump: -s -j .data
#name: .byte in .data

# Test to ensure that the .byte directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 75746332 3133                        utc213          
