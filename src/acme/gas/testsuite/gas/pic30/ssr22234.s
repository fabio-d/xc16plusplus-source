
        
             .section foo_r0, "r"
r_foo0:      .space 9
             
             ; .align when already at multiple should result in no action.
             
             .align 4, 0x12, 6
r_foo1:      .space 1


             .section foo_r1, "r"
r_foo2:      .space 9
             
             ; .align when already at multiple should result in no action.
             
             .align 4, 0x12, 3
r_foo3:      .space 1

                  
          .end
 
