#objdump: -s -j .data
#name: .data with Subsection

# Test to ensure that the optional subsection argument of the .data directive
# functions properly

.*: .*

Contents of section .data:
 0000 12345678 9abc                        .4Vx..          
