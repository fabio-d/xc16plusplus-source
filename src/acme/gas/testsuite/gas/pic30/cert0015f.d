#as: --listing-cont-lines 0 --listing-lhs-width 1
#name: --listing-cont-lines 0 --listing-lhs-width 1
#source: cert0015.s

MPLAB ASM30 Listing:  .+cert0015\.s 			page 1


   1        		\.text
   2 000000  00 		nopr
   3        		\.global foo
   4 000002  00 	foo:	nopr
   5        	
   6 000004  74 		\.ascii \"test of listing continuation lines\.  This line should be really really really long so that
   7         00 	
   8        	   \.data
   9        	foo_d:
  10 0000 01 	   \.word 1
  11        	
  12        	   \.bss
  13        	foo_b:
  14 0000 00 	   \.space 2
  15        	   \.end
MPLAB ASM30 Listing:  .+cert0015\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0015\.s:4      \.text:00000002 foo
.+cert0015\.s:9      \.data:00000000 foo_d
.+cert0015\.s:13     \.bss:00000000 foo_b

NO UNDEFINED SYMBOLS

EQUATE SYMBOLS
                       __C30COFF = 0x1
