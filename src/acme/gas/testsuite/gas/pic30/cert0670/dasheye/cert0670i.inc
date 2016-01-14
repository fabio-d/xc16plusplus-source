; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670i_inc
                  .equ cert670i_inc, 1

                  .data
                  .byte
c670i0:           .byte 0x11
                  
                  .include "./cert0670j.inc"

c670i1:           .byte 0x12
                  
                  .endif
                  
