
        .text
        .global part1,part2
part1:
        .long   0x10
        .long   0x2120
        .long   0x43424140
part2:  
        .long   paddr(L10)
        .long   paddr(L2120)
        .long   paddr(L43424140)
    
        