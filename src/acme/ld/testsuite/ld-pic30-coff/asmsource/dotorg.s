           .data
           .long 0
           .long 1
           .byte 0x01
           .org . + 0x20
test:      .byte .
           .byte 0xa6
           .byte 0xa7
           .byte 0xa8
           
           .text
           .global _main
           .global __reset
_main:           
__reset:   nop
           .end
           
