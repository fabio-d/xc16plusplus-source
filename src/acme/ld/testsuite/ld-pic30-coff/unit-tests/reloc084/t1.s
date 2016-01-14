        .text      
        .global __reset
__reset:
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

        .equiv  symA1, 0
        .equiv  symA2, 0x3
        .equiv  symA3, 0x7
        .equiv  symA4, 0x18
        .equiv  symA5, 0x1F
                
        .global symA1,symA2,symA3,symA4,symA5
 