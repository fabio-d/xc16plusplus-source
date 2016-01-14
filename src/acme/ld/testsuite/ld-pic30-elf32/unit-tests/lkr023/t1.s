        .text
        .global __reset
__reset:        
        mov  #foo_start,w0
        return

        .section foo,"r"
        .global foo_start
foo_start:      
        .if 1
        .space 32769            ; size limit + 1
        .else
        .space 0x7EFC           ; max size before crossing PSV boundary
        .endif

