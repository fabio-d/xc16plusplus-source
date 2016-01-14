#objdump: -s -j .text
#name: .fill in .text with Size Specified

# Test to ensure that the .fill directive given a size parameter fills
# repeat * size user-addressable PC bytes in the .text section.

.*: .*

Contents of section .text:
 0000 000000 000000 000000 000000  ............
