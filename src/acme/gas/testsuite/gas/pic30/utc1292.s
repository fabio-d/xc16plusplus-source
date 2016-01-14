        .extern foo
        
        .section bar,data
        .long  psvptr(foo)
        