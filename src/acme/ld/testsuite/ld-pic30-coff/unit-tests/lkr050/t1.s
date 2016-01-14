        .global __reset
__reset:
        return

        .section bss_810,bss,address(0x810)
        .space 2

        .section data_820,data,address(0x820)
        .space 2

        .section code_210,code,address(0x210)
        .space 2

        .section psv_220,psv,address(0x220)
        .space 2

        
        
