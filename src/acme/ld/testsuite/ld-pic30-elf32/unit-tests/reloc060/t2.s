        .text
        .global part2
part2:       
        add.b     Amin2
        add.b     Amin1
        and.b     Amax1
        and.b     Amax2

        .global Bmin1, Bmin2, Bmax1, Bmax2
        .equ Bmin2,-2
        .equ Bmin1,-1
        .equ Bmax1,0x2000
        .equ Bmax2,0x2001
