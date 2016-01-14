#as:
#name: .if Conditional Compilation functionality
#source: cert0083a.s

MPLAB ASM30 Listing:  .+cert0083a\.s 			page 1
cert0083 Conditional Compilation
subtitle1 test
   1              	
   2              		\.title cert0083 Conditional Compilation
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7                 	
   8                 	
   9                 		\.text
  10              	
  11              	main:
  12              	
  13              	\.if 0
  14              		\.asciz \"This section should NOT compile\"
  15              	\.endif
  16              	
  17              	\.if 1
  18 000000  54 68 00 		\.asciz \"This section SHOULD compile\"
  18         69 73 00 
  18         20 73 00 
  18         65 63 00 
  18         74 69 00 
  18         6F 6E 00 
  18         20 53 00 
  18         48 4F 00 
  18         55 4C 00 
  19              	\.endif	
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
  36              	
  37              	
  38 000038  34 12 00 	hwd1:	\.hword	0x1234
  39              	
  40 00003a  16 00 20 	5:	MOV \#1, w6
  41 00003c  86 83 4A 		addc w5, w6, w7
  42 00003e  16 00 20 		MOV \#1, w6
  43 000040  06 AC B8 		MUL\.US	w5, w6, w8	
  44 000042  16 00 20 	6:	MOV \#1, w6
  45 000044  86 83 4A 		addc w5, w6, w7
  46 000046  06 AC B8 		MUL\.US	w5, w6, w8	
  47              		
  48 000048  DC FE 00 	hwd2:	\.hword	0xFEDC
  49 00004a  F0 C3 00 	hwd3:	\.hword	0b1100001111110000
MPLAB ASM30 Listing:  .+cert0083a\.s 			page 2
cert0083 Conditional Compilation
subtitle1 test
  50              	
  51              	
  52 00004c  16 00 20 	7:	MOV \#1, w6
  53 00004e  86 83 4A 		addc w5, w6, w7
  54 000050  06 AC B8 		MUL\.US	w5, w6, w8	
  55 000052  16 00 20 		MOV \#1, w6
  56 000054  86 83 4A 	8:	addc w5, w6, w7
  57 000056  06 AC B8 		MUL\.US	w5, w6, w8
  58 000058  16 00 20 		MOV \#1, w6
  59 00005a  86 83 4A 	9:	addc w5, w6, w7
  60 00005c  06 AC B8 		MUL\.US	w5, w6, w8
  61              			
  62 00005e  00 00 04 	0:	goto	main	
  62         00 00 00 
  63              		
  64              		\.end
MPLAB ASM30 Listing:  .+cert0083a\.s 			page 3
cert0083 Conditional Compilation
subtitle1 test
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0083a\.s:11     \.text:00000000 main
.+cert0083a\.s:23     \.text:00000020 L11
.+cert0083a\.s:26     \.text:00000026 L21
.+cert0083a\.s:30     \.text:0000002e L31
.+cert0083a\.s:32     \.text:00000032 L41
.+cert0083a\.s:38     \.text:00000038 hwd1
.+cert0083a\.s:39     \.text:0000003a L51
.+cert0083a\.s:44     \.text:00000042 L61
.+cert0083a\.s:48     \.text:00000048 hwd2
.+cert0083a\.s:49     \.text:0000004a hwd3
.+cert0083a\.s:51     \.text:0000004c L71
.+cert0083a\.s:56     \.text:00000054 L81
.+cert0083a\.s:59     \.text:0000005a L91
.+cert0083a\.s:62     \.text:0000005e L1

UNDEFINED SYMBOLS
lb
EQUATE SYMBOLS
                       __C30COFF = 0x1
