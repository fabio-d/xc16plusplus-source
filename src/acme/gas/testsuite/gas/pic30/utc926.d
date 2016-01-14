#as: -W
#objdump: -s -j foo
#name: .pfill in foo section with repeat

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .section foo,
# "x" section

.*: .*

Contents of section foo:
 0000 000000 00ffff                ......      
