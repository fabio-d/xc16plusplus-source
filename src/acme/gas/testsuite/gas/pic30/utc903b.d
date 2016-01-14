#as: --no-warn
#objdump: -s -j .text
#name: .pbyte Maximum + 1

# Test to ensure that the .pbyte directive is handled correctly
# in the .text section.  We give .pbyte a value of (0xFF + 1)
# and check that the assembler truncated the value to 0x0.

.*: .*

Contents of section .text:
 0000 000000                       ...         
