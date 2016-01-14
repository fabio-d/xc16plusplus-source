#objdump: -s -j .text
#name: .fill in .text with .fillupper/.fillvalue

# Test to ensure that the .fill directive works properly in the .text section.

.*: .*

Contents of section .text:
 0000 121234 121234                ..4..4      
