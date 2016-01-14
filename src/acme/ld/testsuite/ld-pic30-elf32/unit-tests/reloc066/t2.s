        .text
        .global part2
part2:       
        mov.w     w0,Amin2
        mov.w     w1,Amin1
       
        mov.w     w2,Amax1
        mov.w     w3,Amax2

        .global Bmin1, Bmin2, Bmax1, Bmax2
        .equ Bmin2,-2
        .equ Bmin1,-1
        .equ Bmax1,0x10000
        .equ Bmax2,0x10001
