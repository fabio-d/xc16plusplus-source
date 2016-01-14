         
           .psize 1000
           .list
        
           .section foo0, psv
           .org 0x100
foo0:      .byte 0
           .int 1
           .int paddr(foo0), paddr(const0)
           .int paddr(1f)
           .int paddr(2f)
           .int paddr(noplab)
           .int paddr(foo2)
           .int paddr(const1)   
           
           .section .const, psv
           .int paddr(foo0), paddr(const0)
           .int paddr(1f)
           .int paddr(2f)
           .int paddr(noplab)
           .int paddr(foo2)
           .int paddr(const1)              
           .byte 0x01
           .org 0xFF
const0:    .byte 0x10
           . = . + 0x20
           .byte 0x11
           
           .section foo1, psv
           .byte 0x02
           .org 0x8000
1:         .byte 0x20      
           . = . + 0x10
           .byte 0x22
           .align
           .int paddr(foo0), paddr(const0)
           .int paddr(1b)
           .int paddr(2f)
           .int paddr(noplab)
           .int paddr(foo2)
           .int paddr(const1)           
           
           .text
2:           
noplab:    nop
           
           .section foo2, psv
           .org 0
foo2:      .byte 3 
           .org . + 4
           .byte 0x33
           .byte 0x44
           .align
           .int paddr(foo0), paddr(const0)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab)
           .int paddr(foo2)
           .int paddr(const1)           
           
           .data
           .byte 0x01
           .align
           .int paddr(foo0), paddr(const0)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab)
           .int paddr(foo2)
           .int paddr(const1)           
                     
           .section .const, psv
           .byte 0x04
           .org 0x200
const1:    .byte 0x40
           .org . + 6
           .byte 0x44
           .align
           .int paddr(foo0), paddr(const0)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab)
           .int paddr(foo2)
           .int paddr(const1)
           
           .nolist
        
        
