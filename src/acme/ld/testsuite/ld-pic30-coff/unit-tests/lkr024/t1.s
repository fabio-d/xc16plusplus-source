        .text
        .global __reset
__reset:        
        nop

        .section foo,"r"
        .global L1,L2
L1:     .byte 1
L2:     .byte 2
