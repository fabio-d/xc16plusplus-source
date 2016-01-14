        .text      
        .global __t2
__t2:
        addc    #symA1, w1
        addc    #symA5, w5
        nop
        addc    #symB1, w1
        addc    #symB5, w5

        .equiv  symB1, 0
        .equiv  symB5, 0x3FF

        .global symB1,symB5
        