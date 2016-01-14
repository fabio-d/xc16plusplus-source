#as: -W
#objdump: -s -j foo
#name: .int in .section foo, "x"

# Test to ensure that the .int directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 323900 000000  ut.c2.29....
