#as: -W
#objdump: -s -j foo
#name: .pskip in .section foo, "x" - No Fill Specified

.*: .*

Contents of section foo:
 0000 ffffff ffffff ffffff ff0000  ............
