#objdump: -s -j .text
#name: .fill in .text with Size and Value Specified

# Test to ensure that the .fill directive given a size and value parameter fills
# repeat * size bytes in the .text section with the value specified.

.*: .*

Contents of section .text:
 0000 123400 123400 123400 123400  .4..4..4..4.
