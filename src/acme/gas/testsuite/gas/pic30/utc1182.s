        .section foo,dma
dat:    .space 2

        .section bar,eedata
        .word dmaoffset(dat)
        