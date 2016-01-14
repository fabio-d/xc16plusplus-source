        ;; reloc038
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
        .space 0xFFFE
everywhere:
        nop
        do     #2,there
nowhere:
        nop        
        do     #2,nowhere

bad_val:
        do     #2,bad_target
bad_target:
        nop
        
