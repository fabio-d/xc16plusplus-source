#as: -W
#objdump: -s -j foo
#name: .float in .section foo, "x"

# Test to ensure that the .float directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 c3f500 484000                ...H@.      
