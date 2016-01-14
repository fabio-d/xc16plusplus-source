        .text
        .ifdef __dsPIC30F
        .pword 0x563412
        .else
        .pword 0x999999
        .endif

        .end
        