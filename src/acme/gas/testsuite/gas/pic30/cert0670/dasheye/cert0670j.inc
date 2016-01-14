; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670j_inc
                  .equ cert670j_inc, 1

                  .data
                  .byte
c670j0:           .byte 0x11
                  
                  .include "./cert0670k.inc"

c670j1:           .byte 0x12
                  
                  .endif
                  
