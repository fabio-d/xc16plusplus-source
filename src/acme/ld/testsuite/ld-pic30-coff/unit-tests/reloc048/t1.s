        .text
        .global __reset, part1, part2
__reset:

        pwrsav  #modeLO
        pwrsav  #modeHI
