; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670l_inc
                  .equ cert670l_inc, 1

                  .text
c670l0:           .byte 0x11
                  
                  .include "./cert0670m.inc"

c670l1:           .byte 0x12
                  
                  .endif
                  
