        .text      
        .global __t2
__t2:
        add     w0,#symA1,w0
        sub     w5,#symA5,w5
        nop
        subr    w0,#symB1,w0
        addc    w5,#symB5,w5

        .equiv  symB1, 0
        .equiv  symB5, 0x1F

        .global symB1,symB5
        