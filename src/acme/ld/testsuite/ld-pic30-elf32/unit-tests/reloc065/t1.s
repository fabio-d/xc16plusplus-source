        .text
        .global __reset, part1
__reset:
part1:  
        mov.w     w0,Amin
        mov.w     w1,Amax
       
        mov.w     w2,Bmin
        mov.w     w3,Bmax

        .global Amin, Amax
        .equ Amin,0
        .equ Amax,0xFFFE
        .equ Bmin,0
        .equ Bmax,0xFFFE
