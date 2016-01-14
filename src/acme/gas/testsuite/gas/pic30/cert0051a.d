#as:
#name: .comm Declare common symbol
#source: cert0051a.s

MPLAB ASM30 Listing:  .+cert0051a\.s 			page 1
cert0051a Common symbol
subtitle1 test
   1              	
   2              		\.title cert0051a Common symbol
   3              		\.sbttl subtitle1 test
   4              	
   5              		
   6              		\.data
   7                 	
   8                 		\.comm	comsym4, 4
   9                 		\.comm	comsym2, 2
  10                 		\.comm	comsym1, 1
  11                 	
  12                 		\.text
  13              		\.global main
  14              		
  15 000000  00 00 04 		goto externdefine
  15         00 00 00 
  16 000004  00 00 04 		goto main2
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 2
cert0051a Common symbol
subtitle1 test
  16         00 00 00 
  17 000008  00 00 04 		goto 1f
  17         00 00 00 
  18 00000c  00 00 04 		goto 2f
  18         00 00 00 
  19 000010  00 00 04 		goto 3f
  19         00 00 00 
  20 000014  00 00 04 		goto 4f
  20         00 00 00 
  21 000018  00 00 04 		goto 5f
  21         00 00 00 
  22 00001c  00 00 04 		goto 6f
  22         00 00 00 
  23 000020  00 00 04 		goto 7f
  23         00 00 00 
  24 000024  00 00 04 		goto 8f
  24         00 00 00 
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 3
cert0051a Common symbol
subtitle1 test
  25 000028  00 00 04 		goto 9f
  25         00 00 00 
  26 00002c  00 00 04 		goto 0f
  26         00 00 00 
  27 000030  00 00 FF 		nopr
  28              		\.global foo
  29 000032  00 00 FF 	foo:	nopr
  30              		\.eject
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 4
cert0051a Common symbol
subtitle2 test
  31 000034  54 65 00 		\.ascii \"Test of listing continuation lines\.  This line should be really really really long so that
  31         73 74 00 
  31         20 6F 00 
  31         66 20 00 
  31         6C 69 00 
  31         73 74 00 
  31         69 6E 00 
  31         67 20 00 
  31         63 6F 00 
  32              	
  33              		\.if 0
  34              		\.ascii \"This ascii string is within a false conditional\"
  35              		\.endif
  36              		\.sbttl subtitle2 test
  37 0000b8  52 65 00 		\.ascii \"Resume listing in list file\.\"
  37         73 75 00 
  37         6D 65 00 
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 5
cert0051a Common symbol
subtitle3 test main routine
  37         20 6C 00 
  37         69 73 00 
  37         74 69 00 
  37         6E 67 00 
  37         20 69 00 
  37         6E 20 00 
  38              		
  39              		\.eject
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 6
cert0051a Common symbol
subtitle3 test main routine
  40              		\.sbttl subtitle3 test main routine
  41              		\.psize 20
  42              		
  43 0000d4  55 00 20 	main:	MOV \#5, w5
  44 0000d6  16 00 20 		MOV \#1, w6
  45 0000d8  86 83 4A 	1:	addc w5, w6, w7
  46 0000da  06 AC B8 		MUL\.US	w5, w6, w8
  47 0000dc  16 00 20 		MOV \#1, w6
  48 0000de  86 83 4A 	2:	addc w5, w6, w7
  49 0000e0  06 AC B8 		MUL\.US	w5, w6, w8
  50 0000e2  16 00 20 		MOV \#1, w6
  51 0000e4  86 83 4A 		addc w5, w6, w7
  52 0000e6  06 AC B8 	3:	MUL\.US	w5, w6, w8
  53 0000e8  16 00 20 		MOV \#1, w6
  54 0000ea  86 83 4A 	4:	addc w5, w6, w7
  55 0000ec  06 AC B8 		MUL\.US	w5, w6, w8	
  56 0000ee  16 00 20 	5:	MOV \#1, w6
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 7
cert0051a Common symbol
subtitle3 test main routine
  57 0000f0  86 83 4A 		addc w5, w6, w7
  58 0000f2  06 AC B8 		MUL\.US	w5, w6, w8	
  59 0000f4  16 00 20 	6:	MOV \#1, w6
  60 0000f6  86 83 4A 		addc w5, w6, w7
  61 0000f8  06 AC B8 		MUL\.US	w5, w6, w8	
  62 0000fa  16 00 20 	7:	MOV \#1, w6
  63 0000fc  86 83 4A 		addc w5, w6, w7
  64 0000fe  06 AC B8 		MUL\.US	w5, w6, w8	
  65 000100  16 00 20 		MOV \#1, w6
  66 000102  86 83 4A 	8:	addc w5, w6, w7
  67 000104  06 AC B8 		MUL\.US	w5, w6, w8
  68 000106  16 00 20 		MOV \#1, w6
  69 000108  86 83 4A 	9:	addc w5, w6, w7
  70 00010a  06 AC B8 		MUL\.US	w5, w6, w8
  71              		
  72 00010c  00 00 04 	0:	goto	main	
  72         00 00 00 
MPLAB ASM30 Listing:  .+cert0051a\.s 			page 8
cert0051a Common symbol
subtitle3 test main routine
  73              	
  74              	
  75              		
MPLAB ASM30 Listing:  .+cert0051a.s 			page 9
cert0051a Common symbol
subtitle3 test main routine
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
                            \*COM\*:00000004 comsym4
                            \*COM\*:00000002 comsym2
                            \*COM\*:00000001 comsym1
.+cert0051a.s:42     \.text:000000d4 main
.+cert0051a.s:45     \.text:000000d8 L11
.+cert0051a.s:48     \.text:000000de L21
.+cert0051a.s:52     \.text:000000e6 L31
.+cert0051a.s:54     \.text:000000ea L41
.+cert0051a.s:56     \.text:000000ee L51
.+cert0051a.s:59     \.text:000000f4 L61
.+cert0051a.s:62     \.text:000000fa L71
.+cert0051a.s:66     \.text:00000102 L81
.+cert0051a.s:69     \.text:00000108 L91
.+cert0051a.s:72     \.text:0000010c L1
MPLAB ASM30 Listing:  .+cert0051a.s 			page 10
cert0051a Common symbol
subtitle3 test main routine
.+cert0051a\.s:29     \.text:00000032 foo

UNDEFINED SYMBOLS
externdefine
main2
EQUATE SYMBOLS
                       __C30COFF = 0x1
