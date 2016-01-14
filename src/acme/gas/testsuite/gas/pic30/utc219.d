#objdump: -s -j .data
#name: .float in .data

# Test to ensure that the .float directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 c3f54840                             ..H@            
