#objdump: -s -j .data
#name: .space in .data Section with no Fill Specified

# Test to ensure that the .space directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 00000000 00000000 00000000 00000000  ................
