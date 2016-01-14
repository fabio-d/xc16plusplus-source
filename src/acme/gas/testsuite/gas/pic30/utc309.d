#objdump: -s -j .text
#name: .align in .text Section

# Test to ensure that the .align directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 110000 341200                ...4..      
