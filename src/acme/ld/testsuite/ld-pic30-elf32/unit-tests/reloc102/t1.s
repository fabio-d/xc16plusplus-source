        .text
        .global __reset
__reset:
part1:  
        .word  symLO
        .word  symHI
part2:
        .word  mysymLO
        .word  mysymHI

        .equiv  mysymLO,-32768
        .equiv  mysymHI,65535
        
