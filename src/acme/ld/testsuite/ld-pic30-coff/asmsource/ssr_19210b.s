
          .data
failstrb: .asciz "failb: itr %d\n"
passstrb: .asciz "passb: itr %d\n"
passallb: .asciz "PASSb: itr END\n"
failallb: .asciz "FAILb: itr END\n"

          .text
          nop

          .section foo, "r"
          .align 2
fileb1:   .byte 1
          .align 4
          .byte 2
fileb2:   .byte 3

               .section .const, "r"
               .align 2
constfileb1:   .byte 1
               .align 4
               .byte 2
constfileb2:   .byte 3

               .end

