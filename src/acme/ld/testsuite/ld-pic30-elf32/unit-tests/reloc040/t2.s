
        .text
        .global part1,part2
part1:
        .long   0x222120
        .long   0x43424140
part2:  
        goto    L222120
        goto    L43424140

        .global	L43424140
	.section	.const4,"x"
L43424140:
	.long	0x43424140

    
        