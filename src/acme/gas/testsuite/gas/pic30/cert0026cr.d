#as: --no-warn
#name: -ahls Listing file test
#source: cert0026cr.s

# 
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 1
cert0026cr listing test
subtitle1 test
   1              		\.title cert0026cr listing test
   2              		\.sbttl subtitle1 test
   3              		
   4              		
   5              	/\* Begin macro SUM definition	\*/
   6              		\.macro 	sum from=0, to=5
   7              		\.long	\\from
   8              		\.if	\\to-\\from
   9              		sum	\"\(\\from\+1\)\",\\to
  10              		\.endif
  11              		\.endm
  12              	/\* End macro SUM definition \*/
  13              		
  14              		
  15              		\.text
  16 000000  00 00 04 		goto main
  16         00 00 00 
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 2
cert0026cr listing test
subtitle1 test
  17 000004  00 00 FF 		nopr
  18              		\.global foo
  19 000006  00 00 FF 	foo:	nopr
  20              		\.eject
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 3
cert0026cr listing test
subtitle1 test
  21              	
  22 000008  54 65 00 		\.ascii \"Test of listing continuation lines\.  This line should be really really really long so that
  22         73 74 00 
  22         20 6F 00 
  22         66 20 00 
  22         6C 69 00 
  22         73 74 00 
  22         69 6E 00 
  22         67 20 00 
  22         63 6F 00 
  23              		\.psize 25
  28              		\.list
  29              		
  30              		
  31              		/\* False conditional next \*/
  32              		\.if 0
  33              		\.ascii \"This ascii string is within a false conditional\"
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 4
cert0026cr listing test
subtitle1 test
  34              		\.endif
  35              		/\* End False conditional \*/
  36              		
  37              		\.sbttl subtitle2 test
  38              		
  39            52 00 		\.ascii \"Resume listing in list file\.\"
  39 0000c2  65 73 00 
  39         75 6D 00 
  39         65 20 00 
  39         6C 69 00 
  39         73 74 00 
  39         69 6E 00 
  39         67 20 00 
  39         69 6E 00 
  40              		
  41              	/\* Begin SUM macro expansion \*/
  42              		
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 5
cert0026cr listing test
subtitle2 test
  43              	/\* First SUM macro expansion goes next\. \[1,5\] \*/	
  44            00 00 		\.align 2
  45              		
  46 0000de  01 00 00 		SUM	1, 5
  46         00 00 00 
  46         02 00 00 
  46         00 00 00 
  46         03 00 00 
  46         00 00 00 
  46         04 00 00 
  46         00 00 00 
  46         05 00 00 
  47              		
  48              	/\* Second SUM macro expansion goes next\. \[1,2\] \*/	
  49              	
  50 0000f2  01 00 00 		SUM	1, 2
  50         00 00 00 
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 6
cert0026cr listing test
subtitle3 test main routine
  50         02 00 00 
  50         00 00 00 
  51              		
  52              	/\* Third SUM macro expansion goes next\. \[1,4\] \*/		
  53              		
  54 0000fa  01 00 00 		SUM	1, 4
  54         00 00 00 
  54         02 00 00 
  54         00 00 00 
  54         03 00 00 
  54         00 00 00 
  54         04 00 00 
  54         00 00 00 
  55              		
  56              	/\* End of macro expansions \*/	
  57              		
  58              		\.eject
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 7
cert0026cr listing test
subtitle3 test main routine
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 8
cert0026cr listing test
subtitle3 test main routine
  59              		\.sbttl subtitle3 test main routine
  60              		\.psize 20
  61              		
  62 00010a  55 00 20 	main:	MOV \#5, w5
  63 00010c  16 00 20 		MOV \#1, w6
  64              		
  65 00010e  86 83 4A 		addc w5, w6, w7
  66              		
  67 000110  06 AC B8 		MUL\.US	w5, w6, w8
  68              		
  69              		
  70              		
  71              		
  72              		
MPLAB ASM30 Listing:  .+cert0026cr\.s 			page 9
cert0026cr listing test
subtitle3 test main routine
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0026cr\.s:61     \.text:0000010a main
.+cert0026cr\.s:19     \.text:00000006 foo

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
