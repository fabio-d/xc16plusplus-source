        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        sftac   A,#shiftLO
        sftac   A,#shiftHI
part2:          
        sftac   A,#myshiftLO
        sftac   A,#myshiftHI

        .equ    myshiftLO,-16
        .equ    myshiftHI,16
