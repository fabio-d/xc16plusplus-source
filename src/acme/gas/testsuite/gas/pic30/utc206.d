#objdump: -s -j .text
#name: .asciz in .text

# Test to ensure that the .asciz directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 303600 000000  ut.c2.06....
