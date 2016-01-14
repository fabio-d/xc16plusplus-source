        .text
        .global __reset
__reset:
        bra     0x102
here:
        bra     0x10102
there:  
        .space 0xFFFE
everywhere:
        bra     0x104
        bra     0x10104
        