#as: --listing-cont-lines=4 --no-warn
#name: .long in a section with "r" attribute and a .const section
#source: cert0490.s

MPLAB ASM30 Listing:  .*cert0490\.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	
 2064              	/\* Begin macro SUM definition \*/
 2065              	   \.macro   sum from=0, to=5
 2066              	   \.long \\from
 2067              	   \.if   \\to-\\from
 2068              	   sum   "\(\\from\+1\)",\\to
 2069              	   \.endif
 2070              	   \.endm
 2071              	/\* End macro SUM definition \*/        
 2072              	        
 2073              	           \.section foo, \"r\"
 2074                 	           
 2075 0000 02 00 00 00 	           sum 2, 4
 2075      03 00 00 00 
 2075      04 00 00 00 
 2076 000c 01 00 00 00 	           sum 1, 101
 2076      02 00 00 00 
 2076      03 00 00 00 
 2076      04 00 00 00 
 2076      05 00 00 00 
 2077                 	           
 2078 01a0 01 00 00 00 	flong1:    \.long 1
 2079 01a4 02 00 00 00 	flong2:    \.long 2
 2080 01a8 00 01 00 00 	flong3:    \.long 256
 2081 01ac 00 80 00 00 	flong4:    \.long 32768
 2082 01b0 FF FF FF FF 	flong5:    \.long -1
 2083 01b4 FE FF FF FF 	flong6:    \.long -2
 2084 01b8 00 FF FF FF 	flong7:    \.long -256
 2085 01bc 00 80 FF FF 	flong8:    \.long -32768
 2086 01c0 A0 86 01 00 	flong9:    \.long 100000
 2087 01c4 60 79 FE FF 	flong10:   \.long -100000
 2088 01c8 00 00 00 80 	flmin:     \.long -2147483648
 2089 01cc FF FF FF 7F 	flmax:     \.long 2147483647
 2090 01d0 00 00 00 00 	flzero:    \.long 0
 2091 01d4 00 00 00 00 	           \.long 0
 2092 01d8 01 00 00 00 	           \.long 1
 2093 01dc 02 00 00 00 	           \.long 2
 2094 01e0 64 00 00 00 	           \.long 100
 2095 01e4 7D 00 00 00 	           \.long 125
 2096 01e8 FF 7F 00 00 	           \.long 32767
 2097 01ec FF FF 00 00 	           \.long 65535
 2098 01f0 01 00 00 00 	           \.long 0x01
 2099 01f4 02 00 00 00 	           \.long 0x02
 2100 01f8 00 00 00 00 	           \.long 0x00
 2101 01fc 64 00 00 00 	           \.long 0x64
 2102 0200 7D 00 00 00 	           \.long 0x7D
 2103 0204 7F 00 00 00 	           \.long 0x7F
 2104 0208 78 56 34 12 	           \.long 0x12345678
 2105                 	           
 2106                 	           
 2107                 	           \.section \.const, \"r\"
 2108                 	           
 2109 0000 01 00 00 00 	clong1:    \.long 1
 2110 0004 02 00 00 00 	clong2:    \.long 2
 2111 0008 00 01 00 00 	clong3:    \.long 256
 2112 000c 00 80 00 00 	clong4:    \.long 32768
 2113 0010 FF FF FF FF 	clong5:    \.long -1
 2114 0014 FE FF FF FF 	clong6:    \.long -2
 2115 0018 00 FF FF FF 	clong7:    \.long -256
 2116 001c 00 80 FF FF 	clong8:    \.long -32768
 2117 0020 A0 86 01 00 	clong9:    \.long 100000
 2118 0024 60 79 FE FF 	clong10:   \.long -100000
 2119 0028 00 00 00 80 	clmin:     \.long -2147483648
 2120 002c FF FF FF 7F 	clmax:     \.long 2147483647
 2121 0030 00 00 00 00 	clzero:    \.long 0
 2122 0034 00 00 00 00 	           \.long 0
 2123 0038 01 00 00 00 	           \.long 1
 2124 003c 02 00 00 00 	           \.long 2
 2125 0040 64 00 00 00 	           \.long 100
 2126 0044 7D 00 00 00 	           \.long 125
 2127 0048 FF 7F 00 00 	           \.long 32767
 2128 004c FF FF 00 00 	           \.long 65535
 2129 0050 01 00 00 00 	           \.long 0x01
 2130 0054 02 00 00 00 	           \.long 0x02
 2131 0058 00 00 00 00 	           \.long 0x00
 2132 005c 64 00 00 00 	           \.long 0x64
 2133 0060 7D 00 00 00 	           \.long 0x7D
 2134 0064 7F 00 00 00 	           \.long 0x7F
 2135 0068 78 56 34 12 	           \.long 0x12345678           
 2136                 	           
