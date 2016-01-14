        .text
        .global __reset, part1, part2
__reset:
        nop
part1:
        lnk     #frameMIN
        lnk     #frameMAX
part2:          
        lnk     #myframeMIN
        lnk     #myframeMAX

        .equ    myframeMIN,0
        .equ    myframeMAX,0x3FFE
