
        .global bit0a,bit1a,bit2a,bit3a,bit4a,bit5a,bit6a,bit7a

        .equ bit0a,0
        .equ bit1a,1
        .equiv bit2a,2
        .equ bit3a,3
        .equ bit4a,4
        .equiv bit5a,5
        .equ bit6a,6
        .equ bit7a,7

        .text
        .global part1a, part2a
part1a:
        bclr.w   w0,#15
        bset.b   w1,#bit1a
        btg.b    w2,#bit2a
        btst   w3,#bit3a
        btst   w4,#bit4a
        btsts  w5,#bit5a
        btsts  w6,#bit6a
        btsc   w7,#bit7a
        bclr.b   [w8],#bit0a
        bset.b   [w9],#bit1a
        btg.b    [w10],#bit2a
        btst   [w11],#bit3a
        btst   [w12],#bit4a
        btsts  [w13],#bit5a
        btsts  [w14],#bit6a
        btss   [w15],#bit7a

part2a:
        bclr.b   w0,#bit0b
        bset.b   w1,#bit1b
        btg.b    w2,#bit2b
        btst   w3,#bit3b
        btst   w4,#bit4b
        btsts  w5,#bit5b
        btsts  w6,#bit6b
        btsc   w7,#bit7b
        bclr.b   [w8],#bit0b
        bset.b   [w9],#bit1b
        btg.b    [w10],#bit2b
        btst   [w11],#bit3b
        btst   [w12],#bit4b
        btsts  [w13],#bit5b
        btsts  [w14],#bit6b
        btss   [w15],#bit7b


		.end

