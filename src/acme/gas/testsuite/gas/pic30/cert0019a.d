#as: --listing-cont-lines 3 --listing-lhs-width 2 --listing-lhs-width2 3
#name: --listing-cont-lines 3 --listing-lhs-width 2 --listing-lhs-width2 3
#source: cert0019.s

MPLAB ASM30 Listing:  .+cert0019\.s 			page 1


   1           		\.text
   2 000000  00 00 		nopr
   2         FF 
   3           		\.global foo
   4 000002  00 00 	foo:	nopr
   4         FF 
   5           	
   6 000004  74 65 		\.ascii \"test of listing continuation lines\.  This line should be really really really long so that
   6         00 73 74 
   6         00 20 6F 
   6         00 66 20 
   7           	
   8         00 00 	   \.align 2
   9 000088  00 00 	   nopr
   9         FF 
  10           	
  11           	   \.data
  12           	foo_d:
  13 0000 01 00 	   \.word 1
  14           	   \.bss
  15           	foo_b:
  16 0000 00 00 	   \.space 2
  17           	   \.end
MPLAB ASM30 Listing:  .+cert0019\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0019\.s:4      \.text:00000002 foo
.+cert0019\.s:12     \.data:00000000 foo_d
.+cert0019\.s:15     \.bss:00000000 foo_b

NO UNDEFINED SYMBOLS

EQUATE SYMBOLS
                       __C30COFF = 0x1
