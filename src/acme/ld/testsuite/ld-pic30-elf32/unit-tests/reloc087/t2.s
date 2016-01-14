        .text      
        .global __t2
__t2:
        mov     #symA1,w0
        mov     #symA2,w0
        mov     #symA3,w0
        mov     #symA4,w0
        mov     #symA5,w0
        nop
        mov     #symB1,w0
        mov     #symB2,w0
        mov     #symB3,w0
        mov     #symB4,w0
        mov     #symB5,w0

        .equiv  symB1, 0
        .equiv  symB2, 0x300
        .equiv  symB3, 0x7FFF
        .equiv  symB4, 0x8000
        .equiv  symB5, 0xFFFF

        .global symB1,symB2,symB3,symB4,symB5
        