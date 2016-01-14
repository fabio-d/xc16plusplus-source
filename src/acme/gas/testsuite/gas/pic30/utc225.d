#objdump: -s -j .data
#name: .hword in .data

# Test to ensure that the .hword directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 75746332 3235                        utc225          
