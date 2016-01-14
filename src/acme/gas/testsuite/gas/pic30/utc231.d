#objdump: -s -j .data
#name: .long in .data

# Test to ensure that the .long directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 75746332 33310000                    utc231..        
