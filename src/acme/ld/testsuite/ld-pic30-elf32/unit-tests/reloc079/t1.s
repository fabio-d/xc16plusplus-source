
                .text      
        .global __reset
__reset:
        disi    #symA1
        disi    #symA5
        nop
        disi    #symB1
        disi    #symB5

        .equiv  symA1, 0
        .equiv  symA5, 0x3FFF
                
        .global symA1,symA5
 