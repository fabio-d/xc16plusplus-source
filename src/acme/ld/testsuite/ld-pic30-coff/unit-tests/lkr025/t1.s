        .text
        .global __reset
__reset:
        .word psvoffset(L1)
        .word L1

        .section foo,"r"
        .global L1
L1:     .word 0x1111
