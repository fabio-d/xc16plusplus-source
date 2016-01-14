        .text      
        .global __reset
__reset:
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

        .equiv  symA1, 0x01
        .equiv  symA2, -128
        .equiv  symA3, 127
        .equiv  symA4, 0
        .equiv  symA5, -1
                
        .global symA1,symA2,symA3,symA4,symA5
 