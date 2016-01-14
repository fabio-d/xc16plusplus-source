        .text
        .global __reset, part1b, part2b
__reset:
        nop
part1b:
        bclr   w0,#bit7a
        bset   w1,#bit6a
        btg    w2,#bit5a
        btst   w3,#bit4a
        btst   w4,#bit3a
        btsts  w5,#bit2a
        btsts  w6,#bit1a
        btsc   w7,#bit0a
        bclr   [w8],#bit7a
        bset   [w9],#bit6a
        btg    [w10],#bit5a
        btst   [w11],#bit4a
        btst   [w12],#bit3a
        btsts  [w13],#bit2a
        btsts  [w14],#bit1a
        btss   [w15],#bit0a

part2b:
        bclr   w0,#bit7b
        bset   w1,#bit6b
        btg    w2,#bit5b
        btst   w3,#bit4b
        btst   w4,#bit3b
        btsts  w5,#bit2b
        btsts  w6,#bit1b
        btsc   w7,#bit0b
        bclr   [w8],#bit7b
        bset   [w9],#bit6b
        btg    [w10],#bit5b
        btst   [w11],#bit4b
        btst   [w12],#bit3b
        btsts  [w13],#bit2b
        btsts  [w14],#bit1b
        btss   [w15],#bit0b

        .equ    bit0b,0
        .equiv  bit1b,1
        .equ    bit2b,2
        .equ    bit3b,3
        .equ    bit4b,4
        .equ    bit5b,5
        .equiv  bit6b,6
        .equiv  bit7b,7

        .global bit0b, bit1b, bit2b, bit3b, bit4b, bit5b, bit6b, bit7b

		.end

