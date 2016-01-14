        .text
        .global __reset
__reset:
part1:  
        .pbyte  symLO
        .pbyte  symHI
        nop
part2:
        .pbyte  mysymLO
        .pbyte  mysymHI

        .equiv  mysymLO,-128
        .equiv  mysymHI,255
        
