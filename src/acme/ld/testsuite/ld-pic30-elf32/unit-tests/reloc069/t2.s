        .text      
        .global __t2
__t2:
        addc    #symA2, w2
        addc    #symA3, w3

        .equiv  symB2, -1
        .equiv  symB3, 1024

        .global symB2,symB3
        