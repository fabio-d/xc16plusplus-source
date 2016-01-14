
             .text
             .section foo,psv,reverse(4)
             .word 0x1234

             .text
             nop

             .section bar,data
             .space 2

             .section test,data,near
             .word 0x1234

             .section foo,noload
             .word 0x5678

             .end
