#objdump: -s -j .text
#name: .hword in .text

# Test to ensure that the .hword directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 757400 633200 323700         ut.c2.27.   
