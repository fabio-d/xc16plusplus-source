#objdump: -s -j .data
#name: .double in .data

# Test to ensure that the .double directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 1f85eb51 b81e0940                    ...Q...@        
