        .global __reset
__reset:
        return

        .section bss_800,bss,address(0x800)
        .space 0x2

        .section bss_align800,bss,align(0x800)
        .space 0x2
                
