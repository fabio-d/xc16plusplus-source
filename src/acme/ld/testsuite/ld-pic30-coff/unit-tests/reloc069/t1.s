        .text      
        .global __reset
__reset:
        addc    #symB2, w2
        addc    #symB3, w3

        .equiv  symA2, -1
        .equiv  symA3, 1024
                
        .global symA2,symA3
 