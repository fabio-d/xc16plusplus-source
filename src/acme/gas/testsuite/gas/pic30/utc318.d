#objdump: -s -j .data
#name: .skip Directive's Minimum Fill Value Specified

# Test to ensure that the the minimum fill value for the .skip directive is
# accepted.

.*: .*

Contents of section .data:
 0000 80808080 80808080 80808080 80808080  ................
