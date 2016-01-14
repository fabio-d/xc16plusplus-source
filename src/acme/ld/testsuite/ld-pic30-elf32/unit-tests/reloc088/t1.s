        .text      
        .global __reset
__reset:
        mov     #symA1,w0
        mov     #symA5,w0
        nop
        mov     #symB1,w0
        mov     #symB5,w0

        .equiv  symA1, 0
        .equiv  symA5, 0xFFFF
                
        .global symA1,symA5
 