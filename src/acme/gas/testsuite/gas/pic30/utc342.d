#as: -W
#objdump: -s -j foo
#name: .fill in .section foo, "x" with Size and Value Specified

# Test to ensure that the .fill directive given a size and value parameter fills
# repeat * size bytes in a .section foo, "x" section with the value
# specified.

.*: .*

Contents of section foo:
 0000 123400 123400 123400 123400  .4..4..4..4.
