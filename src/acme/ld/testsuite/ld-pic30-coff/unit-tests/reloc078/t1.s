        .text      
        .global __reset
__reset:
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

        .equiv  symA1, 0
        .equiv  symA2, 0xf9
        .equiv  symA3, 0x800
        .equiv  symA4, 0x3000
        .equiv  symA5, 0x3FFF
                
        .global symA1,symA2,symA3,symA4,symA5
 