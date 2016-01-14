        .text
        .global __reset, part1
__reset:
part1:  
        mov     w0,w800
        mov     w2,w802
        mov     w4,w804
        mov     w6,w806
        mov     w8,w808

        .bss
w800:   .skip   2
w802:   .skip   2
w804:   .skip   2
w806:   .skip   2
w808:   .skip   2
