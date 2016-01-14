#as: -W
#objdump: -s -j foo
#name: .pfill in foo section with Size and Value specified

# Test to ensure that the .pfill directive fills in
# the correct number of bytes in a .section foo,
# "x" section

.*: .*

Contents of section foo:
 0000 123412 341234 123400         .4.4.4.4.   
