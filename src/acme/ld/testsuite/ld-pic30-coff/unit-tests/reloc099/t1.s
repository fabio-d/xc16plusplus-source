        .text
        .global __reset
__reset:
part1:  
        .long  symLO
        .long  symHI
part2:
        .long  mysymLO
        .long  mysymHI

        .equiv  mysymLO,-2147483648
        .equiv  mysymHI,4294967295
        
