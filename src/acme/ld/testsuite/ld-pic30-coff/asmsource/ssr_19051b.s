
          .data
failstrb: .asciz "fail: itr %d\n"
passstrb: .asciz "pass: itr %d\n"
passallb: .asciz "PASS: itr END\n"
failallb: .asciz "FAIL: itr END\n"

          .text
          nop
          .section bar,psv
          .align 2
fileb3:   .byte 1
          .align 4
          .byte 2
fileb4:   .byte 3

          .section foo,psv
          .align 2
fileb1:   .byte 1
          .align 4
          .byte 2
fileb2:   .byte 3

               .section .const
               .align 2
constfileb1:   .byte 1
               .align 4
               .byte 2
constfileb2:   .byte 3

               .end

