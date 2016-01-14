        .macro foo
        inc w0,w1
        .endm

        .text
        foo
        
        .macro foo
        inc2 w0,w1
        .endm

        foo
        