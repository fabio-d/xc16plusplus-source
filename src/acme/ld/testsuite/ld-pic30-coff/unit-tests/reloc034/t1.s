        ;; reloc035
        ;;
        .text
        .global __reset
__reset:
        bra     here
here:
        bra     everywhere
there:  
        .space 0xFFFE
everywhere:
        bra     there
        bra     everywhere+2
        