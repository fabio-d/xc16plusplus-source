        .global __reset
__reset:
        return

        .section data_merge,data,merge(2)
        .word 0x1234, 0x5678
        
                
