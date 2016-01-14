
             .text
             .global __reset
__reset:     nop

             .section foo,address(0x900)
             .space 0x10

             .section bar
             .space 0x10

             .end

