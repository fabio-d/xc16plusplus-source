        .text
        .global __reset
__reset:
        nop

        .section foo,"r"
        .space 0x1000

        .section fee,"r"
        .space 0x8000
        
