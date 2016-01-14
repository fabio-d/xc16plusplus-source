        .text      
        .global __reset
__reset:
        add     w0,#symLO,w0
        sub     w5,#symHI,w5
