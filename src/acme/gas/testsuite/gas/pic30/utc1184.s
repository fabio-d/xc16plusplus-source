        .section foo,dma
        .global data
dat:    .space 2

        .text
        .word dmaoffset(dat)
        