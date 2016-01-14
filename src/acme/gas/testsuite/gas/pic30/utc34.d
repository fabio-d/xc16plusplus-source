#objdump: -s -j .text
#name: .fillvalue Default Value Reset

# Test to ensure that the default value is reset when a .fillvalue directive
# is seen with no argument after having seen a .fillvalue directive with an
# argument.

.*: .*

Contents of section .text:
 0000 115500 110000                .U....      
