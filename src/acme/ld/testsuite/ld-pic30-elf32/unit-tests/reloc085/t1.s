        .text      
        .global __reset
__reset:
        add     w0,#symA1,w0
        sub     w5,#symA5,w5
        nop
        subr    w0,#symB1,w0
        addc    w5,#symB5,w5

        .equiv  symA1, 0
        .equiv  symA5, 0x1F
                
        .global symA1,symA5
 