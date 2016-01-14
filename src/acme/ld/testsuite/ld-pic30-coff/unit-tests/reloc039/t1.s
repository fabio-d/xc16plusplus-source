        ;;
        ;; reloc039
        ;;
        ;; - assumes that section .text is loaded at 0x100 (PC)
        .text
        .global __reset, part1, part2
__reset:

part1:  
        goto     myL200
        goto     myL400
        goto     myL600
        goto     myL800
part2:
        goto     L1200
        goto     L1400
        goto     L1600   
        goto     L1800 

        .org (0x100)
myL200:
        .org (0x300)
myL400:
        .org (0x500)
myL600:
        .org (0x700)
myL800:
        