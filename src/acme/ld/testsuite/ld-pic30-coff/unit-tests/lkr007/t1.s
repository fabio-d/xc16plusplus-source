        ;;
        ;; this test should generate an error
        ;; 
        .text
        .global __reset
__reset:        
        .pword 1,2,3,4

        .section .xbss,"b"
        .space 0x400            ; too large for 30f3014
        
        .section .xdata,"d"
        .space 0x20
        
        .bss
        .space 0x30
       
        