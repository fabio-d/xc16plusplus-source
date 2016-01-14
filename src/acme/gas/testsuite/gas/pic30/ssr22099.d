#as:
#name: SSR22099: Executing a .porg dir fails to fill all three bytes with fill value
#source: ssr22099.s

MPLAB ASM30 Listing:  .+ssr22099\.s 			page 1


   1              	             \.text
   2 000000  A5 A5 A5 	             \.porg 0x10, 0xA5
   2         A5 A5 A5 
   2         A5 A5 A5 
   2         A5 A5 A5 
   2         A5 A5 A5 
   2         A5 A5 A5 
   2         A5 A5 A5 
   2         A5 A5 A5 
   3              	             \.pfillvalue 0x34
   4 000010  56 56 56 	             \.porg 0x20, 0x56
   4         56 56 56 
   4         56 56 56 
   4         56 56 56 
   4         56 56 56 
   4         56 56 56 
   4         56 56 56 
   4         56 56 56 
   5 000020  06 AC B8 	             MUL\.US w5, w6, w8
   6              	             
   7              	             \.end
MPLAB ASM30 Listing:  \./\./gas/pic30/ssr22099\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF

NO UNDEFINED SYMBOLS
