        .text
        .global __reset, part1
__reset:
part1:  
        pop     Amin
        pop     Amax
       
        pop     Bmin
        pop     Bmax

        .global Amin, Amax
        .equ Amin,0
        .equ Amax,0xFFFE
        .equ Bmin,0
        .equ Bmax,0xFFFE
