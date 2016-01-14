#objdump: -s -j .text
#name: .long in .text

# Test to ensure that the .long directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 333300 000000  ut.c2.33....
