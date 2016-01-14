        .text
        .global __reset
__reset:        
        .space 0x4000
        
        .section *,eedata
        .space 0x400

        .section *,bss
        .space 0x10

