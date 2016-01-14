#as: 
#objdump: -s -j .text
#name: .pfill in .text with Size and Value Specified

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .text section,


.*: .*

Contents of section .text:
 0000 123412 341234 123400         .4.4.4.4.   
