#objdump: -s -j .text
#name: .space in .text Section with no Fill Specified

# Test to ensure that the .space directive is handled correctly in an
# .text section.

.*: .*

Contents of section .text:
 0000 ffff00 ffff00 ffff00 ffff00  ............
 0008 ffff00 ffff00 ffff00 ffff00  ............
