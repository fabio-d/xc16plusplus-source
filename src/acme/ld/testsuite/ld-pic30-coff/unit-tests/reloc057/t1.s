        .text
        .global __reset, part1
__reset:
part1:  
        add     Bmin2
        add     Bmin1
        and     Bmax1
        and     Bmax2

        .global Amin1, Amin2, Amax1, Amax2
        .equ Amin2,-2
        .equ Amin1,-1
        .equ Amax1,0x2000
        .equ Amax2,0x2001

