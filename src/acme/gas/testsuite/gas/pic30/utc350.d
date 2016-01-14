#objdump: -s -j .text
#name: .org in .text - .fillupper/.fillvalue Specified

# Test to ensure that the .org directive works properly in the .text section.

.*: .*

Contents of section .text:
 0000 121234 121234 121234 551234  ..4..4..4U.4