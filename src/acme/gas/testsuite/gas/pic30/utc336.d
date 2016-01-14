#objdump: -s -j .data
#name: .fill in .data with Size Specified

# Test to ensure that the .fill directive given a size parameter fills
# repeat * size bytes in the .data section.

.*: .*

Contents of section .data:
 0000 00000000 00000000                    ........        
