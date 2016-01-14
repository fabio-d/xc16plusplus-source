#as: --listing-rhs-width 255
#name: --listing-rhs-width 255
#source: cert0021.s

# 
MPLAB ASM30 Listing:  .+cert0021\.s 			page 1


   1              		\.text
   2 000000  00 00 FF 		nopr
   3              		\.global foo
   4 000002  00 00 FF 	foo:	nopr
   5              	
   6 000004  74 65 00 		\.ascii \"test of listing continuation lines\.  This line should be really really really long so that gas is forced to use continuation lines\.\"
   6         73 74 00 
   6         20 6F 00 
   6         66 20 00 
   6         6C 69 00 
   6         73 74 00 
   6         69 6E 00 
   6         67 20 00 
   6         63 6F 00 
   7            00 00 	
   8              	   \.data
   9                 	foo_d:
  10 0000 01 00       	   \.word 1
  11                 	   \.bss
  12                 	foo_b:
  13 0000 00 00       	   \.space 2
  14                 	
  15                 	   \.end
MPLAB ASM30 Listing:  .+cert0021\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0021\.s:4      \.text:00000002 foo
.+cert0021\.s:9      \.data:00000000 foo_d
.+cert0021\.s:12     \.bss:00000000 foo_b

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
