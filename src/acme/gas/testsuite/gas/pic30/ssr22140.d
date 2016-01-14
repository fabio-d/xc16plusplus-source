#as:
#name: SSR22140: .org dir using dot sym beginning on odd data address causes FATAL bad value
#source: ssr22140.s

MPLAB ASM30 Listing:  .+ssr22140\.s 			page 1


   1              	             \.data
   2 0000 00 00 00 00 	             \.long 0
   3 0004 01 00 00 00 	             \.long 1
   4 0008 FF          	             \.byte 0xFF
   5 0009 00 00       	             \.org \. \+ 0x2
   6 000b A6          	test:        \.byte 0xA6
   7 000c A7          	             \.byte 0xA7
   8                 	
   9 000d 00          	             \.end
MPLAB ASM30 Listing:  .+ssr22140\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+ssr22140\.s:6      \.data:0000000b test

NO UNDEFINED SYMBOLS
