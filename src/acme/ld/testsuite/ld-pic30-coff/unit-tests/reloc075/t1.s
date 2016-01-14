        .text      
        .global __reset
__reset:
        trap    #symA1
        trap    #symA2
        trap    #symA3
        trap    #symA4
        trap    #symA5
        nop
        trap    #symB1
        trap    #symB2
        trap    #symB3
        trap    #symB4
        trap    #symB5

        .equiv  symA1, 0
        .equiv  symA2, 1
        .equiv  symA3, 0x7ff
        .equiv  symA4, 0x8000
        .equiv  symA5, 0xFFFF
                
        .global symA1,symA2,symA3,symA4,symA5
 