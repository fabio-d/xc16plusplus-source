; .data subsections are no longer supported
           .data
           .word .
           .long 0
           .long 1
           .int 2
           .org 18
dataA1:    .word .
           .int 3

           .text
           .global textA0
textA0:    .pword paddr(.)
           .long 0
           .long 1
           .int 2
textA1:    .pword paddr(.)
           .int 3           
           .global _main
           .global __reset
_main:           
__reset:   nop
           goto .

           .data
           .align 2
           .word .
           .long 4
           .long 5
           .int 6
                      
dataA2:    .word .
           .int 7

           .end
           
