#as: --listing-cont-lines=4 --no-warn
#name: .hword in a section with "r" attribute and a .const section
#source: cert0470.s

MPLAB ASM30 Listing:  .*/gas/pic30/cert0470\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo, \"r\"
 2064                 	
 2065 0000 34 12       	fhwd1:     \.hword   0x1234
 2066 0002 DC FE       	fhwd2:     \.hword   0xFEDC
 2067 0004 F0 C3       	fhwd3:     \.hword   0b1100001111110000
 2068 0006 EE EE EE EE 	           \.fill 5, 1, 0xEE
 2068      EE 
 2069 000b FF FF       	fhwd1a:    \.hword   0xFFFF
 2070 000d FE FF       	fhwd1b:    \.hword   0xFFFE
 2071 000f FD FF       	fhwd1c:    \.hword   0xFFFD
 2072 0011 FC FF       	fhwd1d:    \.hword   0xFFFC
 2073 0013 FB FF       	fhwd1e:    \.hword   0xFFFB
 2074 0015 FA FF       	fhwd1f:    \.hword   0xFFFA
 2075 0017 AC          	ftest1:    \.byte 0xAC
 2076 0018 EE 00 00 00 	           \.fill 5, 4, 0xEE
 2076      EE 00 00 00 
 2076      EE 00 00 00 
 2076      EE 00 00 00 
 2076      EE 00 00 00 
 2077 002c 75 74 63 32 	           \.hword 0x7475, 0x3263, 0x3532
 2077      32 35 
 2078 0032 75 74 63 32 	           \.hword 0x7475, 0x3263, 0x3632
 2078      32 36 
 2079 0038 75 74 63 32 	           \.hword 0x7475, 0x3263, 0x3732
 2079      32 37 
 2080 003e 00 00       	           \.hword \(0xFFFF\+1\)
 2081 0040 FF 7F       	           \.hword \(-32768-1\)
 2082 0042 FF FF       	           \.hword 0xFFFF
 2083 0044 00 80       	           \.hword -32768   
 2084                 	
 2085                 	           \.section \.const, \"r\"
 2086 0000 34 12       	chwd1:     \.hword   0x1234
 2087 0002 DC FE       	chwd2:     \.hword   0xFEDC
 2088 0004 F0 C3       	chwd3:     \.hword   0b1100001111110000
 2089 0006 EE EE EE EE 	           \.fill 5, 1, 0xEE
 2089      EE 
 2090 000b FF FF       	chwd1a:    \.hword   0xFFFF
 2091 000d FE FF       	chwd1b:    \.hword   0xFFFE
 2092 000f FD FF       	chwd1c:    \.hword   0xFFFD
 2093 0011 FC FF       	chwd1d:    \.hword   0xFFFC
 2094 0013 FB FF       	chwd1e:    \.hword   0xFFFB
 2095 0015 FA FF       	chwd1f:    \.hword   0xFFFA
 2096 0017 AC          	ctest1:    \.byte 0xAC
 2097 0018 EE 00 00 00 	           \.fill 5, 4, 0xEE
 2097      EE 00 00 00 
 2097      EE 00 00 00 
 2097      EE 00 00 00 
 2097      EE 00 00 00 
 2098 002c 75 74 63 32 	           \.hword 0x7475, 0x3263, 0x3532
 2098      32 35 
 2099 0032 75 74 63 32 	           \.hword 0x7475, 0x3263, 0x3632
 2099      32 36 
 2100 0038 75 74 63 32 	           \.hword 0x7475, 0x3263, 0x3732
 2100      32 37 
 2101 003e 00 00       	           \.hword \(0xFFFF\+1\)
 2102 0040 FF 7F       	           \.hword \(-32768-1\)
 2103 0042 FF FF       	           \.hword 0xFFFF
 2104 0044 00 80       	           \.hword -32768   
 2105                 	           
