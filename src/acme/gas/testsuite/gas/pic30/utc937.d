#objdump: -s -j .text
#name: .pbyte Writes to Upper Byte

# Test to ensure that the .pbyte directive writes to the upper byte.

.*: .*

Contents of section .text:
 0000 414243                       ABC         
