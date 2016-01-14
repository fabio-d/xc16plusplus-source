#as: 
#objdump: -s -j .text
#name: .pfill in .text with Size Specified

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .text section,


.*: .*

Contents of section .text:
 0000 000000 000000 0000ff         .........   
