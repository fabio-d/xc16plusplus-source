        .text
        .fillvalue 0xaa
        .fillupper 0xbb
        .pfillvalue 0xcc
        ;; advance the location counter to make sure
        ;; the dot expressions are relative
        .pword 0x111111, 0x222222
        nop
        . = . + 2
        nop
        .org . + 4
        nop
        .porg . + 6
        nop
        