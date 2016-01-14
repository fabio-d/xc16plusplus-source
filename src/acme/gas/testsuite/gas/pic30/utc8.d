#as: --relax
#objdump: -s -j .text
#name: ABS to REL Relaxation

# Test to ensure that the CALL/GOTO instruction is converted to an RCALL/BRA
# instruction when the function that is being called is within 32k instructions.

.*: .*

Contents of section .text:
 0000 000007 000037 0000ff         .....7...   
