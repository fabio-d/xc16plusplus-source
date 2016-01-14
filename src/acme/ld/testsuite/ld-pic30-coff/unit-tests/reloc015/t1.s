        ;; reloc015
        ;;
        ;; depends on section .text located at 0x100 (PC)
        ;;
        .text
        .global __reset
__reset:
        do     #2,0x104         ; here
here:
        do     #2,0x10108       ; everywhere
        nop
there:  
        .space 0xFFFE
everywhere:
        do     #2,0x10A         ; there
nowhere:        
        do     #2,0x1010C       ; nowhere
        