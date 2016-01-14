#as: --listing-cont-lines=10
#name: .asciz in a section with "r" attribute and a .const section
#source: cert0411.s


MPLAB ASM30 Listing:  .+cert0411\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo,psv
 2064 0000 20 74 68 69 	string0:   \.asciz " this is string0"
 2064      73 20 69 73 
 2064      20 73 74 72 
 2064      69 6E 67 30 
 2064      00 
 2065 0011 12          	           \.align 2, 0x12
 2066 0012 20 74 68 69 	string1:   \.asciz " this is string1"
 2066      73 20 69 73 
 2066      20 73 74 72 
 2066      69 6E 67 31 
 2066      00 
 2067 0023 00          	           \.align 2
 2068 0024 20 74 68 69 	string2:   \.asciz " this is string2"
 2068      73 20 69 73 
 2068      20 73 74 72 
 2068      69 6E 67 32 
 2068      00 
 2069 0035 56          	           \.align 2, 0x56, 6
 2070 0036 20 74 68 69 	string3:   \.asciz " this is string3"
 2070      73 20 69 73 
 2070      20 73 74 72 
 2070      69 6E 67 33 
 2070      00 
 2071 0047 00          	           \.align 2
 2072 0048 20 74 68 69 	string4:   \.asciz " this is string4"
 2072      73 20 69 73 
 2072      20 73 74 72 
 2072      69 6E 67 34 
 2072      00 
 2073                 	         
 2074 0059 20 74 68 69 	string5:   \.asciz " this is string5 with no \.align"
 2074      73 20 69 73 
 2074      20 73 74 72 
 2074      69 6E 67 35 
 2074      20 77 69 74 
 2074      68 20 6E 6F 
 2074      20 2E 61 6C 
 2074      69 67 6E 00 
 2075                 	                              
 2076 0079 00          	           \.section \.const,psv
 2077 0000 20 74 68 69 	string6:   \.asciz " this is string6"
 2077      73 20 69 73 
 2077      20 73 74 72 
 2077      69 6E 67 36 
 2077      00 
 2078 0011 12          	           \.align 2, 0x12
 2079 0012 20 74 68 69 	string7:   \.asciz " this is string7"
 2079      73 20 69 73 
 2079      20 73 74 72 
 2079      69 6E 67 37 
 2079      00 
 2080 0023 00          	           \.align 2
 2081 0024 20 74 68 69 	string8:   \.asciz " this is string8"
 2081      73 20 69 73 
 2081      20 73 74 72 
 2081      69 6E 67 38 
 2081      00 
 2082 0035 56          	           \.align 2, 0x56, 6
 2083 0036 20 74 68 69 	string9:   \.asciz " this is string9"
 2083      73 20 69 73 
 2083      20 73 74 72 
 2083      69 6E 67 39 
 2083      00 
 2084 0047 00          	           \.align 2
 2085 0048 20 74 68 69 	string10:  \.asciz " this is astring10"
 2085      73 20 69 73 
 2085      20 61 73 74 
 2085      72 69 6E 67 
 2085      31 30 00 
 2086                 	         
 2087 005b 20 74 68 69 	string11:  \.asciz " this is string11 with no \.align"               
 2087      73 20 69 73 
 2087      20 73 74 72 
 2087      69 6E 67 31 
 2087      31 20 77 69 
 2087      74 68 20 6E 
 2087      6F 20 2E 61 
 2087      6C 69 67 6E 
 2087      00 
