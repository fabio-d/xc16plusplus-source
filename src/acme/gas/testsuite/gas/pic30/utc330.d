#objdump: -s -j .text
#name: .space in .text Section with Fill Specified

# Test to ensure that the .space directive is handled correctly in an
# .text section.

.*: .*

Contents of section .text:
 0000 555500 555500 555500 555500  UU.UU.UU.UU.
 0008 555500 555500 555500 555500  UU.UU.UU.UU.
