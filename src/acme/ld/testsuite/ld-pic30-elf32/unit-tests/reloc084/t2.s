        .text      
        .global __t2
__t2:
        add     w0,#symA1,w0
        addc    w1,#symA2,w1
        and     w3,#symA3,w3
        ior     w4,#symA4,w4
        sub     w5,#symA5,w5
        nop
        subr    w0,#symB1,w0
        subbr   w1,#symB2,w1
        xor     w3,#symB3,w3
        add     w4,#symB4,w4
        addc    w5,#symB5,w5

        .equiv  symB1, 0
        .equiv  symB2, 0x3
        .equiv  symB3, 0x7
        .equiv  symB4, 0x18
        .equiv  symB5, 0x1F

        .global symB1,symB2,symB3,symB4,symB5
        