        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        add     [w0],#shift0,A
        lac     [w0],#shift2,A
        sac     A,#shift4,[w0]
        sac.r   A,#shift6,[w0]
        add     [w0],#shift0,B
        lac     [w0],#shiftN2,B
        sac     B,#shiftN4,[w0]
        sac.r   B,#shiftN6,[w0]
part2:          
        add     [w0],#myshift0,A
        lac     [w0],#myshift2,A
        sac     A,#myshift4,[w0]
        sac.r   A,#myshift6,[w0]
        add     [w0],#myshift0,B
        lac     [w0],#myshiftN2,B
        sac     B,#myshiftN4,[w0]
        sac.r   B,#myshiftN6,[w0]

        .equ    myshift0,0
        .equ    myshift2,2
        .equ    myshift4,4
        .equ    myshift6,6
        .equ    myshiftN2,-2
        .equ    myshiftN4,-4
        .equ    myshiftN6,-6
