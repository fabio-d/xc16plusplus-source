        .text
        .global __reset
__reset:        
        .space 2048
        .space 14070            ; also try 14070, 14080, 14090

        .bss
        .space 512

        .section foo,eedata
        .space 512

