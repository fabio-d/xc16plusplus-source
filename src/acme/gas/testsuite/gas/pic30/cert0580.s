           .nolist

           .psize 1000
           .list

           .pfillvalue 0x56
           .fillupper  0x34
           .fillvalue  0x12
           
           .section foo0, psv
           .skip 2,0                   
           
           .org 0x100
           
           .skip 2,0        
           .skip 200        
                     
           .skip 100        
           .skip  200        
skipme1f:  .skip 1
skipme2f:  .skip 2
skipme100f:.skip 100
skipme0f:  .skip 0
skipme255f:.skip 255       
skipme24bf:.skip 0xFFFFFF

           .text
           nop
           .data
           .byte 1

           .section .const, psv     
           .skip 2,0                   
                    
           .skip 2,0        
           .skip 200        
           .skip 100        
           
           .org 0x400
           
           .skip  200        

skipme1c:  .skip 1
skipme2c:  .skip 2
skipme100c:.skip 100
skipme0c:  .skip 0
skipme255c:.skip 255
skipme16bc:.skip 0xFFFF
skipme24bc:.skip 0xFFFFFF

           .data
           .byte 1
           .text
           nop
           
