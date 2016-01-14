        .text
        .global _main
_main:        
        return

        .section .pbss,"b"
        .word 0x1111

        .section .pbss2,persist
        .word 0x3333

