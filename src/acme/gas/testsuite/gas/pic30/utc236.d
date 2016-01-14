#objdump: -s -j .text
#name: .word in .text

# Test to ensure that the .word directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 333600         ut.c2.36.   
