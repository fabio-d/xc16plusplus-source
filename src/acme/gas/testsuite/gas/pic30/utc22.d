#objdump: -s -j .text
#name: .fillupper Default Value Reset

# Test to ensure that the default value is reset when a .fillupper directive
# is seen with no argument after having seen a .fillupper directive with an
# argument.

.*: .*

Contents of section .text:
 0000 abcdff abcd00                ......      
