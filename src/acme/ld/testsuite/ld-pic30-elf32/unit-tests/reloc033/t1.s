        .text
        .global __reset, part1, part2
__reset:
part1:  
        bra     myL200
        bra     myL400
        bra     myL600
        bra     myL800
part2:
        bra     C,L1200
        bra     Z,L1400
        bra     N,L1600   
        bra     GT,L1800 

        .org (0x100)
myL200:
        .org (0x300)
myL400:
        .org (0x500)
myL600:
        .org (0x700)
myL800:
        