        .text      
        .global __reset
__reset:
        asr     w0,#symA1,w0
        lsr     w5,#symA5,w5
        nop
        asr     w0,#symB1,w0
        lsr     w5,#symB5,w5

        .equiv  symA1, 0
        .equiv  symA5, 0xF
                
        .global symA1,symA5
 