        .text
        .global __reset
__reset:
part1:  
        .pword  symLO
        .pword  symHI
part2:
        .pword  mysymLO
        .pword  mysymHI

        .equiv  mysymLO,-8388608
        .equiv  mysymHI,16777215
        
