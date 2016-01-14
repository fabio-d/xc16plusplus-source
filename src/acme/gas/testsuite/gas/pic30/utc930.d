#as: 
#objdump: -s -j .text
#name: .pfill in .text with Maximum Size

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .text section,


.*: .*

Contents of section .text:
 0000 a50000 000000 0000a5 000000  ............
 0008 000000 00a500 000000 000000  ............
 0010 a50000 000000 0000a5         .........   
