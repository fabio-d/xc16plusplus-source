; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670m_inc
                  .equ cert670m_inc, 1

                  .data
                  .byte
c670m0:           .byte 0x11
                  
                  .include "./cert0670n.inc"

c670m1:           .byte 0x12
                  
                  .endif
                  
