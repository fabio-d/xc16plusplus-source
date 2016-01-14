#as: --listing-cont-lines=4 --no-warn
#name: .palign in a section with code attribute and a .const section
#source: cert0521.s

MPLAB ASM30 Listing:  .+cert0521\.s 			page 1


   1              	         
   2              	           \.psize 1000
   3              	           \.list
   4              	        
   5              	           \.section foo0, code
   6 000000  01       	           \.byte 1
   7            00 00 	           \.palign 2
   8 000002  02       	           \.byte 2
   9            00 00 	           
  10              	           \.section \.const
  11 0000 03          	           \.byte 3
  12                 	           \.palign 4
  13 0001 00 04       	           \.byte 4         
  14                 	
  15                 	           \.section foo1, code
  16 000000  05       	           \.byte 5
  17            00 00 	           \.palign 0x100
  17 000002  00 00 00 
  17         00 00 00 
  17         00 00 00 
  17         00 00 00 
  18 000100  06       	           \.byte 6         
  19            00 00 	
  20 000102  00 00 00 	           \.text
  20         00 00 00 
  20         00 00 00 
  20         00 00 00 
  20         00 00 00 
  21 000000  07       	           \.byte 7
  22            00 00 	           \.palign 0x100
  22 000002  00 00 00 
  22         00 00 00 
  22         00 00 00 
  22         00 00 00 
  23 000100  08       	           \.byte 8
  24            00 00 	           
  25 000102  00 00 00 	           \.section foo2, code
  25         00 00 00 
  25         00 00 00 
  25         00 00 00 
  25         00 00 00 
  26 000000  09       	           \.byte 9
  27            A5 A5 	           \.palign 0x1000, 0xa5
  27 000002  A5 A5 A5 
  27         A5 A5 A5 
  27         A5 A5 A5 
  27         A5 A5 A5 
  28 001000  0A       	           \.byte 10
  29              	           \.palign 0x8, 0xa5, 0x2 ; fill with 0xA5, skip up to 2 bytes
  30            00 00 	           \.byte 15           
  30 001002  0F 
  31            00 00 	
  32              	           \.data
  33 0000 0B          	           \.byte 11
  34 0001 0C          	           \.byte 12           
  35                 	        
  36                 	           \.section \.const
  37 0003 0D          	           \.byte 13
  38                 	           \.palign 0x2
  39 0004 0E          	           \.byte 14        
  40                 	           \.palign 0x8, 0xa5, 0x2 ; fill with 0xA5, skip up to 2 bytes
  41 0005 00 0F       	           \.byte 15
  42                 	
  43                 	           
  44                 	           \.nolist
  45                 	        
  46 0007 00          	        
