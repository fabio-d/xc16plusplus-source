        .text
        .global __reset
__reset:        
        .word handle(foo)
        .word handle(bar)

foo:    return
bar:    return


