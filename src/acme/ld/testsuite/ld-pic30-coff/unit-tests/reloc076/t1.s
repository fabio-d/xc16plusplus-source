        .text      
        .global __reset
__reset:
        trap    #symA1
        trap    #symA5
        nop
        trap    #symB1
        trap    #symB5

        .equiv  symA1, 0
        .equiv  symA5, 0xFFFF
                
        .global symA1,symA5
 