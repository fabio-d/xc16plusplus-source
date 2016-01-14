#as: --listing-cont-lines=4
#name: .byte in a section with "r" attribute and a .const section
#source: cert0420.s

MPLAB ASM30 Listing:  .+cert0420\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo,psv
 2064                 	           
 2065 0000 01 02 03 04 	foo1:      \.byte 0x1, 2, 3,4,5,6,7
 2065      05 06 07 
 2066 0007 00          	           \.align 4
 2067 0008 08 09 0A 0B 	           \.byte 8,9,0xa, 0xb
 2068                 	           \.align 2
 2069 000c 0C 0D 0E 0F 	           \.byte 0xc, 0xd, 0xe, 0xf, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
 2069      10 11 12 13 
 2069      14 15 16 17 
 2069      18 
 2070 0019 19          	foo2:      \.byte 0x19
 2071                 	
 2072 001a 00 00       	           \.section \.const,psv
 2073                 	           
 2074 0000 01 02 03 04 	const1:    \.byte 0x1, 2, 3,4,5,6,7
 2074      05 06 07 
 2075 0007 00          	           \.align 4
 2076 0008 08 09 0A 0B 	           \.byte 8,9,0xa, 0xb
 2077                 	           \.align 2
 2078 000c 0C 0D 0E 0F 	           \.byte 0xc, 0xd, 0xe, 0xf, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
 2078      10 11 12 13 
 2078      14 15 16 17 
 2078      18 
 2079 0019 19          	const2:    \.byte 0x19
 2080                 	    
