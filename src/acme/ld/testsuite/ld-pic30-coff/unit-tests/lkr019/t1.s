        .text
        .global __reset
__reset:        
        nop

        .section foo,"r"
        .global L1,L2
L1:     .word 0x1111
L2:     .word 0x2222
