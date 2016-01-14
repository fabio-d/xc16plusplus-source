#objdump: -s -j .data
#name: .skip in .data Section with Fill Specified

# Test to ensure that the .skip directive is handled correctly in the
# .data section when a fill value has been specified.

.*: .*

Contents of section .data:
 0000 55555555 55555555 55555555 55555555  UUUUUUUUUUUUUUUU
