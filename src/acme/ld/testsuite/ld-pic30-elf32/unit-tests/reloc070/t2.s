        .text      
        .global __t2
__t2:
        addc.b    #symA1, w1
        addc.b    #symA2, w2
        addc.b    #symA3, w3
        addc.b    #symA4, w4
        addc.b    #symA5, w5
        nop
        addc.b    #symB1, w1
        addc.b    #symB2, w2
        addc.b    #symB3, w3
        addc.b    #symB4, w4
        addc.b    #symB5, w5

        .equiv  symB1, 0x01
        .equiv  symB2, -128
        .equiv  symB3, 127
        .equiv  symB4, 0
        .equiv  symB5, -1

        .global symB1,symB2,symB3,symB4,symB5
        