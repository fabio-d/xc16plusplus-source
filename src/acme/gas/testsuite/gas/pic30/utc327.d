#objdump: -s -j .data
#name: .space Directive's Minimum Fill Value Specified

# Test to ensure that the the minimum fill value for the .space directive is
# accepted.

.*: .*

Contents of section .data:
 0000 80808080 80808080 80808080 80808080  ................
