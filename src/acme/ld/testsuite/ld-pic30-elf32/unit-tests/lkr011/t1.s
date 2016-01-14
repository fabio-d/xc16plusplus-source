        ;;
        ;; this test should cause an error
        .text
        .global __reset
__reset:        
        .pword 1,2,3,4

        .section .nbss,"b"
        .space 0x1800
        
        .section .ndata,"d"
        .space 0x20

     
        