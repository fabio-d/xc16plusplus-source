#objdump: -s -j .data
#name: .ascii in .data

# Test to ensure that the .ascii directive is handled correctly in the .data
# section.

.*: .*

Contents of section .data:
 0000 75746332 3032                        utc202          
