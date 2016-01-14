#as: --no-relax
#objdump: -s -j .text
#name: --no-relax Command-Line Option

# Test to ensure that the a CALL/GOTO instruction is not converted to an
# RCALL/BRA instruction when the function that is being called is within
# 32k instructions and the --no-relax command-line option is given to the
# assembler.

.*: .*

Contents of section .text:
 0000 000002 000000 000004 000000  ............
 0008 0000ff                       ...         
