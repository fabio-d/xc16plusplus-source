#as: --relax
#objdump: -s -j .text
#name: --relax Command-Line Option

# Test to ensure that the a CALL/GOTO instruction is converted to an RCALL/BRA
# instruction when the function that is being called is within 32k instructions
# and the --relax command-line option is given to the assembler.

.*: .*

Contents of section .text:
 0000 000007 000037 0000ff         .....7...   
