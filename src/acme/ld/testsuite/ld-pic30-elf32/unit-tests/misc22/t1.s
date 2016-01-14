        .global __reset
__reset:
        nop

        .bss
        .space 32768

        .section foo,psv
        .word 0x1122
