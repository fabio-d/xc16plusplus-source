#as: -W
#objdump: -s -j foo
#name: .skip in .section foo, "x" Section with Fill Specified

# Test to ensure that the .skip directive is handled correctly in an
# "x" section.

.*: .*

Contents of section foo:
 0000 555500 555500 555500 555500  UU.UU.UU.UU.
 0008 555500 555500 555500 555500  UU.UU.UU.UU.
