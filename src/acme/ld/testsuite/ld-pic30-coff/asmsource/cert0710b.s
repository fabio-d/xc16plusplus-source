         
           .psize 1000
           .list
        
           .section foo0, "r"
           .org 0x02
           .global foo0_b
foo0_b:    .byte 0
           .int 1
           .int paddr(foo0_a), paddr(const0_a)
           .int paddr(1f)
           .int paddr(2f)
           .int paddr(noplab_a)
           .int paddr(foo2_a)
           .int paddr(const1_a)
           
           .int paddr(foo0_b), paddr(const0_b)
           .int paddr(1f)
           .int paddr(2f)
           .int paddr(noplab_b)
           .int paddr(foo2_b)
           .int paddr(const1_b)   
           
           .section .const, "r"
           .int paddr(foo0_a), paddr(const0_a)
           .int paddr(1f)
           .int paddr(2f)
           .int paddr(noplab_a)
           .int paddr(foo2_a)
           .int paddr(const1_a)   
           
           .int paddr(foo0_b), paddr(const0_b)
           .int paddr(1f)
           .int paddr(2f)
           .int paddr(noplab_b)
           .int paddr(foo2_b)
           .int paddr(const1_b)              
           
           .byte 0x01
           .org . + 0x10
const0_b:  .byte 0x10
           .global const0_b
           . = . + 0x20
           .byte 0x11
           
           .section foo1, "r"
           .byte 0x02
           .org 0x8000
1:         .byte 0x20      
           . = . + 0x10
           .byte 0x22
           .int paddr(foo0_a), paddr(const0_a)
           .int paddr(1b)
           .int paddr(2f)
           .int paddr(noplab_a)
           .int paddr(foo2_a)
           .int paddr(const1_a)         
           
           .int paddr(foo0_b), paddr(const0_b)
           .int paddr(1b)
           .int paddr(2f)
           .int paddr(noplab_b)
           .int paddr(foo2_b)
           .int paddr(const1_b)              
           
           .text
2:           
noplab_b:  nop
           .global noplab_b
           
           .section foo2, "r"
           .org 0
foo2_b:    .byte 3 
           .global foo2_b
           .org . + 4
           .byte 0x33
           .int paddr(foo0_a), paddr(const0_a)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab_a)
           .int paddr(foo2_a)
           .int paddr(const1_a)     
           .int paddr(foo0_b), paddr(const0_b)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab_b)
           .int paddr(foo2_b)
           .int paddr(const1_b)              
           
           .data
           .byte 0x01
           .int paddr(foo0_a), paddr(const0_a)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab_a)
           .int paddr(foo2_a)
           .int paddr(const1_a)    
           .int paddr(foo0_b), paddr(const0_b)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab_b)
           .int paddr(foo2_b)
           .int paddr(const1_b)              
                     
           .section .const, "r"
           .byte 0x04
           .org . + 0x20
const1_b:  .byte 0x40
           .org . + 6
           .byte 0x44
           .int paddr(foo0_a), paddr(const0_a)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab_a)
           .int paddr(foo2_a)
           .int paddr(const1_a)
           .global const1_b
           .int paddr(foo0_b), paddr(const0_b)
           .int paddr(1b)
           .int paddr(2b)
           .int paddr(noplab_b)
           .int paddr(foo2_b)
           .int paddr(const1_b)              
           
           .nolist
        
        
