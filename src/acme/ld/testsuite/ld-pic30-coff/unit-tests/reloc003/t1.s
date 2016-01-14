        .text
        .global __reset, part1, part2
__reset:

        bclr.b  t0,#bitLO
        bclr.b  t7,#bitHI

