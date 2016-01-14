         
           .psize 1000
           .list
        
           .section foo0, psv
           .byte 1
           .palign 2
           .byte 2
           
           .section .const, psv
           .byte 3
           .palign 0
           .byte 4         

           .section foo1, psv
           .byte 5
           .palign 0x100
           .byte 6         

           .text
           .byte 7
           .palign 0x100
           .byte 8
           
           .section foo2, psv
           .byte 9
           .palign 0x1000
           .byte 10     

           .data
           .byte 11
           .palign 0x10
           .byte 12           
        
           .section .const, psv
           .byte 13
           .palign 0x2
           .byte 14                 

           
           .nolist
        
        
