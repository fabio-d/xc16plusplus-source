#objdump: -s -j .text
#name: .pbyte in .text section

# Test to ensure that the .pbyte directive is handled correctly
# in the .text section.

.*: .*

Contents of section .text:
 0000 120000                       ...         
