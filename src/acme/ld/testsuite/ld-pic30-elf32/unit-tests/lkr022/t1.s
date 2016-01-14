        .text
        .global __reset
__reset:
        .space 0x7800

        .section foo,"r"
        .space 0x1000
