#objdump: -s -j .data
#name: .skip Directive's Maximum Fill Value Specified

# Test to ensure that the the maximum fill value for the .skip directive is
# accepted.

.*: .*

Contents of section .data:
 0000 ffffffff ffffffff ffff               ..........      
