#as: --no-warn
#name: -acdl Listing file test
#source: cert0026bh.s

# Omit false conditionals and omit debug directives.

.*  .*/gas/pic30/cert0026bh\.s 			page 1
cert0026bh listing test
subtitle1 test
   1              		\.title cert0026bh listing test
   2              		\.sbttl subtitle1 test
   3              		
   4              		
   5              	/\* Begin macro SUM definition	\*/
   6              		\.macro 	sum from=0, to=5
   7              		\.long	\\from
   8              		\.if	\\to-\\from
   9              		sum	"\(\\from\+1\)",\\to
  10              		\.endif
  11              		\.endm
  12              	/\* End macro SUM definition \*/
  13              		
  14              		
  15              		\.text
  16 000000  00 00 04 		goto main
  16         00 00 00 
.*  .*/gas/pic30/cert0026bh\.s 			page 2
cert0026bh listing test
subtitle1 test
  17 000004  00 00 FF 		nopr
  18              		\.global foo
  19 000006  00 00 FF 	foo:	nopr
  20              		\.eject
.*  .*/gas/pic30/cert0026bh\.s 			page 3
cert0026bh listing test
subtitle1 test
  21              	
  22 000008  54 65 00 		\.ascii "Test of listing continuation lines\.  This line should be really really really long so that
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
  34              		\.endif
.*  .*/gas/pic30/cert0026bh\.s 			page 4
cert0026bh listing test
subtitle1 test
  35              		/\* End False conditional \*/
  36              		
  37              		\.sbttl subtitle2 test
  38              		
  39            52 00 		\.ascii "Resume listing in list file\."
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
  43              	/\* First SUM macro expansion goes next\. \[1,5\] \*/	
.*  .*/gas/pic30/cert0026bh\.s 			page 5
cert0026bh listing test
subtitle2 test
  44              		
  45            01 00 		SUM	1, 5
  45 0000de  00 00 00 
  45         00 02 00 
  45         00 00 00 
  45         00 03 00 
  45         00 00 00 
  45         00 04 00 
  45         00 00 00 
  45         00 05 00 
  46              		
  47              	/\* Second SUM macro expansion goes next\. \[1,2\] \*/	
  48              	
  49            01 00 		SUM	1, 2
  49 0000f2  00 00 00 
  49         00 02 00 
  49         00 00 00 
.*  .*/gas/pic30/cert0026bh\.s 			page 6
cert0026bh listing test
subtitle3 test main routine
  49         00 
  50              		
  51              	/\* Third SUM macro expansion goes next\. \[1,4\] \*/		
  52              		
  53            01 00 		SUM	1, 4
  53 0000fa  00 00 00 
  53         00 02 00 
  53         00 00 00 
  53         00 03 00 
  53         00 00 00 
  53         00 04 00 
  53         00 00 00 
  53         00 
  54              		
  55              	/\* End of macro expansions \*/	
  56              		
  57              		\.eject
.*  .*/gas/pic30/cert0026bh\.s 			page 7
cert0026bh listing test
subtitle3 test main routine
.*  .*/gas/pic30/cert0026bh\.s 			page 8
cert0026bh listing test
subtitle3 test main routine
  58              		\.sbttl subtitle3 test main routine
  59              		\.psize 20
  60            00 00 		
  61 00010a  55 00 20 	main:	MOV #5, w5
  62 00010c  16 00 20 		MOV #1, w6
  63              		
  64 00010e  86 83 4A 		addc w5, w6, w7
  65              		
  66 000110  06 AC B8 		MUL\.US	w5, w6, w8
  67              		
  68              		
  69              		
  70              		
  71              		
