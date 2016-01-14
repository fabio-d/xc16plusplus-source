; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670h_inc
                  .equ cert670h_inc, 1

                  .data
                  .byte
c670h0:           .byte 0x11
                  
                  .include "./cert0670i.inc"

c670h1:           .byte 0x12
                  
                  .endif
                  
