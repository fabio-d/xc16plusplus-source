        .text
        .global __reset
__reset:        
        .pword 1,2,3,4

        .bss
        .space 0x10

        .section .ybss,"b"
        .space 0x20
        
        .section .ydata,"d"
        .space 0x30
        
       
        