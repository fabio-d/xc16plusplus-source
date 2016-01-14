        .text
        .global __reset, part1, part2
__reset:
        nop
part1:
        lnk     #frame0
        lnk     #frame20
        lnk     #frame40
        lnk     #frame60          
part2:          
        lnk     #myframe0
        lnk     #myframe20
        lnk     #myframe40
        lnk     #myframe60          

        .equ    myframe0,0
        .equ    myframe20,0x20
        .equ    myframe40,0x40
        .equ    myframe60,0x60
