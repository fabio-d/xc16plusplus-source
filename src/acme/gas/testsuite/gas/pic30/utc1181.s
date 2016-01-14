        .section foo,dma
dat:    .space 2

        .data
        .word dmaoffset(dat)
        