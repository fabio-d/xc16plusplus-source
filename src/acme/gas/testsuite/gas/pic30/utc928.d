#as: 
#objdump: -s -j .text
#name: .pfill in .text with only repeat specified

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .text section,


.*: .*

Contents of section .text:
 0000 000000 00ffff                ......      
