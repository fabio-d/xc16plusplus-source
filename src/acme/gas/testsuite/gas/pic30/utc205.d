#as: -W
#objdump: -s -j foo
#name: .asciz in .section foo, "x"

# Test to ensure that the .asciz directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 303500 000000  ut.c2.05....
