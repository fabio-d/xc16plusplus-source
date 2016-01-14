; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670o_inc
                  .equ cert670o_inc, 1

                  .data
c670o0:           .byte 0x11
                  
                   .if 0
                   .include "donotinclude.inc"
                   .endif

                  .include "cert0670p.inc"

c670o1:           .byte 0x12
                  .byte 0x13
                  
                  .endif
                  
