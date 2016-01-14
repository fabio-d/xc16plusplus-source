        .text
        .ifdef __PIC24H
        .pword 0x563412
        .else
        .pword 0x999999
        .endif

        .end
        