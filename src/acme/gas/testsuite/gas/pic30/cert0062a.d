#as:
#name: .eject Force Page Break directive
#source: cert0062a.s

MPLAB ASM30 Listing:  .+cert0062a\.s 			page 1
cert 0062a--Force Page Break
subtitle1 test
   1              	
   2              		\.title cert 0062a -- Force Page Break
   3              		\.sbttl subtitle1 test
   4              	
   5              		
   6              		\.data
   7                 	
   8                 		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 2
cert 0062a--Force Page Break
subtitle1 test
   9                 	
  10                 		\.text
  11              		\.global main
  12              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 3
cert 0062a--Force Page Break
subtitle1 test
  13              		
  14 000000  00 00 04 		goto externdefine
  14         00 00 00 
  15 000004  00 00 04 		goto main2
  15         00 00 00 
  16              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 4
cert 0062a--Force Page Break
subtitle1 test
  17 000008  00 00 04 		goto 1f
  17         00 00 00 
  18 00000c  00 00 04 		goto 2f
  18         00 00 00 
  19 000010  00 00 04 		goto 3f
  19         00 00 00 
  20              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 5
cert 0062a--Force Page Break
subtitle1 test
  21 000014  00 00 04 		goto 4f
  21         00 00 00 
  22 000018  00 00 04 		goto 5f
  22         00 00 00 
  23              		
  24              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 6
cert 0062a--Force Page Break
subtitle1 test
  25              	
  26              		
  27 00001c  00 00 04 		goto 6f
  27         00 00 00 
  28              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 7
cert 0062a--Force Page Break
subtitle1 test
  29 000020  00 00 04 		goto 7f
  29         00 00 00 
  30 000024  00 00 04 		goto 8f
  30         00 00 00 
  31              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 8
cert 0062a--Force Page Break
subtitle1 test
  32 000028  00 00 04 		goto 9f
  32         00 00 00 
  33 00002c  00 00 04 		goto 0f
  33         00 00 00 
  34              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 9
cert 0062a--Force Page Break
subtitle1 test
  35              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 10
cert 0062a--Force Page Break
subtitle1 test
  36 000030  00 00 FF 		nopr
  37              		\.global foo
  38 000032  00 00 FF 	foo:	nopr
  39              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 11
cert 0062a--Force Page Break
subtitle1 test
  40              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 12
cert 0062a--Force Page Break
subtitle2 test
  41 000034  54 65 00 		\.ascii \"Test of listing continuation lines\.\\n\"
  41         73 74 00 
  41         20 6F 00 
  41         66 20 00 
  41         6C 69 00 
  41         73 74 00 
  41         69 6E 00 
  41         67 20 00 
  41         63 6F 00 
  42              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 13
cert 0062a--Force Page Break
subtitle2 test
  43              		
  44              		\.if 0
  45              		\.ascii \"This ascii string is within a false conditional\"
  46              		\.endif
  47              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 14
cert 0062a--Force Page Break
subtitle2 test
  48              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 15
cert 0062a--Force Page Break
subtitle2 test
  49              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 16
cert 0062a--Force Page Break
subtitle2 test
  50              		\.sbttl subtitle2 test
  51 000058  52 65 00 		\.ascii \"Resume listing in list file\.\"
  51         73 75 00 
  51         6D 65 00 
  51         20 6C 00 
  51         69 73 00 
  51         74 69 00 
  51         6E 67 00 
  51         20 69 00 
  51         6E 20 00 
  52              		
  53              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 17
cert 0062a--Force Page Break
subtitle3 test main routine
  54              		\.sbttl subtitle3 test main routine
  55              		
  56              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 18
cert 0062a--Force Page Break
subtitle3 test main routine
  57              		
  58 000074  55 00 20 	main:	MOV \#5, w5
  59 000076  16 00 20 		MOV \#1, w6
  60 000078  86 83 4A 	1:	addc w5, w6, w7
  61              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 19
cert 0062a--Force Page Break
subtitle3 test main routine
  62 00007a  06 AC B8 		MUL\.US	w5, w6, w8
  63 00007c  16 00 20 		MOV \#1, w6
  64 00007e  86 83 4A 	2:	addc w5, w6, w7
  65 000080  06 AC B8 		MUL\.US	w5, w6, w8
  66 000082  16 00 20 		MOV \#1, w6
  67              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 20
cert 0062a--Force Page Break
subtitle3 test main routine
  68 000084  86 83 4A 		addc w5, w6, w7
  69 000086  06 AC B8 	3:	MUL\.US	w5, w6, w8
  70 000088  16 00 20 		MOV \#1, w6
  71              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 21
cert 0062a--Force Page Break
subtitle3 test main routine
  72 00008a  86 83 4A 	4:	addc w5, w6, w7
  73 00008c  06 AC B8 		MUL\.US	w5, w6, w8	
  74 00008e  16 00 20 	5:	MOV \#1, w6
  75              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 22
cert 0062a--Force Page Break
subtitle3 test main routine
  76 000090  86 83 4A 		addc w5, w6, w7
  77 000092  06 AC B8 		MUL\.US	w5, w6, w8	
  78 000094  16 00 20 	6:	MOV \#1, w6
  79              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 23
cert 0062a--Force Page Break
subtitle3 test main routine
  80 000096  86 83 4A 		addc w5, w6, w7
  81 000098  06 AC B8 		MUL\.US	w5, w6, w8	
  82 00009a  16 00 20 	7:	MOV \#1, w6
  83              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 24
cert 0062a--Force Page Break
subtitle3 test main routine
  84 00009c  86 83 4A 		addc w5, w6, w7
  85 00009e  06 AC B8 		MUL\.US	w5, w6, w8	
  86 0000a0  16 00 20 		MOV \#1, w6
  87              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 25
cert 0062a--Force Page Break
subtitle3 test main routine
  88 0000a2  86 83 4A 	8:	addc w5, w6, w7
  89 0000a4  06 AC B8 		MUL\.US	w5, w6, w8
  90              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 26
cert 0062a--Force Page Break
subtitle3 test main routine
  91 0000a6  16 00 20 		MOV \#1, w6
  92 0000a8  86 83 4A 	9:	addc w5, w6, w7
  93 0000aa  06 AC B8 		MUL\.US	w5, w6, w8
  94              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 27
cert 0062a--Force Page Break
subtitle3 test main routine
  95              		
  96 0000ac  00 00 04 	0:	goto	main	
  96         00 00 00 
  97              	
  98              		\.eject
MPLAB ASM30 Listing:  .+cert0062a\.s 			page 28
cert 0062a--Force Page Break
subtitle3 test main routine
  99              	
 100              		
MPLAB ASM30 Listing:  .+cert0062a.s 			page 29
cert 0062a--Force Page Break
subtitle3 test main routine
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0062a.s:57     \.text:00000074 main
.+cert0062a.s:60     \.text:00000078 L11
.+cert0062a.s:64     \.text:0000007e L21
.+cert0062a.s:69     \.text:00000086 L31
.+cert0062a.s:72     \.text:0000008a L41
.+cert0062a.s:74     \.text:0000008e L51
.+cert0062a.s:78     \.text:00000094 L61
.+cert0062a.s:82     \.text:0000009a L71
.+cert0062a.s:88     \.text:000000a2 L81
.+cert0062a.s:92     \.text:000000a8 L91
.+cert0062a.s:96     \.text:000000ac L1
.+cert0062a.s:38     \.text:00000032 foo

UNDEFINED SYMBOLS
externdefine
main2

EQUATE SYMBOLS
                       __C30COFF = 0x1
