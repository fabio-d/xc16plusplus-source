        .text
        .global _main
_main:        
        return

        .section foo,data,near,noload
        .word 0x1234
        .word 0x5678

