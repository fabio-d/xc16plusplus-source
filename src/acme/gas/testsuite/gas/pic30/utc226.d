#as: -W
#objdump: -s -j foo
#name: .hword in .section foo, "x"

# Test to ensure that the .hword directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 323600         ut.c2.26.   
