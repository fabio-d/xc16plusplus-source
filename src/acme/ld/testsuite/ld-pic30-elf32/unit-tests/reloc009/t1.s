        .text
        .global __reset, part1, part2
__reset:

        bclr.b   w0,#bitLO
        bset.b   w7,#bitHI
        bclr.b   [w8],#bitLO
        bset.b   [w15],#bitHI

