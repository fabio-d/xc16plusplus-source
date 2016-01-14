        .global __reset
__reset:
        return

        .section bss_7600,bss,address(0x7600)
        .space 0x400

        .section bss_dma,bss,dma
        .space 0x2
                
