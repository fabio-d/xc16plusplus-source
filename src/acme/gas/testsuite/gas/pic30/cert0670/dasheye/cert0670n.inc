; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670n_inc
                  .equ cert670n_inc, 1

                  .data
                  .byte
c670n0:           .byte 0x11
                  
                  .include "./cert0670o.inc"

c670n1:           .byte 0x12
                  
                  .endif
                  
