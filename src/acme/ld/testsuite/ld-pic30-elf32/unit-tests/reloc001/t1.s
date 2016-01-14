        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        bclr.b  t0,#bit0
        bset.b  t1,#bit1
        btg.b   t2,#bit2
        btst.b  t3,#bit3
        btsts.b t4,#bit4
        btsc.b  t5,#bit5
        btss.b  t6,#bit6
        bclr.b  t7,#bit7

part2:          
        bclr.b  t0,#mybit0
        bset.b  t1,#mybit1
        btg.b   t2,#mybit2
        btst.b  t3,#mybit3
        btsts.b t4,#mybit4
        btsc.b  t5,#mybit5
        btss.b  t6,#mybit6
        bclr.b  t7,#mybit7

        .equ    mybit0,0
        .equ    mybit1,1
        .equ    mybit2,2
        .equ    mybit3,3
        .equ    mybit4,4
        .equ    mybit5,5
        .equ    mybit6,6
        .equ    mybit7,7
        