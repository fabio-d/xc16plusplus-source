#as: --no-warn
#name: -acdhlmns all listing options
#source: cert0026ab.s

# 
   1              		\.title cert0026ab listing test
   2              		\.sbttl subtitle1 test
   3              		\.text
   4 000000  00 00 04 		goto main
   4         00 00 00 
   5 000004  00 00 FF 		nopr
   6              		\.global foo
   7 000006  00 00 FF 	foo:	nopr
   8              		\.eject
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
  11              		\.psize 25
  16              		\.list
  17              		
  18              		\.sbttl subtitle2 test
  19              		
  20            52 00 		\.ascii \"Resume listing in list file\.\"
  20 0000c2  65 73 00 
  20         75 6D 00 
  20         65 20 00 
  20         6C 69 00 
  20         73 74 00 
  20         69 6E 00 
  20         67 20 00 
  20         69 6E 00 
  21              		
  22              		\.eject
  23              		\.sbttl subtitle3 test main routine
  24              		\.psize 20
  25            00 00 		
  26 0000de  55 00 20 	main:	MOV \#5, w5
  27 0000e0  16 00 20 		MOV \#1, w6
  28              		
  29 0000e2  86 83 4A 		addc w5, w6, w7
  30              		
  31 0000e4  06 AC B8 		MUL\.US	w5, w6, w8
  32              		
  33              		
  34              		
  35              		
  36              		
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
\./\./gas/pic30/cert0026ab\.s:26     \.text:000000de main
\./\./gas/pic30/cert0026ab\.s:7      \.text:00000006 foo

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
