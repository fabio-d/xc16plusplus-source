        .global __reset
__reset:
        return

        .section .const,"r"
        .flags 0
        .flags 0x213            ; CONTENTS, ALLOC, LOAD, READONLY
        .word 0x1234
        