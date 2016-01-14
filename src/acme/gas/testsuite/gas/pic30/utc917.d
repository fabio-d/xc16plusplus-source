#as: 
#objdump: -s -j .text
#name: .pfillvalue No argument specified

# Test to ensure that the assembler uses the default value when we
# use .pfillvalue without an additional argument.

.*: .*

Contents of section .text:
 0000 115555 110000                .UU...      
