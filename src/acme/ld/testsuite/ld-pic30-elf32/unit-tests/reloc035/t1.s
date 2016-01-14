        ;; reloc035
        ;;
        ;; depends on section .text located at 0x100 (PC)
        ;;
        ;; this test should fail with a link error
        ;; 
                .text
        .global __reset
__reset:
        bra     here
here:
        bra     everywhere
there:  
        .space 0x10000
everywhere:
        bra     there
        bra     everywhere+2
        