        .text      
        .global __t2
__t2:
        mov     #symA1,w0
        mov     #symA5,w0
        nop
        mov     #symB1,w0
        mov     #symB5,w0

        .equiv  symB1, 0
        .equiv  symB5, 0xFFFF

        .global symB1,symB5
        