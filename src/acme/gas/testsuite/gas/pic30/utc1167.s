        ;; all should assemble to the same instruction
        .text
        mov [w14+10],w0
        mov [w14+6+4],w0
        mov [w14+6*2-2],w0

        .equ foo,8
        .equ bar,2
        mov [w14+foo+2],w0
        mov [w14+foo+bar],w0
        mov [w14+foo*bar-6],w0
        