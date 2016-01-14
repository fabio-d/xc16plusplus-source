        .text
        .global __reset, part1
__reset:
part1:  
        add.b     Bmin2
        add.b     Bmin1
        and.b     Bmax1
        and.b     Bmax2

        .global Amin1, Amin2, Amax1, Amax2
        .equ Amin2,-2
        .equ Amin1,-1
        .equ Amax1,0x2000
        .equ Amax2,0x2001

