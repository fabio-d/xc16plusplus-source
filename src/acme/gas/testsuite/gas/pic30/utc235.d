#as: -W
#objdump: -s -j foo
#name: .word in .section foo, "x"

# Test to ensure that the .word directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 333500         ut.c2.35.   
