#objdump: -s -j .data
#name: .int in .data

# Test to ensure that the .int directive is handled correctly in the
# .data section.

.*: .*

Contents of section .data:
 0000 75746332 32380000                    utc228..        
