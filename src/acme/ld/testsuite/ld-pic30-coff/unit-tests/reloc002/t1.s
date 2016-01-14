        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        bclr.b  t0,#bit0
        bclr.b  t7,#bit7

part2:          
        bclr.b  t0,#mybit0
        bclr.b  t7,#mybit7

        .equ    mybit0,0
        .equ    mybit7,7
        