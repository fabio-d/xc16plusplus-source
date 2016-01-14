        .text
        .global part2
part2:
        add.b     Amin
        and.b     Amax
       
        add.b     Bmin
        and.b     Bmax

        .global Bmin, Bmax
        .equ Amin,0
        .equ Amax,0x1FFF
        .equ Bmin,0
        .equ Bmax,0x1FFF
