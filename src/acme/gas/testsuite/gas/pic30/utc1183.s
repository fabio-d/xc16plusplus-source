        .section foo,bss
dat:    .space 2

        .text
        .word dmaoffset(dat)
        