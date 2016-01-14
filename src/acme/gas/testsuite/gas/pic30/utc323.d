#as: -W
#objdump: -s -j foo
#name: .space in .section foo, "x" Section with Fill Specified

# Test to ensure that the .space directive is handled correctly in an
# "x" section.

.*: .*

Contents of section foo:
 0000 555500 555500 555500 555500  UU.UU.UU.UU.
 0008 555500 555500 555500 555500  UU.UU.UU.UU.
