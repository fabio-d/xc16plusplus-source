        .text      
        .global __reset
__reset:
        asr     w0,#symLO,w0
        lsr     w5,#symHI,w5
