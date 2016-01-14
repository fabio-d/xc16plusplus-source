#as: --listing-cont-lines 5 --listing-lhs-width 0
#name: --listing-cont-lines
#source: cert0015.s

# 

.*:  .* 			page 1


   1                 		\.text
   2 0000 00 00 FF 00 		nopr
   3                 		\.global foo
   4 0004 00 00 FF 00 	foo:	nopr
   5                 	
   6 0008 74 65 00 00 		\.ascii "test of asciiz warning"
   6      73 74 00 00 
   6      20 6F 00 00 
   6      66 20 00 00 
   6      61 73 00 00 
.*:  .* 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
.*:4      \.text:00000004 foo
                            \.text:00000000 \.text
                            \.data:00000000 \.data
                             \.bss:00000000 \.bss

NO UNDEFINED SYMBOLS
