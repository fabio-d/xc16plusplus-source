#objdump: -s -j .text
#name: .fillvalue Fills User-addressable PC Locations

# Test to ensure that the specified value for the .fillvalue directive is
# used to fill the user-addressable PC locations.

.*: .*

Contents of section .text:
 0000 125500                       .U.         
