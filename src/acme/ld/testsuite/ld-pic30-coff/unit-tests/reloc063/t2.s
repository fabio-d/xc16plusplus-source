        .text
        .global part2
part2:       
        pop     Amin2
        pop     Amin1
        pop     Amax1
        pop     Amax2

        .global Bmin1, Bmin2, Bmax1, Bmax2
        .equ Bmin2,-2
        .equ Bmin1,-1
        .equ Bmax1,0x10000
        .equ Bmax2,0x10001
