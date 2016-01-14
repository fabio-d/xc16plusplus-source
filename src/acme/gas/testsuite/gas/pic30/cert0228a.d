#as: 
#name: .long limits, data
#source: cert0228a.s



.*  .*cert0228a\.s 			page 1
cert0228 \.long,data
subtitle1 test
   1              		\.title cert0228 \.long, data
   2              		\.sbttl subtitle1 test
   3              	
   4              		\.data
   5                 	
   6                 		\.list
   7 0000 00 00 00 80 	lmin:	\.long -2147483648
   8 0004 FF FF FF 7F 	lmax: 	\.long 2147483647
   9 0008 00 00 00 00 	lzero:	\.long 0
  10                 		\.nolist	
  11                 		
  12                 		\.text
