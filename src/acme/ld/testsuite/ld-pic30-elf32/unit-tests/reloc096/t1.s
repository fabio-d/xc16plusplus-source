        .text
        .global __reset
__reset:
part1:  
        .byte  symLO
        .byte  symHI
part2:
        .byte  mysymLO
        .byte  mysymHI

        .equiv  mysymLO,-128
        .equiv  mysymHI,255
        
