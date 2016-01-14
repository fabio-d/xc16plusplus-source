#as: --listing-cont-lines=4
#name: .double in a section with "r" attribute and a .const section
#source: cert0430.s

MPLAB ASM30 Listing:  .*cert0430.s 			page 1


   1              	
 2061              	           \.list
 2062              	        
 2063              	           \.section foo, psv
 2064 0000 00 00 00 00 	fposzer:   \.double  0\.0
 2064      00 00 00 00 
 2065 0008 00 00 00 00 	fnegzer:   \.double -0\.0
 2065      00 00 00 80 
 2066 0010 00 00 00 00 	fone:      \.double 1\.0
 2066      00 00 F0 3F 
 2067 0018 00 00 00 00 	ftwo:      \.double  2\.0
 2067      00 00 00 40 
 2068 0020 FF FF FF FF 	fmaxnm:    \.double  1\.7976931348623157e308
 2068      FF FF EF 7F 
 2069 0028 00 00 00 00 	fminpos:   \.double  2\.2250738585072014e-308
 2069      00 00 10 00 
 2070 0030 FF FF FF FF 	fmaxsub:   \.double  2\.2250738585072009e-308
 2070      FF FF 0F 00 
 2071 0038 01 00 00 00 	fminsub:   \.double  4\.9406564584124654e-324
 2071      00 00 00 00 
 2072                 	
 2073                 	           \.section \.const, psv
 2074                 	
 2075 0000 00 00 00 00 	cposzer:   \.double  0\.0
 2075      00 00 00 00 
 2076 0008 00 00 00 00 	cnegzer:   \.double -0\.0
 2076      00 00 00 80 
 2077 0010 00 00 00 00 	cone:      \.double 1\.0
 2077      00 00 F0 3F 
 2078 0018 00 00 00 00 	ctwo:      \.double  2\.0
 2078      00 00 00 40 
 2079 0020 FF FF FF FF 	cmaxnm:    \.double  1\.7976931348623157e308
 2079      FF FF EF 7F 
 2080 0028 00 00 00 00 	cminpos:   \.double  2\.2250738585072014e-308
 2080      00 00 10 00 
 2081 0030 FF FF FF FF 	cmaxsub:   \.double  2\.2250738585072009e-308
 2081      FF FF 0F 00 
 2082 0038 01 00 00 00 	cminsub:   \.double  4\.9406564584124654e-324
 2082      00 00 00 00 
 2083                 	    
