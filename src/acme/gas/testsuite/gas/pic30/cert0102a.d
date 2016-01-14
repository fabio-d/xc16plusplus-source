#as: 
#name: .long functionality, text
#source: cert0102a.s




.*  .*cert0102a\.s 			page 1
cert0102 \.long,text
subtitle1 test
   1              		\.title cert0102 \.long, text
   2              		\.sbttl subtitle1 test
   3              	
   4              		\.data
   5                 	
   6                 	
   7                 		\.text
  26              		\.list
  27 00001c  01 00 00 	long1:	\.long 1
  27         00 00 00 
  28 000020  02 00 00 	long2:	\.long 2
  28         00 00 00 
  29 000024  00 01 00 	long3:  \.long 256
  29         00 00 00 
  30 000028  00 80 00 	long4:  \.long 32768
  30         00 00 00 
  31 00002c  FF FF 00 	long5:  \.long -1
  31         FF FF 00 
  32 000030  FE FF 00 	long6:  \.long -2
  32         FF FF 00 
  33 000034  00 FF 00 	long7:  \.long -256
  33         FF FF 00 
  34 000038  00 80 00 	long8:  \.long -32768
  34         FF FF 00 
  35 00003c  A0 86 00 	long9:  \.long 100000
  35         01 00 00 
  36 000040  60 79 00 	long10: \.long -100000
  36         FE FF 00 
  37              	
