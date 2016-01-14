        .text      
        .global __reset
__reset:
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

        .equiv  symA1, 0
        .equiv  symA2, 0x3
        .equiv  symA3, 0x7
        .equiv  symA4, 0x8
        .equiv  symA5, 0xF
                
        .global symA1,symA2,symA3,symA4,symA5
 