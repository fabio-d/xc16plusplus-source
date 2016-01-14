#as:
#name: .ifdef Conditional Compilation functionality
#source: cert0084a.s

MPLAB ASM30 Listing:  .+cert0084a\.s 			page 1
cert0084 ifdef Conditional Compilation
subtitle1 test
   1              	
   2              		\.title cert0084 ifdef Conditional Compilation
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7 0000 34 12       	hwd1:	\.hword	0x1234
   8                 	
   9                 		\.text
  10              	
  11              	main:
  12              	
  13              	
  14              	
  15              	\.ifdef hwd1
  16 000000  54 68 00 		\.asciz \"This section SHOULD compile\"
  16         69 73 00 
  16         20 73 00 
  16         65 63 00 
  16         74 69 00 
  16         6F 6E 00 
  16         20 53 00 
  16         48 4F 00 
  16         55 4C 00 
  17              	\.endif	
  18              	
  19              	
  20              	
  21 00001c  55 00 20 		MOV \#5, w5
  22 00001e  16 00 20 		MOV \#1, w6	
  23 000020  86 83 4A 	1:	addc w5, w6, w7
  24 000022  06 AC B8 		MUL\.US	w5, w6, w8
  25 000024  16 00 20 		MOV \#1, w6
  26 000026  86 83 4A 	2:	addc w5, w6, w7
  27 000028  06 AC B8 		MUL\.US	w5, w6, w8
  28 00002a  16 00 20 		MOV \#1, w6
  29 00002c  86 83 4A 		addc w5, w6, w7
  30 00002e  06 AC B8 	3:	MUL\.US	w5, w6, w8
  31 000030  16 00 20 		MOV \#1, w6
  32 000032  86 83 4A 	4:	addc w5, w6, w7
  33 000034  06 AC B8 		MUL\.US	w5, w6, w8	
  34              	
  35 000036  00 00 37 		bra lb
  36              	\.ifdef undefsym
  37              		\.asciz \"This section should NOT compile\"
  38              	\.endif
  39              	
  40              	
  41 000038  16 00 20 	5:	MOV \#1, w6
  42 00003a  86 83 4A 		addc w5, w6, w7
  43 00003c  16 00 20 		MOV \#1, w6
  44 00003e  06 AC B8 		MUL\.US	w5, w6, w8	
  45 000040  16 00 20 	6:	MOV \#1, w6
  46 000042  86 83 4A 		addc w5, w6, w7
  47 000044  06 AC B8 		MUL\.US	w5, w6, w8	
  48              		
  49 000046  DC FE 00 	hwd2:	\.hword	0xFEDC
MPLAB ASM30 Listing:  .+cert0084a\.s 			page 2
cert0084 ifdef Conditional Compilation
subtitle1 test
  50 000048  F0 C3 00 	hwd3:	\.hword	0b1100001111110000
  51              	
  52              	
  53 00004a  16 00 20 	7:	MOV \#1, w6
  54 00004c  86 83 4A 		addc w5, w6, w7
  55 00004e  06 AC B8 		MUL\.US	w5, w6, w8	
  56 000050  16 00 20 		MOV \#1, w6
  57 000052  86 83 4A 	8:	addc w5, w6, w7
  58 000054  06 AC B8 		MUL\.US	w5, w6, w8
  59 000056  16 00 20 		MOV \#1, w6
  60 000058  86 83 4A 	9:	addc w5, w6, w7
  61 00005a  06 AC B8 		MUL\.US	w5, w6, w8
  62              			
  63 00005c  00 00 04 	0:	goto	main	
  63         00 00 00 
  64              		
  65              		\.end
MPLAB ASM30 Listing:  .+cert0084a\.s 			page 3
cert0084 ifdef Conditional Compilation
subtitle1 test
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0084a\.s:7      \.data:00000000 hwd1
.+cert0084a\.s:11     \.text:00000000 main
.+cert0084a\.s:23     \.text:00000020 L11
.+cert0084a\.s:26     \.text:00000026 L21
.+cert0084a\.s:30     \.text:0000002e L31
.+cert0084a\.s:32     \.text:00000032 L41
.+cert0084a\.s:41     \.text:00000038 L51
.+cert0084a\.s:45     \.text:00000040 L61
.+cert0084a\.s:49     \.text:00000046 hwd2
.+cert0084a\.s:50     \.text:00000048 hwd3
.+cert0084a\.s:52     \.text:0000004a L71
.+cert0084a\.s:57     \.text:00000052 L81
.+cert0084a\.s:60     \.text:00000058 L91
.+cert0084a\.s:63     \.text:0000005c L1

UNDEFINED SYMBOLS
lb

EQUATE SYMBOLS
                       __C30COFF = 0x1
