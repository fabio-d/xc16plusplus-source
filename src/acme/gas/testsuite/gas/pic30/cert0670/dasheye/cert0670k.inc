; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670k_inc
                  .equ cert670k_inc, 1

                  .text
c670k0:           .byte 0x11
                  
                  .include "./cert0670l.inc"

c670k1:           .byte 0x12
                  
                  .endif
                  
