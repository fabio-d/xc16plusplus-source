        ;; reloc012
        ;;
        ;; depends on section .text located at 0x100 (PC)
        ;;
        ;; this test should fail
        ;; 
                .text
        .global __reset
__reset:
        bra     0x102
here:
        bra     0x10104
there:  
        .space 0x10000
everywhere:
        bra     0x104
        bra     0x10104
        