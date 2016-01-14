        .global __reset
__reset:
        return

        .section foo
        .flags 0
        .attribute psv
        .space 2
       
        .section .const,"r"
        .word 0x1234
        