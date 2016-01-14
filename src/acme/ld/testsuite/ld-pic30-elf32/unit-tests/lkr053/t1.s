        .global __reset
__reset:
        return

        .section bss_1000,bss,address(0x1000)
        .space 0x1000

        .section bss_ymem,bss,ymemory
        .space 0x2
                
