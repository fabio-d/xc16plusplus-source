        .text
        .global __reset, part1, part2

__reset:
        .equ    L200,0x200
        .equ    L400,0x400
        .equ    L600,0x600
        .equ    L800,0x800      

        .equ    LL200,0x200
        .equ    LL400,0x400
        .equ    LL600,0x600
        .equ    LL800,0x800        
part1:          
        do      #loop200,L200
        do      #loop400,L400
        do      #loop600,L600
        do      #loop800,L800
part2:          
        do      #myloop200,LL200
        do      #myloop400,LL400
        do      #myloop600,LL600
        do      #myloop800,LL800

        .equ    myloop200,0x200
        .equ    myloop400,0x400
        .equ    myloop600,0x600
        .equ    myloop800,0x800

