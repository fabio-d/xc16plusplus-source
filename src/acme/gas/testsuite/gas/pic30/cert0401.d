#as: --listing-cont-lines=10 --no-warn
#name: .align in section with "r" attribute, ignored
#source: cert0401.s

MPLAB ASM30 Listing:  .+cert0401\.s 			page 1


   1              	
 2062              	             \.list
 2063              	        
 2064              	             \.section foo_r,psv
 2065 0000 00 00 00    	r_foo0:      \.space 3
 2066 0003 00 00 00 00 	             \.space 6
 2066      00 00 
 2067                 	             
 2068                 	             ; \.align when the max-skip exactly what is required for
 2069                 	             ; the alignment\.  The alignment should take place\.             
 2070                 	             
 2071 0009 12 12 12    	             \.align 4, 0x12, 3
 2072 000c 00          	r_foo1:      \.space 1
 2073 000d 00 00 00 00 	             \.space 0xFE
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2073      00 00 00 00 
 2074                 	             
 2075                 	             ; \.align with a fill argument but no max-skip argument\.
 2076 010b 34 34 34 34 	             \.align 0x10, 0x34
 2076      34 
 2077 0110 00          	r_foo2:      \.space 1
 2078 0111 00 00 00 00 	             \.space 8
 2078      00 00 00 00 
 2079                 	             
 2080                 	             ; \.align when the max-skip is one less than what would be required for
 2081                 	             ; the alignment\.  The alignment should _not_ take place\.
 2082                 	             \.align 0x200, 0x56, 0xE6
 2083 0119 00          	r_foo3:      \.space 1
 2084 011a A5          	             \.byte 0xa5
 2085                 	             
 2086                 	             ; Test \.align interaction with prior \.fillvalue directive\.
 2087                 	             \.fillvalue 0x78
 2088 011b 00 00 00 00 	             \.align 0x10
 2088      00 
 2089 0120 00          	r_foo4:      \.space 1
 2090 0121 A6          	             \.byte 0xa6
 2091                 	             
 2092 0122 9A 9A 9A 9A 	             \.align 0x8000, 0x9A, 0
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2092      9A 9A 9A 9A 
 2093 8000 00          	r_foo5:      \.space 1
 2094 8001 A7          	             \.byte 0xa7
 2095                 	             
 2096                 	
