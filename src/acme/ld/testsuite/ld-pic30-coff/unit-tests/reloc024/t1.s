        .text
        .global __reset, part1, part2
__reset:

        lnk     #frameMIN2
        lnk     #frameMIN1
        lnk     #frameMAX1
        lnk     #frameMAX2
