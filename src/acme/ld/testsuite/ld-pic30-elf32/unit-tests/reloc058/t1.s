        .text
        .global __reset, part1
__reset:
part1:  
        add.b   b800
        addc.b  b801
        and.b   b802
        ior.b   b803
        subr.b  b804
        subbr.b b805
        sub.b   b806
        subb.b  b807
        xor.b   b808

        .bss
b800:   .skip   1
b801:   .skip   1
b802:   .skip   1
b803:   .skip   1
b804:   .skip   1
b805:   .skip   1
b806:   .skip   1
b807:   .skip   1
b808:   .skip   1
