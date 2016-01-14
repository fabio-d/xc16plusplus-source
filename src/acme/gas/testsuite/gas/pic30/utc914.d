#as: 
#objdump: -s -j .text
#name: .pfillvalue User-addressable PC Locations Filled

# Test to ensure that the assembler uses the specified value for the .pfillvalue
# directive when filling memory, including the upper byte of memory.

.*: .*

Contents of section .text:
 0000 125555                       .UU         
