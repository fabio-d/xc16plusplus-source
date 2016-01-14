#as: --no-warn
#name: -aln Listing file test
#source: cert0026ax.s

# 

   1              		\.title cert0026ax listing test
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
  17 000004  00 00 FF 		nopr
  18              		\.global foo
  19 000006  00 00 FF 	foo:	nopr
  20              		\.eject
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
  30              		\.sbttl subtitle2 test
  31              		
  32            52 00 		\.ascii "Resume listing in list file\."
  32 0000c2  65 73 00 
  32         75 6D 00 
  32         65 20 00 
  32         6C 69 00 
  32         73 74 00 
  32         69 6E 00 
  32         67 20 00 
  32         69 6E 00 
  33              		
  34              	/\* Begin SUM macro expansion \*/
  35              		
  36              	/\* First SUM macro expansion goes next\. \[1,5\] \*/	
  37              		
  38            01 00 		SUM	1, 5
  38 0000de  00 00 00 
  38         00 02 00 
  38         00 00 00 
  38         00 03 00 
  38         00 00 00 
  38         00 04 00 
  38         00 00 00 
  38         00 05 00 
  39              		
  40              	/\* Second SUM macro expansion goes next\. \[1,2\] \*/	
  41              	
  42            01 00 		SUM	1, 2
  42 0000f2  00 00 00 
  42         00 02 00 
  42         00 00 00 
  42         00 
  43              		
  44              	/\* Third SUM macro expansion goes next\. \[1,4\] \*/		
  45              		
  46            01 00 		SUM	1, 4
  46 0000fa  00 00 00 
  46         00 02 00 
  46         00 00 00 
  46         00 03 00 
  46         00 00 00 
  46         00 04 00 
  46         00 00 00 
  46         00 
  47              		
  48              	/\* End of macro expansions \*/	
  49              		
  50              		\.eject
  51              		\.sbttl subtitle3 test main routine
  52              		\.psize 20
  53            00 00 		
  54 00010a  55 00 20 	main:	MOV #5, w5
  55 00010c  16 00 20 		MOV #1, w6
  56              		
  57 00010e  86 83 4A 		addc w5, w6, w7
  58              		
  59 000110  06 AC B8 		MUL\.US	w5, w6, w8
  60              		
  61              		
  62              		
  63              		
  64              		
