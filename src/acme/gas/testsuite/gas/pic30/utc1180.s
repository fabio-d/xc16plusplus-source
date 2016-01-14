        .section foo,dma
dat:    .space 2

        .text
        .word dmaoffset(dat)
        