#as: --listing-cont-lines=10 --no-warn
#name: .align does not always align correctly when using the max-skip parameter
#source: ssr22234.s

MPLAB ASM30 Listing:  .+ssr22234.s 			page 1


   1              	
   2              	        
   3              	             \.section foo_r0, "r"
   4 0000 00 00 00 00 	r_foo0:      \.space 9
   4      00 00 00 00 
   4      00 
   5                 	             
   6                 	             ; \.align when already at multiple should result in no action\.
   7                 	             
   8 0009 12 12 12    	             \.align 4, 0x12, 6
   9 000c 00          	r_foo1:      \.space 1
  10                 	
  11                 	
  12 000d 00 00 00    	             \.section foo_r1, "r"
  13 0000 00 00 00 00 	r_foo2:      \.space 9
  13      00 00 00 00 
  13      00 
  14                 	             
  15                 	             ; \.align when already at multiple should result in no action\.
  16                 	             
  17 0009 12 12 12    	             \.align 4, 0x12, 3
  18 000c 00          	r_foo3:      \.space 1
  19                 	
  20                 	                  
  21 000d 00 00 00    	          \.end
