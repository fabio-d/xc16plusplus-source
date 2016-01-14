        .text
        .global __reset, part1
__reset:
part1:  
        add     b800
        and     b802
        subr    b804
        sub     b806
        xor     b808

        .bss
b800:   .skip   2
b802:   .skip   2
b804:   .skip   2
b806:   .skip   2
b808:   .skip   2
