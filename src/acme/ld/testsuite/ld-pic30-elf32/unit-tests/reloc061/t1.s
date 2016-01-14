        .text
        .global __reset, part1
__reset:
part1:  
        pop     w800
        pop     w802
        pop     w804
        pop     w806
        pop     w808

        .bss
w800:   .skip   2
w802:   .skip   2
w804:   .skip   2
w806:   .skip   2
w808:   .skip   2
