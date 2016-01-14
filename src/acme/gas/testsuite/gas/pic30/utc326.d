#objdump: -s -j .data
#name: .space Directive's Maximum Fill Value Specified

# Test to ensure that the the maximum fill value for the .space directive is
# accepted.

.*: .*

Contents of section .data:
 0000 ffffffff ffffffff ffff               ..........      
