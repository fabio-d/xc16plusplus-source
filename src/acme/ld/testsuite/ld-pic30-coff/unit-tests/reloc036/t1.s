        .text
        .global __reset, part1, part2
__reset:
part1:  
        do      #2,myL200
        do      #4,myL400
        do      #6,myL600
        do      #8,myL800
part2:
        do      #0x12,L1200
        do      #0x14,L1400
        do      #0x16,L1600   
        do      #0x18,L1800 

        .org (0x100)
myL200:
        .org (0x300)
myL400:
        .org (0x500)
myL600:
        .org (0x700)
myL800:
