#as: --no-warn
#name: -als Listing file test
#source: cert0026ay.s

# 
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 1
cert0026ay listing test
subtitle1 test
   1              		\.title cert0026ay listing test
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
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 2
cert0026ay listing test
subtitle1 test
  17 000004  00 00 FF 		nopr
  18              		\.global foo
  19 000006  00 00 FF 	foo:	nopr
  20              		\.eject
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 3
cert0026ay listing test
subtitle1 test
  21              	
  22 000008  54 65 00 	foo1:	\.ascii \"Test of listing continuation lines\.  This line should be really really really long so
  22         73 74 00 
  22         20 6F 00 
  22         66 20 00 
  22         6C 69 00 
  22         73 74 00 
  22         69 6E 00 
  22         67 20 00 
  22         63 6F 00 
  23              		\.psize 25
  29              		\.list
  30              		
  31              		\.sbttl subtitle2 test
  32              		
  33 0000c0  52 65 00 	foo3:	\.ascii \"Resume listing in list file\.\"
  33         73 75 00 
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 4
cert0026ay listing test
subtitle2 test
  33         6D 65 00 
  33         20 6C 00 
  33         69 73 00 
  33         74 69 00 
  33         6E 67 00 
  33         20 69 00 
  33         6E 20 00 
  34              		
  35              	/\* Begin SUM macro expansion \*/
  36              		
  37              	/\* First SUM macro expansion goes next\. \[1,5\] \*/	
  38              		\.align 2
  39              		
  40 0000dc  01 00 00 		SUM	1, 5
  40         00 00 00 
  40         02 00 00 
  40         00 00 00 
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 5
cert0026ay listing test
subtitle2 test
  40         03 00 00 
  40         00 00 00 
  40         04 00 00 
  40         00 00 00 
  40         05 00 00 
  41              		
  42              	/\* Second SUM macro expansion goes next\. \[1,2\] \*/	
  43              	
  44 0000f0  01 00 00 		SUM	1, 2
  44         00 00 00 
  44         02 00 00 
  44         00 00 00 
  45              		
  46              	/\* Third SUM macro expansion goes next\. \[1,4\] \*/		
  47              		
  48 0000f8  01 00 00 		SUM	1, 4
  48         00 00 00 
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 6
cert0026ay listing test
subtitle3 test main routine
  48         02 00 00 
  48         00 00 00 
  48         03 00 00 
  48         00 00 00 
  48         04 00 00 
  48         00 00 00 
  49              		
  50              	/\* End of macro expansions \*/	
  51              		
  52              		\.eject
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 7
cert0026ay listing test
subtitle3 test main routine
  53              		\.sbttl subtitle3 test main routine
  54              		\.psize 20
  55              		
  56 000108  55 00 20 	main:	MOV \#5, w5
  57 00010a  16 00 20 		MOV \#1, w6
  58              		
  59 00010c  86 83 4A 		addc w5, w6, w7
  60              		
  61 00010e  06 AC B8 		MUL\.US	w5, w6, w8
  62              		
  63              		
  64              		
  65              		
  66              		
MPLAB ASM30 Listing:  .+cert0026ay\.s 			page 8
cert0026ay listing test
subtitle3 test main routine
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0026ay\.s:55     \.text:00000108 main
.+cert0026ay\.s:19     \.text:00000006 foo
.+cert0026ay\.s:22     \.text:00000008 foo1
.+cert0026ay\.s:26     \.text:0000008c foo2
.+cert0026ay\.s:33     \.text:000000c0 foo3

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
