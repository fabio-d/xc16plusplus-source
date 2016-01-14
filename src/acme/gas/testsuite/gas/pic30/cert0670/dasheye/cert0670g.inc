; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670g_inc
                  .equ cert670g_inc, 1

                  .data
                  .byte
c670g0:           .byte 0x11
                  
                  .include "./cert0670h.inc"

c670g1:           .byte 0x12
                  
                  .endif
                  
