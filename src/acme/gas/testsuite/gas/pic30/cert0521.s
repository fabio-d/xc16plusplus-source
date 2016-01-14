         
           .psize 1000
           .list
        
           .section foo0, code
           .byte 1
           .palign 2
           .byte 2
           
           .section .const
           .byte 3
           .palign 4
           .byte 4         

           .section foo1, code
           .byte 5
           .palign 0x100
           .byte 6         

           .text
           .byte 7
           .palign 0x100
           .byte 8
           
           .section foo2, code
           .byte 9
           .palign 0x1000, 0xa5
           .byte 10
           .palign 0x8, 0xa5, 0x2 ; fill with 0xA5, skip up to 2 bytes
           .byte 15           

           .data
           .byte 11
           .byte 12           
        
           .section .const
           .byte 13
           .palign 0x2
           .byte 14        
           .palign 0x8, 0xa5, 0x2 ; fill with 0xA5, skip up to 2 bytes
           .byte 15

           
           .nolist
        
        
