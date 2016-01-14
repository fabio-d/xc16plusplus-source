        .text      
        .global __t2
__t2:
        asr     w0,#symA1,w0
        lsr     w5,#symA5,w5
        nop
        asr     w0,#symB1,w0
        lsr     w5,#symB5,w5

        .equiv  symB1, 0
        .equiv  symB5, 0xF

        .global symB1,symB5
        