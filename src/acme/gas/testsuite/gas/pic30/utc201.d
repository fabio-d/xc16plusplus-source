#objdump: -s -j .text
#name: .ascii in .text

# Test to ensure that the .ascii directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 303100         ut.c2.01.   
