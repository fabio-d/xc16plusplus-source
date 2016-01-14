        .text      
        .global __t2
__t2:
        addc.b    #symA2, w2
        addc.b    #symA3, w3

        .equiv  symB2, -129
        .equiv  symB3, 256

        .global symB2,symB3
        