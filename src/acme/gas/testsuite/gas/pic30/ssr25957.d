#as: --listing-cont-lines=10
#name: ssr 25957: Allow .align in reverse-aligned section
#source: ssr25957.s

MPLAB ASM30 Listing:  .+ssr25957.s 			page 1


   1              	
   2              	             \.data
   3                 	             \.global _foo16uA ; export
   4                 	             \.section \*,reverse\(256\),data
   5                 	             \.align 2
   6                 	_foo16uA:
   7 0000 CD CD       	             \.word -12851
   8                 	
   9                 	             \.end
MPLAB ASM30 Listing:  .+ssr25957\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+ssr25957\.s:6      .+ssr25957\.s\.scn1:00000000 _foo16uA

NO UNDEFINED SYMBOLS
