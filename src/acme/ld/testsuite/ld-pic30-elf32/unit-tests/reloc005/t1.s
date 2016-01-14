        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        bclr    w0,#bit0
        btsts.z w15,#bit15

part2:          
        bclr    w0,#mybit0
        btsts.z w15,#mybit15

        .equ    mybit0,0
        .equ    mybit15,15
        