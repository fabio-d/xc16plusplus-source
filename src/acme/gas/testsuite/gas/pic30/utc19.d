#objdump: -s -j .text
#name: .fillupper Fills Upper Byte with Specified Value

# Test to ensure that the .fillupper directive fills the upper byte with
# the specified value.

.*: .*

Contents of section .text:
 0000 3412ff                       4..         
