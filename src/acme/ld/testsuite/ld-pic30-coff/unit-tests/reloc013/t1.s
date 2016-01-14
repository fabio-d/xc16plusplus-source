        .text
        .global __reset, part1
__reset:
        .equ    myL200,0x200
        .equ    myL400,0x400
        .equ    myL600,0x600
        .equ    myL800,0x800
part1:  
        do      #2,myL200
        do      #4,myL400
        do      #6,myL600
        do      #8,myL800
