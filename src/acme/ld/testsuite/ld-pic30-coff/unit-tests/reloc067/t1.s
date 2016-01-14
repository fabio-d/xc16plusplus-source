        ;; from linker certification test cert0429a
        .text      
        .global __reset
__reset:
        addc    #symA1, w1
        addc    #symA2, w2
        addc    #symA3, w3
        addc    #symA4, w4
        addc    #symA5, w5
        nop
        addc    #symB1, w1
        addc    #symB2, w2
        addc    #symB3, w3
        addc    #symB4, w4
        addc    #symB5, w5

        .equiv  symA1, 0
        .equiv  symA2, 0x01
        .equiv  symA3, 0x200
        .equiv  symA4, 0x3FE
        .equiv  symA5, 0x3FF
                
        .global symA1,symA2,symA3,symA4,symA5
 