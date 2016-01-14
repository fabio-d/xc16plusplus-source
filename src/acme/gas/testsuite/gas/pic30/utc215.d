#objdump: -s -j .text
#name: .byte in .text

# Test to ensure that the .byte directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 313500         ut.c2.15.   
