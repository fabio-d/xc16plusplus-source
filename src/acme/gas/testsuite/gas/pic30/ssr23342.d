#as: --listing-cont-lines=10
#name: ssr 23342: .pword directive misevaluates simple expressions
#source: ssr23342.s

MPLAB ASM30 Listing:  .+ssr23342\.s 			page 1


   1              	
   2              	
   3              	             \.text
   4 000000  0A 00 00 	             \.pword \.Lx\+4-\$
   5 000002  00 00 00 	             nop
   6 000004  00 00 00 	             nop
   7              	\.Lx:
   8 000006  08 00 00 	             \.pword \.Ly\+2-\$
   9 000008  00 00 00 	             nop
  10 00000a  00 00 00 	             nop
  11              	\.Ly:
  12 00000c  06 00 00 	             \.pword \.Lz\+0-\$
  13 00000e  00 00 00 	             nop
  14 000010  00 00 00 	             nop
  15              	\.Lz:
  16              	             \.end
MPLAB ASM30 Listing:  .+ssr23342\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF

NO UNDEFINED SYMBOLS
