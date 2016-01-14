        .text
        .global __reset, part1
__reset:
part1:  
        add     Amin
        and     Amax
       
        add     Bmin
        and     Bmax

        .global Amin, Amax
        .equ Amin,0
        .equ Amax,0x1FFE
        .equ Bmin,0
        .equ Bmax,0x1FFE
