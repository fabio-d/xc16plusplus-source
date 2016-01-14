        .text
        .global part2
part2:
        add     Amin
        and     Amax
       
        add     Bmin
        and     Bmax

        .global Bmin, Bmax
        .equ Amin,0
        .equ Amax,0x1FFE
        .equ Bmin,0
        .equ Bmax,0x1FFE
