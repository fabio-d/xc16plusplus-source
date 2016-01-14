        ;; from linker certification test cert0429b
        .text      
        .global __t2
__t2:
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

        .equiv  symB1, 0
        .equiv  symB2, 0x01
        .equiv  symB3, 0x200
        .equiv  symB4, 0x3FE
        .equiv  symB5, 0x3FF

        .global symB1,symB2,symB3,symB4,symB5
        