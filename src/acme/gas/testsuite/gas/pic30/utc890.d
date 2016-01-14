#objdump: -s -j .text
#name: .palign in .text after .byte

# Test to ensure that the .palign directive is handled correctly in the .text
# section after a .byte directive.

.*: .*

Contents of section .text:
 0000 41ffff                       A..         
