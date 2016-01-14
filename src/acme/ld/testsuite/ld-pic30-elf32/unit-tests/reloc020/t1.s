        .text
        .global __reset, part1, part2
__reset:
        nop
part1:          
        add     [w0],#shiftLO,A
        lac     [w0],#shiftHI,A
        sac     A,#shiftLO,[w0]
        sac.r   A,#shiftHI,[w0]
part2:          
        add     [w0],#myshiftLO,A
        lac     [w0],#myshiftHI,A
        sac     A,#myshiftLO,[w0]
        sac.r   A,#myshiftHI,[w0]

        .equ    myshiftLO,-8
        .equ    myshiftHI,7
