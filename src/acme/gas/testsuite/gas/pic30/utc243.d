#objdump: -s -j .text
#name: .text with Subsection

# Test to ensure that the optional subsection argument of the .text section
# is handled properly.

.*: .*

Contents of section .text:
 0000 123400 567800 9abc00         .4.Vx....   
