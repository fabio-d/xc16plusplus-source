; Test file dependency information with up to 15 levels of nesting.

                  .nolist
                  
                  .text
cert670_s_0:      nop
                  .byte 0x01
                  nop
                  
                  .include "././gas/pic30/cert0670/cert0670a.inc"
                  
                  .text
                  nop
                  .byte 0x02
                  nop

                  .list

                  .end


