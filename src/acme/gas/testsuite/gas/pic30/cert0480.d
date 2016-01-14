#as: --listing-cont-lines=4 --no-warn
#name: .int in a section with "r" attribute and a .const section
#source: cert0480.s

MPLAB ASM30 Listing:  .*cert0480.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo, "r"
 2064 0000 00 00 00 00 	           \.int 1-1, 0-0, -1\+1
 2064      00 00 00 00 
 2064      00 00 00 00 
 2065 000c FF FF FF FF 	           \.int 0xFFFFFFFE\+1, 1\+0xFFFFFFFE
 2065      FF FF FF FF 
 2066 0014 00 00 00 00 	           \.int 0xFFFFFFFF - 0xFFFFFFFF
 2067 0018 FF 00 00 00 	           \.int 0xFF
 2068 001c 00 01 00 00 	           \.int 0xFF \+ 1  
 2069 0020 FF FF 00 00 	           \.int 0xFFFF
 2070 0024 00 00 01 00 	           \.int 0xFFFF \+ 1   
 2071 0028 FF FF FF 00 	           \.int 0xFFFFFF
 2072 002c 00 00 00 01 	           \.int 0xFFFFFF \+ 1 
 2073 0030 FE FF FF 00 	           \.int 0xFFFFFF - 1
 2074 0034 FF FF FF FF 	           \.int 0xFFFFFFFF
 2075 0038 AA AA AA AA 	           \.fill 5, 1, 0xAA
 2075      AA 
 2076 003d 04 00 00 00 	           \.int 1\+3, 0xFF\+0x01, paddr\(main\) - 2
 2076      00 01 00 00 
 2076      FE FF FF FF 
 2077 0049 FF FF FF FF 	           \.int -1
 2078 004d FF FF FF FF 	           \.int 0xFFFFFFFFF
 2079 0051 BB 00 BB 00 	           \.fill 2, 2, 0xBB
 2080 0055 00 00 00 00 	           \.int 0x100000000
 2081 0059 FF FF FF FF 	           \.int 0xFFFFFFFFFF
 2082 005d 00 00 00 00 	           \.int 0x1000000000
 2083 0061 01 00 00 00 	           \.int 0x000000000001
 2084 0065 90 78 56 34 	           \.int 0x1234567890
 2085 0069 00 00 00 00 	           \.int  0
 2086 006d FF 00 00 00 	           \.int  255
 2087 0071 CC 00 00 CC 	           \.fill 4, 3, 0xCC   
 2087      00 00 CC 00 
 2087      00 CC 00 00 
 2088 007d 00 01 00 00 	           \.int  256
 2089 0081 E8 03 00 00 	           \.int 1000
 2090 0085 FB 09 00 00 	           \.int 2555
 2091 0089 FF 7F 00 00 	           \.int 32767
 2092 008d FF FF 00 00 	           \.int 65535
 2093 0091 00 00 00 00 	           \.int 0
 2094 0095 FF 00 00 00 	           \.int 0xFF
 2095 0099 00 01 00 00 	           \.int 0x100
 2096 009d E8 03 00 00 	           \.int 0x3E8
 2097 00a1 FB 09 00 00 	           \.int 0x9FB
 2098 00a5 FF 7F 00 00 	           \.int 0x7FFF
 2099 00a9 CC CC CC CC 	           \.fill 4, 1, 0xCC      
 2100 00ad FF FF 00 00 	           \.int 0xFFFF   
 2101                 	
 2102 00b1 AC          	ftest1:    \.byte 0xAC
 2103 00b2 EE 00 00 00 	           \.fill 5, 4, 0xEE
 2103      EE 00 00 00 
 2103      EE 00 00 00 
 2103      EE 00 00 00 
 2103      EE 00 00 00 
 2104                 	
 2105                 	           \.section \.const, \"r\"
 2106 0000 00 00 00 00 	           \.int 1-1, 0-0, -1\+1
 2106      00 00 00 00 
 2106      00 00 00 00 
 2107 000c FF FF FF FF 	           \.int 0xFFFFFFFE\+1, 1\+0xFFFFFFFE
 2107      FF FF FF FF 
 2108 0014 00 00 00 00 	           \.int 0xFFFFFFFF - 0xFFFFFFFF
 2109 0018 FF 00 00 00 	           \.int 0xFF
 2110 001c 00 01 00 00 	           \.int 0xFF \+ 1  
 2111 0020 FF FF 00 00 	           \.int 0xFFFF
 2112 0024 00 00 01 00 	           \.int 0xFFFF \+ 1   
 2113 0028 FF FF FF 00 	           \.int 0xFFFFFF
 2114 002c 00 00 00 01 	           \.int 0xFFFFFF \+ 1 
 2115 0030 FE FF FF 00 	           \.int 0xFFFFFF - 1
 2116 0034 FF FF FF FF 	           \.int 0xFFFFFFFF
 2117 0038 AA AA AA AA 	           \.fill 5, 1, 0xAA
 2117      AA 
 2118 003d 04 00 00 00 	           \.int 1\+3, 0xFF\+0x01, paddr\(main\) - 2
 2118      00 01 00 00 
 2118      FE FF FF FF 
 2119 0049 FF FF FF FF 	           \.int -1
 2120 004d FF FF FF FF 	           \.int 0xFFFFFFFFF
 2121 0051 BB 00 BB 00 	           \.fill 2, 2, 0xBB
 2122 0055 00 00 00 00 	           \.int 0x100000000
 2123 0059 FF FF FF FF 	           \.int 0xFFFFFFFFFF
 2124 005d 00 00 00 00 	           \.int 0x1000000000
 2125 0061 01 00 00 00 	           \.int 0x000000000001
 2126 0065 90 78 56 34 	           \.int 0x1234567890
 2127 0069 00 00 00 00 	           \.int  0
 2128 006d FF 00 00 00 	           \.int  255
 2129 0071 CC 00 00 CC 	           \.fill 4, 3, 0xCC   
 2129      00 00 CC 00 
 2129      00 CC 00 00 
 2130 007d 00 01 00 00 	           \.int  256
 2131 0081 E8 03 00 00 	           \.int 1000
 2132 0085 FB 09 00 00 	           \.int 2555
 2133 0089 FF 7F 00 00 	           \.int 32767
 2134 008d FF FF 00 00 	           \.int 65535
 2135 0091 00 00 00 00 	           \.int 0
 2136 0095 FF 00 00 00 	           \.int 0xFF
 2137 0099 00 01 00 00 	           \.int 0x100
 2138 009d E8 03 00 00 	           \.int 0x3E8
 2139 00a1 FB 09 00 00 	           \.int 0x9FB
 2140 00a5 FF 7F 00 00 	           \.int 0x7FFF
 2141 00a9 CC CC CC CC 	           \.fill 4, 1, 0xCC      
 2142 00ad FF FF 00 00 	           \.int 0xFFFF   
 2143                 	
 2144 00b1 AC          	ctest1:    \.byte 0xAC
 2145 00b2 EE 00 00 00 	           \.fill 5, 4, 0xEE
 2145      EE 00 00 00 
 2145      EE 00 00 00 
 2145      EE 00 00 00 
 2145      EE 00 00 00 
 2146                 	
