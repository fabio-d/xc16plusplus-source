        .global __reset
__reset:
        return

        .section bss_1000,bss,address(0x1000)
        .space 0x2

        .section bss_rev1000,bss,reverse(0x1000)
        .space 0x2
                
