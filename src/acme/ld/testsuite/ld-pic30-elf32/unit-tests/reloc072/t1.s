        .text      
        .global __reset
__reset:
__t1:   
        addc.b    #symB2, w2
        addc.b    #symB3, w3

        .equiv  symA2, -129
        .equiv  symA3, 256
                
        .global symA2,symA3
 