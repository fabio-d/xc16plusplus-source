        .text      
        .global __t2
__t2:
        addc.b    #symA2, w2
        addc.b    #symA3, w3
        nop
        addc.b    #symB2, w2
        addc.b    #symB3, w3

        .equiv  symB2, -128
        .equiv  symB3, 255

        .global symB2,symB3
        
