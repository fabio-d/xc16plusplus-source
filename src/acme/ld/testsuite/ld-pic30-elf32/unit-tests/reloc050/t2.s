
        .text
        .global part1,part2
part1:
        .pword   0x10
        .pword   0x2120
        .pword   0x43424140
part2:  
        .pword   paddr(L10)
        .pword   paddr(L2120)
        .pword   paddr(L43424140)
    
        