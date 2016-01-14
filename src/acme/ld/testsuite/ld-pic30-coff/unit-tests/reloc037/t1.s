        ;; reloc037
        ;;
        .text
        .global __reset
__reset:
        do     #2,here
        nop 
here:
        nop
        do     #2,everywhere
        nop
there:  
        .space 0xFFFA
everywhere:
        nop
        do     #2,there
nowhere:
        nop        
        do     #2,nowhere
        
