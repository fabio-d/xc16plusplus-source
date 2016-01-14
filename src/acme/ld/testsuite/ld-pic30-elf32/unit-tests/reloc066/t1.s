        .text
        .global __reset, part1
__reset:
part1:  
        mov.w     w0,Bmin2
        mov.w     w1,Bmin1
       
        mov.w     w2,Bmax1
        mov.w     w3,Bmax2

        .global Amin1, Amin2, Amax1, Amax2
        .equ Amin2,-2
        .equ Amin1,-1
        .equ Amax1,0x10000
        .equ Amax2,0x10001

