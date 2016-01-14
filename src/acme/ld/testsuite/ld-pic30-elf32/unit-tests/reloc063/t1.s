        .text
        .global __reset, part1
__reset:
part1:  
        pop     Bmin2
        pop     Bmin1
        pop     Bmax1
        pop     Bmax2

        .global Amin1, Amin2, Amax1, Amax2
        .equ Amin2,-2
        .equ Amin1,-1
        .equ Amax1,0x10000
        .equ Amax2,0x10001

