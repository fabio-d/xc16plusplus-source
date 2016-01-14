#as: --listing-cont-lines=4 --no-warn
#name: .pfill in a section with code attribute and a .const section
#source: cert0541.s

MPLAB ASM30 Listing:  .+cert0541\.s 			page 1


 2067              	           \.list
 2068              	
 2069              	           \.section \.myconst, code
 2070              	           \.fillvalue 0x12
 2071              	           \.fillupper 0x34
 2072              	           \.pfillvalue 0x56
 2073              	           
 2074              	           ;0x12 0x12 0x34 
 2075              	           ;0x12 0x12
 2076 000000  12 12 34 	           \.fill 4
 2076         12 12 
 2077              	
 2078              	           ;0x34 
 2079               34 	           \.align 2 ;Align to next p-word
 2080              	           
 2081              	           ;0x56 0x56 0x56
 2082              	           ;0x56 0x56 0x56
 2083              	           ;0x56 0x56
 2084 000004  56 56 56 	           \.pfill 8
 2084         56 56 56 
 2084         56 56 
 2085              	           
 2086              	           ;0x56
 2087               56 	           \.palign 2 ;Align to next p-word
 2088              	           \.fillvalue ;Reset fillvalue
 2089              	           \.pfillvalue ;Reset pfillvalue
 2090              	           
 2091              	           ;0x00 0x00 0x34
 2092              	           ;0x00 0x00           
 2093 00000a  00 00 34 	           \.fill 4
 2093         00 00 
 2094              	           
 2095              	           ;0x34
 2096               34 	           \.align 2 ;Align to next p-word
 2097              	           
 2098              	           ;0x00 0x00 0x00
 2099              	           ;0x00 0x00 0x00
 2100              	           ;0x00 0x00
 2101 00000e  00 00 00 	           \.pfill 8
 2101         00 00 00 
 2101         00 00 
 2102              	           
 2103              	           ;0x00
 2104               00 	           \.palign 2 ;Align to next p-word
 2105              	        
 2106              	           \.section foo0, code
 2107 000000  42 65 00 	           \.ascii   "Begin first pfill in foo0"
 2107         67 69 00 
 2107         6E 20 00 
 2107         66 69 00 
 2107         72 73 00 
 2108            00 00 	           \.pfill 0, 1, 1
 2109              	           \.pfill 1, 0, 1
 2110 00001a  00       	           \.pfill 1, 1, 0
 2111            00 00 	
 2112 00001c  42 65 00 	           \.ascii   "Begin second pfill in foo0 with all zeros"  
 2112         67 69 00 
 2112         6E 20 00 
 2112         73 65 00 
 2112         63 6F 00 
 2113            00 00 	           \.pfill 0, 0, 0
 2114              	
 2115 000046  42 65 00 	           \.ascii "Begin third pfill"
 2115         67 69 00 
 2115         6E 20 00 
 2115         74 68 00 
 2115         69 72 00 
 2116            00 00 	           \.pfill    0x0F, 4, 0x12345678
 2116 000058  78 56 34 
 2116         12 78 56 
 2116         34 12 78 
 2116         56 34 12 
 2117                  	
 2118 000080  42 65 00 	           \.ascii "Begin fourth pfill"
 2118         67 69 00 
 2118         6E 20 00 
 2118         66 6F 00 
 2118         75 72 00 
 2119 000092  FF FF FF 	           \.pfill    0xFF, 8, 0xFFFFFFFF     
 2119         FF 00 00 
 2119         00 00 FF 
 2119         FF FF FF 
 2119         00 00 00 
 2120              	   
 2121                  	           
 2122              	           \.section \.const
 2123 0000 42 65 67 69 	           \.ascii "Begin first pfill \.const"
 2123      6E 20 66 69 
 2123      72 73 74 20 
 2123      70 66 69 6C 
 2123      6C 20 2E 63 
 2124                 	           \.pfill 1
 2125 0018 42 65 67 69 	           \.ascii "Begin second pfill \.const "
 2125      6E 20 73 65 
 2125      63 6F 6E 64 
 2125      20 70 66 69 
 2125      6C 6C 20 2E 
 2126                 	           \.pfill 100
 2127                 	
 2128 0032 42 65 67 69 	           \.ascii "Begin third pfill \.const"
 2128      6E 20 74 68 
 2128      69 72 64 20 
 2128      70 66 69 6C 
 2128      6C 20 2E 63 
 2129                 	           \.pfill    0x0F, 4, 0x12345678
 2130                 	
 2131 004a 42 65 67 69 	           \.ascii "Begin fourth pfill \.const"
 2131      6E 20 66 6F 
 2131      75 72 74 68 
 2131      20 70 66 69 
 2131      6C 6C 20 2E 
 2132                 	           \.pfill    0x0F, 8, 0xA5B4C3D2  
 2133                 	
 2134 0063 42 65 67 69 	           \.ascii "Begin fifth pfill \.const"
 2134      6E 20 66 69 
 2134      66 74 68 20 
 2134      70 66 69 6C 
 2134      6C 20 2E 63 
 2135                 	           \.pfill    0x0F, 8, 0xA5B4C3D2
 2136                 	   
 2137 007b 45 6E 64 20 	           \.ascii   "End of \.const section"
 2137      6F 66 20 2E 
 2137      63 6F 6E 73 
 2137      74 20 73 65 
 2137      63 74 69 6F 
