#as: -W
#objdump: -s -j foo
#name: .palign in an "x" section after .byte

# Test to ensure that the .palign directive is handled correctly in an "x"
# section after a .byte directive.

.*: .*

Contents of section foo:
 0000 41ffff                       A..         
