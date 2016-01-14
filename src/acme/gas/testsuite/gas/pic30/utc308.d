#objdump: -s -j .data
#name: .align in .data Section

# Test to ensure that the .align directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 11003412                             ..4.            
