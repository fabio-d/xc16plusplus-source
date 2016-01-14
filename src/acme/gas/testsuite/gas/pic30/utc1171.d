#as: -I$srcdir/$subdir -W
#objdump: -s -j foo
#name: .incbin in "d" section

.*:.*

Contents of section foo:
 0000 30313233 34353637 38393a3b 3c3d3e3f  .*
