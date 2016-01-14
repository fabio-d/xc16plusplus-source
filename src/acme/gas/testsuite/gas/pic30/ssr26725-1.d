#as:
#name: .align 4 fails on even address boundary in program memory
#source: ssr26725-1.s

MPLAB ASM30 Listing:  .+ssr26725-1\.s 			page 1


   1              	
   2              	                \.text
   3 000000  00 00 00 	                nop
   4 000002  00 00 00 	                \.align 4
   5 000004  22 11 00 	                \.word 0x1122
   6              	
   7 000006  00 00 00 	                \.end
