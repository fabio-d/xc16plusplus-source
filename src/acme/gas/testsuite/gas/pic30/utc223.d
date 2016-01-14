#as: -W
#objdump: -s -j foo
#name: .single in .section foo, "x"

# Test to ensure that the .single directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 c3f500 484000                ...H@.      
