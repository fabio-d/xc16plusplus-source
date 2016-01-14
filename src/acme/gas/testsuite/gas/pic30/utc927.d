#as: 
#objdump: -s -j .text
#name: .pfill in .text with .pfillvalue

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .section .const,
# "x" section

.*: .*

Contents of section .text:
 0000 121212 120000                ......      
