        .text
        .global __reset
__reset:        
        .pword 1,2,3,4

        .section .nbss,"b"
        .space 0x10
        
        .section .ndata,"d"
        .space 0x20
        
        .bss
        .space 0x30
       
        