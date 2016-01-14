; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670a_inc
                  .equ cert670a_inc, 1

                  .data
                  .byte
c670a0:           .byte 0x11
                  
                  .include "././gas/pic30/cert0670/level 2/cert0670b.inc"
c670a2:           .byte 0x12
                  ;.include "././gas/pic30/cert0670/cert0670d.inc"                  
                  
c670a3:           .byte 0x13

                  .endif
