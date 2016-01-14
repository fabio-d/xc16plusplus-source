#objdump: -s -j .data
#name: .org in .data - fill Specified

# Test to ensure that the .org directive works properly in a .data section.

.*: .*

Contents of section .data:
 0000 11111111 11111200                    ........        
