#as: -W
#objdump: -s -j foo
#name: .fill in foo with Size Specified

# Test to ensure that the .fill directive given a size parameter fills
# repeat * size user-addressable PC bytes in a .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 000000 000000 000000 000000  ............
