        .text      
        .global __t2
__t2:
        asr     w0,#symA1,w0
        lsr     w1,#symA2,w1
        sl      w3,#symA3,w3
        asr     w4,#symA4,w4
        lsr     w5,#symA5,w5
        nop
        asr     w0,#symB1,w0
        lsr     w1,#symB2,w1
        sl      w3,#symB3,w3
        asr     w4,#symB4,w4
        lsr     w5,#symB5,w5

        .equiv  symB1, 0
        .equiv  symB2, 0x3
        .equiv  symB3, 0x7
        .equiv  symB4, 0x8
        .equiv  symB5, 0xF

        .global symB1,symB2,symB3,symB4,symB5
        