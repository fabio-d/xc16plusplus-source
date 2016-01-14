        .extern foo
        
        .section bar,data
        .word  psvptr(foo)
        