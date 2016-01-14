#as:
#name: .align directive in absolute section
#source: ssr25958-1.s

MPLAB ASM30 Listing:  ././gas/pic30/ssr25958-1.s 			page 1


   1              	                \.section absdata1,data,address\(0x900\)
   2 0000 00 00 00 00 	                \.space 5
   2      00 
   3 0005 00          	                \.align 2
   4 0006 44 33       	                \.word 0x3344
   5                 	
   6                 	                \.data
   7 0000 00 00 00    	                \.space 3
   8 0003 00          	                \.align 4
   9 0004 44 33       	                \.word 0x3344     
  10                 	
  11 0006 00 00       	                 \.section absdata1
  12 0008 66 55       	                 \.word 0x5566
  13                 	
  14                 	                \.section abscode1,code,address\(0x1000\)
  15 000000  00       	                \.space 1
  16            00 00 	                \.align 4
  16 000002  00 00 00 
  17 000004  00 60 FE 	                clrwdt
  18              	
  19 000006  00 00 00 	                \.section abscode2,code,address\(0x1100\)
  20 000000  00 00 00 	                \.space 1
  21 000002  00 60 FE 	myclrwdtlbl:     clrwdt
  22 000004  00 00 00 	                \.space 3
  22         00 
  23            00 00 	                \.align 4
  24 000008  00 60 FE 	                clrwdt           
  25              	
  26              	                \.text
  27 000000  00 00 00 	                nop
  28 000002  00       	                \.space 1
  29            00 00 	                \.align 4
  30 000004  22 11 00 	                \.word 0x1122
  31              	
  32 000006  00 00 00 	                \.section abscode2,code ;continued
  33 00000a  00 00 00 	                \.pspace 5
  33         00 00 00 
  34 00000e  00 60 FE 	finallabel:      clrwdt
  35              	
  36              	                \.end
