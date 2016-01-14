#as: 
#name: .single in a section with psv attribute and a .const section
#source: cert0570.s

MPLAB ASM30 Listing:  .+cert0570\.s 			page 1


 2067              	           \.list
 2068              	
 2069              	           \.pfillvalue 0x56
 2070              	           \.fillupper  0x34
 2071              	           \.fillvalue  0x12
 2072              	           
 2073              	           \.section foo0, psv
 2074 0000 00 00 80 FF 	single1f:  \.single -INF
 2075 0004 00 00 00 00 	single2f:  \.single 0
 2076 0008 01          	           \.byte 1
 2077 0009 00 00 00 80 	single3f:  \.single -0           
 2078 000d FF FF FF 7F 	single4f:  \.single NaN
 2079 0011 01          	           \.byte 1
 2080 0012 00 00 80 7F 	single5f:  \.single \+INF        
 2081 0016 20 B2 96 49 	foo:       \.single 0f1\.2345e\+06
 2082 001a D0 0F 49 40 	           \.single 0f3\.14159
 2083 001e 00 00 80 00 	           \.single 0f1\.17549435e-38
 2084                 	
 2085                 	           \.section \.const, psv        
 2086 0000 00 00 80 FF 	single1c:  \.single -INF
 2087 0004 01          	            \.byte 1
 2088 0005 00 00 00 00 	single2c:  \.single 0
 2089 0009 00 00 00 80 	single3c:  \.single -0           
 2090 000d 01          	           \.byte 1
 2091 000e FF FF FF 7F 	single4c:  \.single NaN
 2092 0012 00 00 80 7F 	single5c:  \.single \+INF                      
 2093 0016 20 B2 96 49 	           \.single 0f1\.2345e\+06
 2094 001a D0 0F 49 40 	           \.single 0f3\.14159
 2095 001e 00 00 80 00 	           \.single 0f1\.17549435e-38
 2096                 	
 2097                 	                      
