#as: --no-warn
#objdump: -s -j .text
#name: .org in .text - fill Specified

# Test to ensure that the .org directive works properly in a .text section.

.*: .*

Contents of section .text:
 0000 111100 111100 111100 111100  ............
 0008 121300 222200 222200 222200  ..."".""."".
 0010 181900                       ...         