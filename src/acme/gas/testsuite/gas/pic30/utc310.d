#as: -W
#objdump: -s -j foo
#name: .align in .section foo, "x" Section

# Test to ensure that the .align directive is handled correctly in an
# "x" section.

.*: .*

Contents of section foo:
 0000 110000 341200                ...4..      
