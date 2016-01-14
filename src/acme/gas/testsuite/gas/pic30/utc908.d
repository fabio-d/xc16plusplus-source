#as: -W
#objdump: -s -j foo
#name: .pbyte in an "x" section after

# Test to ensure that the .pbyte directive is handled correctly
# in "x" section.

.*: .*

Contents of section foo:
 0000 120000                       ...         
