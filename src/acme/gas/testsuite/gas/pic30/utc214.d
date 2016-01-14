#as: -W
#objdump: -s -j foo
#name: .byte in .section foo, "x"

# Test to ensure that the .byte directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 757400 633200 313400         ut.c2.14.   
