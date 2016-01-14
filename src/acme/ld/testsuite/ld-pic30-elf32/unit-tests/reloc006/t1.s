        .text
        .global __reset, part1, part2
__reset:

        bclr    w0,#bitLO
        btsts.z w15,#bitHI

