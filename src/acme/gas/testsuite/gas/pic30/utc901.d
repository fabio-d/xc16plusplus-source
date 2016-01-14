#as: -W
#objdump: -s -j someexecutable
#name: .pword in executable section

# Test to ensure that the assembler can handle the .pword directive
# in an executable section.


.*: .*

Contents of section someexecutable:
 0000 563412                       V4.         
