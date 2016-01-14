#name:  Listing - padding is displayed after incomplete program words
#as: -a
MPLAB ASM30 Listing:  .*utc1126.s 			page 1


   1              	        .text
   2 000000  01 00 00 	        .pbyte 1
   3 000002  02 03 04 	L1:     .pbyte 2,3,4
   4              	
MPLAB ASM30 Listing:  .*utc1126.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.*utc1126.s:3      .text:00000002 L1

NO UNDEFINED SYMBOLS

EQUATE SYMBOLS
                       __C30COFF = 0x1
