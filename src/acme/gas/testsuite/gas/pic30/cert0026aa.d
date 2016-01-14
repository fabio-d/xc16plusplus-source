#as: --no-warn
#name: -a no listing options
#source: cert0026aa.s

# 
MPLAB ASM30 Listing:  .+cert0026aa\.s 			page 1
cert0026 listing test
subtitle1 test
   1              		\.title cert0026 listing test
   2              		\.sbttl subtitle1 test
   3              		\.text
   4 000000  00 00 04 		goto main
   4         00 00 00 
   5 000004  00 00 FF 		nopr
   6              		\.global foo
   7 000006  00 00 FF 	foo:	nopr
   8              		\.eject
MPLAB ASM30 Listing:  .+cert0026aa\.s 			page 2
cert0026 listing test
subtitle2 test
   9              	
  10 000008  54 65 00 		\.ascii \"Test of listing continuation lines\.  This line should be really really really long so that
  10         73 74 00 
  10         20 6F 00 
  10         66 20 00 
  10         6C 69 00 
  10         73 74 00 
  10         69 6E 00 
  10         67 20 00 
  10         63 6F 00 
  11              	
  16              		\.list
  17              		
  18              		\.sbttl subtitle2 test
  19              		
  20            52 00 		\.ascii \"Resume listing in list file\.\"
  20 0000c2  65 73 00 
MPLAB ASM30 Listing:  .+cert0026aa\.s 			page 3
cert0026 listing test
subtitle2 test
  20         75 6D 00 
  20         65 20 00 
  20         6C 69 00 
  20         73 74 00 
  20         69 6E 00 
  20         67 20 00 
  20         69 6E 00 
  21              		
  22              		\.eject
MPLAB ASM30 Listing:  .+cert0026aa\.s 			page 4
cert0026 listing test
subtitle2 test
  23              		
  24              		\.psize 20
  25            00 00 		
  26 0000de  55 00 20 	main:	MOV \#5, w5
  27 0000e0  16 00 20 		MOV \#1, w6
  28              		
  29 0000e2  86 83 4A 		addc w5, w6, w7
  30              		
  31              		
  32              		
  33              		
MPLAB ASM30 Listing:  .+cert0026aa\.s 			page 5
cert0026 listing test
subtitle2 test
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0026aa\.s:26     \.text:000000de main
.+cert0026aa\.s:7      \.text:00000006 foo

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
