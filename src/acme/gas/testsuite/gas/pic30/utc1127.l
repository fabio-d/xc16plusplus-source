#name:  Listing - non-aligned bytes are translated to show position
#as: -a
MPLAB ASM30 Listing:  .*utc1127.s 			page 1


   1              	        .text
   2 000000  01       	        .pbyte 1
   3            02 03 	        .pbyte 2,3
MPLAB ASM30 Listing:  .*utc1127.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF

NO UNDEFINED SYMBOLS

EQUATE SYMBOLS
                       __C30COFF = 0x1
