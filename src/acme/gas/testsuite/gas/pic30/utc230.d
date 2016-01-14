#objdump: -s -j .text
#name: .int in .text

# Test to ensure that the .int directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 333000 000000  ut.c2.30....
