#as: --listing-cont-lines 255 --listing-lhs-width 1
#name: --listing-cont-lines 255 --listing-lhs-width 1
#source: cert0015.s

MPLAB ASM30 Listing:  .+cert0015\.s 			page 1


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
   6         6F 00 6E 
   6         74 00 69 
   6         6E 00 75 
   6         61 00 74 
   6         69 00 6F 
   6         6E 00 20 
   6         6C 00 69 
   6         6E 00 65 
   6         73 00 2E 
   6         20 00 20 
   6         54 00 68 
   6         69 00 73 
   6         20 00 6C 
   6         69 00 6E 
   6         65 00 20 
   6         73 00 68 
   6         6F 00 75 
   6         6C 00 64 
   6         20 00 62 
   6         65 00 20 
   6         72 00 65 
   6         61 00 6C 
   6         6C 00 79 
   6         20 00 72 
   6         65 00 61 
   6         6C 00 6C 
   6         79 00 20 
   6         72 00 65 
   6         61 00 6C 
   6         6C 00 79 
   6         20 00 6C 
   6         6F 00 6E 
   6         67 00 20 
   6         73 00 6F 
   6         20 00 74 
   6         68 00 61 
   6         74 00 20 
   6         67 00 61 
   6         73 00 20 
   6         69 00 73 
   6         20 00 66 
MPLAB ASM30 Listing:  .+cert0015\.s 			page 2


   6         6F 00 72 
   6         63 00 65 
   6         64 00 20 
   6         74 00 6F 
   6         20 00 75 
   6         73 00 65 
   6         20 00 63 
   6         6F 00 6E 
   6         74 00 69 
   6         6E 00 75 
   6         61 00 74 
   6         69 00 6F 
   6         6E 00 20 
   6         6C 00 69 
   6         6E 00 65 
   6         73 00 2E 
   7         00 	
   7 000088  00 
   8        	   \.data
   9        	foo_d:
  10 0000 01 	   \.word 1
  10      00 
  11        	
  12        	   \.bss
  13        	foo_b:
  14 0000 00 	   \.space 2
  14      00 
  15        	   \.end
MPLAB ASM30 Listing:  .+cert0015\.s 			page 3


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0015\.s:4      \.text:00000002 foo
.+cert0015\.s:9      \.data:00000000 foo_d
.+cert0015\.s:13     \.bss:00000000 foo_b

NO UNDEFINED SYMBOLS

EQUATE SYMBOLS
                       __C30COFF = 0x1
