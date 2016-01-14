#as: -W
#objdump: -s -j foo
#name: .align - Minimum Alignment in .section foo, "x"

.*: .*

Contents of section foo:
 0000 ff0000                       ...         
