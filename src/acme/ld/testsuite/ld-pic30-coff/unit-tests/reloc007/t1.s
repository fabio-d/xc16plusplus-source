        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        bclr.b   w0,#bit0
        bset.b   w1,#bit1
        btg.b    w2,#bit2

part2:          
        bclr.b   w0,#mybit0
        bset.b   w1,#mybit1
        btg.b    w2,#mybit2

        .equ    mybit0,0
        .equ    mybit1,1
        .equ    mybit2,2
