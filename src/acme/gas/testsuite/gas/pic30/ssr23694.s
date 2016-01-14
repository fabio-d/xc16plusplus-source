
             .text
             .global __reset
__reset:     nop

             mul.ss w0,[++w0],w14
             bra .

             .end

