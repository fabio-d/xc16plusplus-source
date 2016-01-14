        .text      
        .global __t2
__t2:
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

        .equiv  symB1, 0
        .equiv  symB2, 1
        .equiv  symB3, 0x7ff
        .equiv  symB4, 0x8000
        .equiv  symB5, 0xFFFF

        .global symB1,symB2,symB3,symB4,symB5
        