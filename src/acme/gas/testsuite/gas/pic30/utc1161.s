        .text
        .pword 0x111111
        .pword 0x222222
        nop
        .pbyte 1
        . = .+2
        .pbyte 2,3
        nop
        .pbyte 4,5
        . =  .+2
        .pbyte 6
        