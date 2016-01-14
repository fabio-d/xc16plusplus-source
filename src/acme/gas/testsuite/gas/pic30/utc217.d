#as: -W
#objdump: -s -j foo
#name: .double in .section foo, "x"

# Test to ensure that the .double directive is handled correctly in the
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 1f8500 eb5100 b81e00 094000  ....Q.....@.
