        .text
        .global __reset
__reset:        
        .word handle(foo)
        .global foo
foo:    
        nop
                