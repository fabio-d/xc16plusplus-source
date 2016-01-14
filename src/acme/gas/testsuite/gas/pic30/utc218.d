#objdump: -s -j .text
#name: .double in .text

# Test to ensure that the .double directive is handled correctly in the
# .text section.

.*: .*

Contents of section .text:
 0000 1f8500 eb5100 b81e00 094000  ....Q.....@.
