; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670f_inc
                  .equ cert670f_inc, 1

                  .data
                  .byte
c670f0:           .byte 0x11
                  
                  .include "./cert0670g.inc"

c670f1:           .byte 0x12
                  
                  .endif
                  
