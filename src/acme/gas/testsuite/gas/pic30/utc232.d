#as: -W
#objdump: -s -j foo
#name: .long in .section foo, "x"

# Test to ensure that the .long directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 333200 000000  ut.c2.32....
