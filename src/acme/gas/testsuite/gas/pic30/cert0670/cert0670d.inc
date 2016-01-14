; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670d_inc
                  .equ cert670d_inc, 1
                  
                  .data
c670d0:           .byte
                  .byte 0x11
                  
                  .include ".\.\gas\pic30\cert0670\level 2\cert0670e.inc"

c670d1:           .byte 0x12
                  
                  .endif
