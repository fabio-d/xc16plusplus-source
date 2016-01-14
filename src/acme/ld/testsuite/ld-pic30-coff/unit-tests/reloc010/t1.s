        .text
        .global __reset, part1, part2
__reset:
        .equ    myL200,0x200
        .equ    myL400,0x400
        .equ    myL600,0x600
        .equ    myL800,0x800
        .equ    myL1200,0x1200
        .equ    myL1400,0x1400
        .equ    myL1600,0x1600
        .equ    myL1800,0x1800
part1:  
        bra     myL200
        bra     myL400
        bra     myL600
        bra     myL800
part2:
        bra     C,myL1200
        bra     Z,myL1400
        bra     N,myL1600   
        bra     GT,myL1800  
