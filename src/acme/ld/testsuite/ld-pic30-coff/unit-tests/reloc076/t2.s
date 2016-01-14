        .text      
        .global __t2
__t2:
        trap    #symA1
        trap    #symA5
        nop
        trap    #symB1
        trap    #symB5

        .equiv  symB1, 0
        .equiv  symB5, 0xFFFF

        .global symB1,symB5
        