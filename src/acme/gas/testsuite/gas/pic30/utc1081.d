#as: -W
#objdump: -s -j foo
#name: .pskip in .section foo, "x" - Fill Specified

.*: .*

Contents of section foo:
 0000 555555 555555 555555 55ffff  UUUUUUUUUU..
