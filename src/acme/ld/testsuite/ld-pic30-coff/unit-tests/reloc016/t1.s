        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        sftac   A,#shift0
        sftac   A,#shift2
        sftac   A,#shift4
        sftac   A,#shift6
        sftac   A,#shift8
        sftac   B,#shift0
        sftac   B,#shiftN2
        sftac   B,#shiftN4
        sftac   B,#shiftN6
        sftac   B,#shiftN8
part2:          
        sftac   A,#myshift0
        sftac   A,#myshift2
        sftac   A,#myshift4
        sftac   A,#myshift6
        sftac   A,#myshift8
        sftac   B,#myshift0
        sftac   B,#myshiftN2
        sftac   B,#myshiftN4
        sftac   B,#myshiftN6
        sftac   B,#myshiftN8

        .equ    myshift0,0
        .equ    myshift2,2
        .equ    myshift4,4
        .equ    myshift6,6
        .equ    myshift8,8
        .equ    myshiftN2,-2
        .equ    myshiftN4,-4
        .equ    myshiftN6,-6
        .equ    myshiftN8,-8
