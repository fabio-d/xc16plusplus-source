#as: -W
#objdump: -s -j foo
#name: .pfill in foo section with .pfillvalue
# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .section foo,
# "x" section

.*: .*

Contents of section foo:
 0000 121212 120000                ......      
