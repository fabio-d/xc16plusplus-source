; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670e_inc
                  .equ cert670e_inc, 1
                  
                  .data
                  .byte
c670e0:           .byte 0x11
                  
                  .include "cert0670f.inc"

c670e1:           .byte 0x12
                  
                  .endif
