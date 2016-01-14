#objdump: -s -j .text
#name: .single in .text

# Test to ensure that the .single directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 c3f500 484000                ...H@.      
