        .text      
        .global __t2
__t2:
        disi    #symA1
        disi    #symA5
        nop
        disi    #symB1
        disi    #symB5

        .equiv  symB1, 0
        .equiv  symB5, 0x3FFF

        .global symB1,symB5
        