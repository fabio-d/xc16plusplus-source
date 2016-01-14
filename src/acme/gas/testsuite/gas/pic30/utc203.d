#as: -W
#objdump: -s -j foo
#name: .ascii in .section foo, "x"

# Test to ensure that the .ascii directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 303300         ut.c2.03.   
