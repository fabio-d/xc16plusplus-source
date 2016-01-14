#as: --listing-cont-lines=10
#name: .ascii in section with "r" attribute and a .const section
#source: cert0410.s

MPLAB ASM30 Listing:  .+cert0410\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo,psv
 2064 0000 74 68 69 73 	string0:   \.ascii "this is string0"
 2064      20 69 73 20 
 2064      73 74 72 69 
 2064      6E 67 30 
 2065 000f 12          	           \.align 2, 0x12
 2066 0010 74 68 69 73 	string1:   \.ascii "this is string1"
 2066      20 69 73 20 
 2066      73 74 72 69 
 2066      6E 67 31 
 2067 001f 00          	           \.align 2
 2068 0020 74 68 69 73 	string2:   \.ascii "this is string2"
 2068      20 69 73 20 
 2068      73 74 72 69 
 2068      6E 67 32 
 2069 002f 56          	           \.align 2, 0x56, 6
 2070 0030 74 68 69 73 	string3:   \.ascii "this is string3"
 2070      20 69 73 20 
 2070      73 74 72 69 
 2070      6E 67 33 
 2071 003f 00          	           \.align 2
 2072 0040 74 68 69 73 	string4:   \.ascii "this is string4"
 2072      20 69 73 20 
 2072      73 74 72 69 
 2072      6E 67 34 
 2073                 	         
 2074 004f 74 68 69 73 	string5:   \.ascii "this is string5 with no \.align"
 2074      20 69 73 20 
 2074      73 74 72 69 
 2074      6E 67 35 20 
 2074      77 69 74 68 
 2074      20 6E 6F 20 
 2074      2E 61 6C 69 
 2074      67 6E 
 2075                 	                              
 2076 006d 00          	           \.section \.const,psv
 2077 0000 74 68 69 73 	string6:   \.ascii "this is string6"
 2077      20 69 73 20 
 2077      73 74 72 69 
 2077      6E 67 36 
 2078 000f 12          	           \.align 2, 0x12
 2079 0010 74 68 69 73 	string7:   \.ascii "this is string7"
 2079      20 69 73 20 
 2079      73 74 72 69 
 2079      6E 67 37 
 2080 001f 00          	           \.align 2
 2081 0020 74 68 69 73 	string8:   \.ascii "this is string8"
 2081      20 69 73 20 
 2081      73 74 72 69 
 2081      6E 67 38 
 2082 002f 56          	           \.align 2, 0x56, 6
 2083 0030 74 68 69 73 	string9:   \.ascii "this is string9"
 2083      20 69 73 20 
 2083      73 74 72 69 
 2083      6E 67 39 
 2084 003f 00          	           \.align 2
 2085 0040 74 68 69 73 	string10:  \.ascii "this is astring10"
 2085      20 69 73 20 
 2085      61 73 74 72 
 2085      69 6E 67 31 
 2085      30 
 2086                 	         
 2087 0051 74 68 69 73 	string11:  \.ascii "this is string11 with no \.align"               
 2087      20 69 73 20 
 2087      73 74 72 69 
 2087      6E 67 31 31 
 2087      20 77 69 74 
 2087      68 20 6E 6F 
 2087      20 2E 61 6C 
 2087      69 67 6E 
