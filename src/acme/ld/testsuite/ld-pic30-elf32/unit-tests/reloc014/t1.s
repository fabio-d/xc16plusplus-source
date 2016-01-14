        ;; reloc014
        ;;
        ;; depends on section .text located at 0x100 (PC)
        ;;
        .text
        .global __reset
__reset:
        do     #2,0x106         ; here
        nop
here:
        nop
        do     #2,0x10108       ; everywhere
        nop
there:  
        .space 0xFFFA
everywhere:
        nop
        do     #2,0x10E         ; there
nowhere:        
        nop
        do     #2,0x1010E       ; nowhere
        