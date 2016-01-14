           .text
           .global textB0
textB0:    .pword paddr(.)
           .long 0
           .long 1
           .int 2

textB1:    .int paddr(.)
           .int 3       

; .data subsections are no longer supported
           .data
           .word .
           .long 0
           .long 1
           .int 3

dataB1:    .int .
           .int 3

           .text
           .long 4
           .long 5
           .int 6

textB2:    .pword paddr(.)
           .int 7      

           .end
           
