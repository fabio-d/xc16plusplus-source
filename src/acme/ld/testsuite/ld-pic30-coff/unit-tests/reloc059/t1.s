        .text
        .global __reset, part1
__reset:
part1:  
        add.b     Amin
        and.b     Amax
       
        add.b     Bmin
        and.b     Bmax

        .global Amin, Amax
        .equ Amin,0
        .equ Amax,0x1FFF
        .equ Bmin,0
        .equ Bmax,0x1FFF
