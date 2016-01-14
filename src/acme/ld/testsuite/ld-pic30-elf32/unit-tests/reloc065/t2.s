        .text
        .global part2
part2:
        mov.w     w0,Amin
        mov.w     w1,Amax
       
        mov.w     w2,Bmin
        mov.w     w3,Bmax

        .global Bmin, Bmax
        .equ Amin,0
        .equ Amax,0xFFFE
        .equ Bmin,0
        .equ Bmax,0xFFFE
