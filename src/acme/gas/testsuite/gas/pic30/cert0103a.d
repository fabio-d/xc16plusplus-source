#as: 
#name: .long limits, text
#source: cert0103a.s



.*  .*cert0103a\.s 			page 1
cert0103 \.long,text
subtitle1 test
   1              		\.title cert0103 \.long, text
   2              		\.sbttl subtitle1 test
   3              	
   4              		\.data
   5                 	
   6                 	
   7                 		\.text
  26              		\.list
  27 00001c  00 00 00 	lmin:	\.long -2147483648
  27         00 80 00 
  28 000020  FF FF 00 	lmax: 	\.long 2147483647
  28         FF 7F 00 
  29 000024  00 00 00 	lzero:	\.long 0
  29         00 00 00 
  30              	
