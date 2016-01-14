           .nolist

           .psize 1000
           .list

           .pfillvalue 0x56
           .fillupper  0x34
           .fillvalue  0x12
           
           .section foo0, psv
           .space 2,0                   
           
           .org 0x100
           
           .space 2,0        
           .space 200        
                     
           .space 100, 1
           .space  200, 0x80 
skipme1f:  .space 1

skipme2f:  .space 2
skipme100f:.space 100
skipme0f:  .space 0, 0xff
skipme255f:.space 255       
skipme24bf:.space 0xFFFFFF, 0x7f

           .text
           nop
           .data
           .byte 1

           .section .const, psv
           .space 2,0                   
                    
           .space 2,0        
           .space 200, 1
           .space 100, 0x2        
           
           .org 0x400
           
           .space  200, 0x80

skipme1c:  .space 1, 0xFF
skipme2c:  .space 2
           
skipme100c:.space 100
skipme0c:  .space 0
skipme255c:.space 255, 0x12

skipme16bc:.space 0xFFFF
skipme24bc:.space 0xFFFFFF

           .data
           .byte 1
           .text
           nop
           
