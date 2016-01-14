#as: --no-warn  --listing-cont-lines=2
#name: .align in section with "r" attribute
#source: cert0400.s

.*Listing:  .*cert0400\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo, "r"
 2064 0000 00 00 00    	foob1:     \.space 3
 2065 0003 00 00 00 00 	           \.space 6
 2065      00 00 
 2066 0009 00 00 00    	           \.align 4
 2067 000c 00          	algn4:     \.space 1
 2068 000d 00 00 00 00 	           \.space 0xFE
 2068      00 00 00 00 
 2068      00 00 00 00 
 2069 010b 00 00 00 00 	           \.align 0x10
 2069      00 
 2070 0110 00          	algn0x10:  \.space 1
 2071 0111 00 00 00 00 	           \.space 7
 2071      00 00 00 
 2072                 	           \.align 2
 2073 0118 00          	algn2:     \.space 1
 2074                 	               
