        .text      
        .global __reset
__reset:
        addc    #symA1, w1
        addc    #symA5, w5
        nop
        addc    #symB1, w1
        addc    #symB5, w5

        .equiv  symA1, 0
        .equiv  symA5, 0x3FF
                
        .global symA1,symA5
 