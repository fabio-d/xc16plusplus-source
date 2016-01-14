#as: --listing-cont-lines=4
#name: .float in a section with "r" attribute and a .const section
#source: cert0460.s

MPLAB ASM30 Listing:  .*/gas/pic30/cert0460\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo,psv
 2064 0000 00 00 00 00 	fposzer:   \.float   0\.0
 2065 0004 00 00 00 80 	fnegzer:   \.float -0\.0
 2066 0008 00 00 80 3F 	fone:      \.float  1\.0
 2067 000c 00 00 00 40 	ftwo:      \.float   2\.0
 2068 0010 FF FF 7F 7F 	fmaxnm:    \.float   3\.40282347e\+38
 2069 0014 00 00 80 00 	fminpos:   \.float   1\.17549435e-38
 2070 0018 FF FF 7F 00 	fmaxsub:   \.float   1\.17549421e-38
 2071 001c 01 00 00 00 	fminsub:   \.float   1\.40129846e-45
 2072 0020 00 00 80 7F 	fposinf:   \.float   \+INF
 2073 0024 00 00 80 FF 	fneginf:   \.float   -INF  
 2074                 	
 2075                 	           \.section \.const,psv
 2076 0000 00 00 00 00 	cposzer:   \.float   0\.0
 2077 0004 00 00 00 80 	cnegzer:   \.float -0\.0
 2078 0008 00 00 80 3F 	cone:      \.float  1\.0
 2079 000c 00 00 00 40 	ctwo:      \.float   2\.0
 2080 0010 FF FF 7F 7F 	cmaxnm:    \.float   3\.40282347e\+38
 2081 0014 00 00 80 00 	cminpos:   \.float   1\.17549435e-38
 2082 0018 FF FF 7F 00 	cmaxsub:   \.float   1\.17549421e-38
 2083 001c 01 00 00 00 	cminsub:   \.float   1\.40129846e-45
 2084 0020 00 00 80 7F 	cposinf:   \.float   \+INF
 2085 0024 00 00 80 FF 	cneginf:   \.float   -INF  
 2086                 	           
