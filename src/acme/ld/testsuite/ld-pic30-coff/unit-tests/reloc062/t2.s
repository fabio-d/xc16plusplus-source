        .text
        .global part2
part2:
        pop     Amin
        pop     Amax
       
        pop     Bmin
        pop     Bmax

        .global Bmin, Bmax
        .equ Amin,0
        .equ Amax,0xFFFE
        .equ Bmin,0
        .equ Bmax,0xFFFE
