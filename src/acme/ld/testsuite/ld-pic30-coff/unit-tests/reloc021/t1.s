        .text
        .global __reset, part1, part2
__reset:

        add     [w0],#shiftLO,A
        lac     [w0],#shiftHI,A
        sac     A,#shiftLO,[w0]
        sac.r   A,#shiftHI,[w0]
