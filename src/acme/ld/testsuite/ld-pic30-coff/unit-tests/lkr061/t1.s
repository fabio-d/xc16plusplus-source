        .global __reset
__reset:
        return

        .section .ybss,"b"
        .flags 0
        .flags 0x201            ; CONTENTS, ALLOC
        .space 0x2
                
