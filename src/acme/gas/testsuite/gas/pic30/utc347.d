#objdump: -s -j .data
#name: .org in .data - fill Not Specified

# Test to ensure that the .org directive works properly in the .data section.

.*: .*

Contents of section .data:
 0000 00000000 0012                        ......          
