#as: --listing-lhs-width 1
#name: --listing-lhs-width 1
#source: cert0017.s

MPLAB ASM30 Listing:  .+cert0017\.s 			page 1


   1        		\.text
   2 000000  00 		nopr
   2         00 FF 
   3        		\.global foo
   4 000002  00 	foo:	nopr
   4         00 FF 
   5        	
   6 000004  74 		\.ascii \"test of listing continuation lines\.  This line should be really really really long so that
   6         65 00 73 
   6         74 00 20 
   6         6F 00 66 
   6         20 00 6C 
   6         69 00 73 
   6         74 00 69 
   6         6E 00 67 
   6         20 00 63 
   7        	   \.data
   8        	foo_d:
   9 0000 01 	   \.word 1
   9      00 
  10        	   \.bss
  11        	foo_b:
  12 0000 00 	   \.space 2
  12      00 
  13        	   \.end
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
