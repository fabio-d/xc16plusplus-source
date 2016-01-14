#objdump: -s -j .text
#name: .float in .text

# Test to ensure that the .float directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 c3f500 484000                ...H@.      
