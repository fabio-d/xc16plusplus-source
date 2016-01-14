#as: 
#name: .long functionality
#source: cert0227a.s




.*  .*cert0227a\.s 			page 1
cert0227 \.long
subtitle1 test
   1              		\.title cert0227 \.long
   2              		\.sbttl subtitle1 test
   3              	
   4              		\.data
   5                 	
   6 0000 01 00 00 00 	long1:	\.long 1
   7 0004 02 00 00 00 	long2:	\.long 2
   8 0008 00 01 00 00 	long3:  \.long 256
   9 000c 00 80 00 00 	long4:  \.long 32768
  10 0010 FF FF FF FF 	long5:  \.long -1
  11 0014 FE FF FF FF 	long6:  \.long -2
  12 0018 00 FF FF FF 	long7:  \.long -256
  13 001c 00 80 FF FF 	long8:  \.long -32768
  14 0020 A0 86 01 00 	long9:  \.long 100000
  15 0024 60 79 FE FF 	long10: \.long -100000
  16                 	
