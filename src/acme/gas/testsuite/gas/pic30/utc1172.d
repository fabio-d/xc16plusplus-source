#as: -I$srcdir/$subdir -W
#objdump: -s -j foo
#name: .incbin in "r" section

.*:.*

Contents of section foo:
 0000 40414243 44454647 48494a4b 4c4d4e4f  @ABCDEFGHIJKLMNO
