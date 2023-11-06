        .text
        .global __reset
__reset:        
        .space 2048
        .space 14060            ; consumes 99% of program memory

        .bss
        .space 512              ; consumes 25% of data memory

        .section foo,eedata
        .space 512              ; consumes 50% of eedata memory

