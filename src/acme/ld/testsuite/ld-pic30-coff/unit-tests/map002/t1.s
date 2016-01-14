        .text
        .global __reset
__reset:        
        .pword 1,2,3,4
        .bss
        .space 0x20
        