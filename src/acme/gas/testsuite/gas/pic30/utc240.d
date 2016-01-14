#as: -W
#objdump: -s
#name: Long section names

# Test to ensure that long section names are supported

.*: .*

Contents of section .LongTextSection:
 0000 000000 000000                ......      
Contents of section .LongDataSection:
 0000 01000100                             ....            

