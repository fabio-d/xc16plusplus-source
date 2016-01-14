        .global F1
F1:     clr w1

        .weak F2
F2:     nop

        .weak F4
F4:     nop

        .global F5
F5:     clr w5

        .global S1
        .equ S1,0x111111

        .weak S2
        .equ S2,0x999999
        