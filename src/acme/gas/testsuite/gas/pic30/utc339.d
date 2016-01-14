#objdump: -s -j .data
#name: .fill in .data with Size and Value Specified

# Test to ensure that the .fill directive given a size and value parameter fills
# repeat * size bytes in the .data section with the value specified.

.*: .*

Contents of section .data:
 0000 12341234 12341234                    .4.4.4.4        
