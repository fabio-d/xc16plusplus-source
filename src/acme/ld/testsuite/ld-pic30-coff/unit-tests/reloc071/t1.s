        .text      
        .global __reset
__reset:
        addc.b    #symA2, w2
        addc.b    #symA3, w3
        nop
        addc.b    #symB2, w2
        addc.b    #symB3, w3

        .equiv  symA2, -128
        .equiv  symA3, 255
                
        .global symA2,symA3
 
