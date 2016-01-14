#as: -W
#objdump: -s -j foo
#name: .skip in .section foo, "x" Section with no Fill Specified

# Test to ensure that the .skip directive is handled correctly in an
# "x" section.

.*: .*

Contents of section foo:
 0000 ffff00 ffff00 ffff00 ffff00  ............
 0008 ffff00 ffff00 ffff00 ffff00  ............
