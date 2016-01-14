        .text      
        .global __reset
__reset:
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

        .equiv  symA1, 0
        .equiv  symA2, 0x300
        .equiv  symA3, 0x7FFF
        .equiv  symA4, 0x8000
        .equiv  symA5, 0xFFFF
                
        .global symA1,symA2,symA3,symA4,symA5
 