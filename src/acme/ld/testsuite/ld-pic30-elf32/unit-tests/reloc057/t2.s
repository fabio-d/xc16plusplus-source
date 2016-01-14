        .text
        .global part2
part2:       
        add     Amin2
        add     Amin1
        and     Amax1
        and     Amax2

        .global Bmin1, Bmin2, Bmax1, Bmax2
        .equ Bmin2,-2
        .equ Bmin1,-1
        .equ Bmax1,0x2000
        .equ Bmax2,0x2001
