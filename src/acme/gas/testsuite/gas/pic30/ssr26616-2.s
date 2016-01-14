
             .text
             .section foo,psv,reverse(4)
             .word 0x1234

             .text
             nop

             .section bar,data
             .space 2

             .section test,eedata
             .word 0x1234

             .section foo,noload
             .word 0x5678

             .text
             nop

             .section foo,near
             .word 0xABCD

             .text
             nop

             .section test,near
             .byte 0

             .text
             nop

             .end

;././gas/pic30/ssr26616-2.s: Assembler messages:
;././gas/pic30/ssr26616-2.s:15: Warning: changed section attributes for foo
;././gas/pic30/ssr26616-2.s:21: Warning: changed section attributes for foo
;././gas/pic30/ssr26616-2.s:21: Error: invalid attribute combination for foo
;././gas/pic30/ssr26616-2.s:27: Warning: changed section attributes for test
;././gas/pic30/ssr26616-2.s:27: Error: invalid attribute combination for test
