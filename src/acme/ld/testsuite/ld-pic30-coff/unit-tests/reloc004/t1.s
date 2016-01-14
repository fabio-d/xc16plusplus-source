        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        bclr    w0,#bit0
        bset    w1,#bit1
        btg     w2,#bit2
        btst.c  w3,#bit3
        btst.z  w4,#bit4
        btsts.c w5,#bit5
        btsts.z w6,#bit6
        btsc    w7,#bit7
        btss    w8,#bit8
        bclr    w9,#bit9
        bset    w10,#bit10
        btg     w11,#bit11
        btst.c  w12,#bit12
        btst.z  w13,#bit13
        btsts.c w14,#bit14
        btsts.z w15,#bit15

part2:          
        bclr    w0,#mybit0
        bset    w1,#mybit1
        btg     w2,#mybit2
        btst.c  w3,#mybit3
        btst.z  w4,#mybit4
        btsts.c w5,#mybit5
        btsts.z w6,#mybit6
        btsc    w7,#mybit7
        btss    w8,#mybit8
        bclr    w9,#mybit9
        bset    w10,#mybit10
        btg     w11,#mybit11
        btst.c  w12,#mybit12
        btst.z  w13,#mybit13
        btsts.c w14,#mybit14
        btsts.z w15,#mybit15

        .equ    mybit0,0
        .equ    mybit1,1
        .equ    mybit2,2
        .equ    mybit3,3
        .equ    mybit4,4
        .equ    mybit5,5
        .equ    mybit6,6
        .equ    mybit7,7
        .equ    mybit8,8
        .equ    mybit9,9
        .equ    mybit10,10
        .equ    mybit11,11
        .equ    mybit12,12
        .equ    mybit13,13
        .equ    mybit14,14
        .equ    mybit15,15
        