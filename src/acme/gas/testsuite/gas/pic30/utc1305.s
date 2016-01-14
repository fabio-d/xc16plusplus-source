        .data
        .byte 0x11, 0x22, 0x33

        .pushsection foo,code
        .pword 0xccbbaa

        .pushsection bar,bss
        .space 16

        .popsection
        .pword 0xffeedd
        
        .popsection
        .byte 0x44, 0x55, 0x66
