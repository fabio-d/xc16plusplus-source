        .text      
        .global __t2
__t2:
        disi    #symA1
        disi    #symA2
        disi    #symA3
        disi    #symA4
        disi    #symA5
        nop
        disi    #symB1
        disi    #symB2
        disi    #symB3
        disi    #symB4
        disi    #symB5

        .equiv  symB1, 0
        .equiv  symB2, 0xf9
        .equiv  symB3, 0x800
        .equiv  symB4, 0x3000
        .equiv  symB5, 0x3FFF

        .global symB1,symB2,symB3,symB4,symB5
        