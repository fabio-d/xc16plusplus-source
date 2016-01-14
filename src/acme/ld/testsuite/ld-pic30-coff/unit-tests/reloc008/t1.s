        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        bclr.b   w0,#bit0
        bset.b   w7,#bit7
        bclr.b   [w8],#bit0
        bset.b   [w15],#bit7

part2:          
        bclr.b   w0,#mybit0
        bset.b   w7,#mybit7
        bclr.b   [w8],#mybit0
        bset.b   [w15],#mybit7

        .equ    mybit0,0
        .equ    mybit7,7
        