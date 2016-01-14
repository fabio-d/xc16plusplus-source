             .text
             BRA Z, 1f
             BRA EQ, 2f

             BRA NZ, 1f
             BRA NEQ, 2f

1:           NOP
2:           NOP

             .end

