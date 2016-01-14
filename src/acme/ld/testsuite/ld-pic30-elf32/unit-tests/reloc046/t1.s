        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        pwrsav  #mode0
        pwrsav  #mode1
part2:          
        pwrsav  #mymode0
        pwrsav  #mymode1

        .equ    mymode0,0
        .equ    mymode1,1
