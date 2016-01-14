#as: -W
#objdump: -s -j foo
#name: .fill in .section foo, "x"

# Test to ensure that the .fill directive works properly in a
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 000000 000000                ......      
