#as: --listing-lhs-width 10
#name: --listing-lhs-width 10
#source: cert0017.s

MPLAB ASM30 Listing:  .+cert0017\.s 			page 1


   1                                   		\.text
   2 000000  00 00 FF                      		nopr
   3                                   		\.global foo
   4 000002  00 00 FF                      	foo:	nopr
   5                                   	
   6 000004  74 65 00 73 74 00 20 6F 00 66 		\.ascii \"test of listing continuation lines\.  This line should be really really really long so that
   6         20 00 6C 
   6         69 00 73 
   6         74 00 69 
   6         6E 00 67 
   6         20 00 63 
   6         6F 00 6E 
   6         74 00 69 
   6         6E 00 75 
   7                                   	   \.data
   8                                   	foo_d:
   9 0000 01 00                         	   \.word 1
  10                                   	   \.bss
  11                                   	foo_b:
  12 0000 00 00                         	   \.space 2
  13                                   	   \.end
MPLAB ASM30 Listing:  .+cert0017\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0017\.s:4      \.text:00000002 foo
.+cert0017\.s:8      \.data:00000000 foo_d
.+cert0017\.s:11     \.bss:00000000 foo_b

NO UNDEFINED SYMBOLS

EQUATE SYMBOLS
                       __C30COFF = 0x1
