            .text
            .global __reset
__reset:
             push foo
             pop foo
             
             mov.w w0, foo
             mov.w foo, w0
             
             .end
             
