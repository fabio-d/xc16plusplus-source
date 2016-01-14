MPLAB ASM30 Listing:  \./\./gas/pic30/cert0125a\.s 			page 1
cert0125
subtitle1 test
   1              		\.title cert0125
   2              		\.sbttl subtitle1 test
   3              		\.list
   4              		\.data
   5 0000 00 00 00 10 	long1:	\.long	0x10000000
   6 0004 00 10 00 00 	int1:	\.int	0x1000
   7 0008 00 00 00 20 	long2:	\.long	0x20000000
   8 000c 00 20 00 00 	int2:	\.int	0x2000
   9 0010 00 00 00 30 	long3:	\.long	0x30000000
  10 0014 00 30 00 00 	int3:	\.int	0x3000
  11                 	
  12                 		\.text
  13              	main:
  14 000000  55 00 20 		MOV #5, w5
  15 000002  16 00 20 		MOV #1, w6
  16              	1:	
  17 000004  86 83 4A 		addc w5, w6, w7
  18 000006  06 AC B8 		MUL\.US	w5, w6, w8
  19 000008  16 00 20 		MOV #1, w6
  20              		
  21              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0125a\.s 			page 2
cert0125
subtitle on page 2
  22              		\.sbttl subtitle on page 2
  23              		
  24 00000a  86 83 4A 	2:	addc w5, w6, w7
  25 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  26 00000e  16 00 20 		MOV #1, w6
  27 000010  86 83 4A 		addc w5, w6, w7
  28 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  29 000014  16 00 20 		MOV #1, w6
  30 000016  86 83 4A 	4:	addc w5, w6, w7
  31 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  32 00001a  00 00 37 		bra 1b
  33              		
  34              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0125a\.s 			page 3
cert0125
subtitle on page 3
  35              		\.sbttl subtitle on page 3
  36              		
  37 00001c  16 00 20 	5:	MOV #1, w6
  38 00001e  86 83 4A 		addc w5, w6, w7
  39 000020  16 00 20 		MOV #1, w6
  40 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  41              		
  42              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0125a\.s 			page 4
cert0125
subtitle on page 3
  43              		
  44 000024  16 00 20 	6:	MOV #1, w6
  45 000026  86 83 4A 		addc w5, w6, w7
  46 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  47 00002a  01 04 78 		MOV	w1, w8
  48 00002c  F5 A9 2F 		MOV #64159, w5
  49 00002e  16 00 20 	7:	MOV #1, w6
  50 000030  86 83 4A 		addc w5, w6, w7
  51 000032  06 AC B8 		MUL\.US	w5, w6, w8	
  52 000034  16 00 20 		MOV #1, w6
  53              		
  54              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0125a\.s 			page 5
cert0125
subtitle on page 4
  55              		\.sbttl subtitle on page 4
  56              		
  57 000036  86 83 4A 	8:	addc w5, w6, w7
  58              	
  59 000038  06 AC B8 		MUL\.US	w5, w6, w8
  60 00003a  16 00 20 		MOV #1, w6
  61 00003c  86 83 4A 	9:	addc w5, w6, w7
  62 00003e  06 AC B8 		MUL\.US	w5, w6, w8
  63              		
  64 000040  00 00 04 	0:	goto	main	
  64         00 00 00 
  65              			
  66              		\.end
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0125a\.s 			page 6
cert0125
subtitle on page 4
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
\./\./gas/pic30/cert0125a\.s:5      \.data:00000000 long1
\./\./gas/pic30/cert0125a\.s:6      \.data:00000004 int1
\./\./gas/pic30/cert0125a\.s:7      \.data:00000008 long2
\./\./gas/pic30/cert0125a\.s:8      \.data:0000000c int2
\./\./gas/pic30/cert0125a\.s:9      \.data:00000010 long3
\./\./gas/pic30/cert0125a\.s:10     \.data:00000014 int3
\./\./gas/pic30/cert0125a\.s:13     \.text:00000000 main
\./\./gas/pic30/cert0125a\.s:16     \.text:00000004 L11
\./\./gas/pic30/cert0125a\.s:24     \.text:0000000a L21
\./\./gas/pic30/cert0125a\.s:28     \.text:00000012 L31
\./\./gas/pic30/cert0125a\.s:30     \.text:00000016 L41
\./\./gas/pic30/cert0125a\.s:37     \.text:0000001c L51
\./\./gas/pic30/cert0125a\.s:44     \.text:00000024 L61
\./\./gas/pic30/cert0125a\.s:49     \.text:0000002e L71
\./\./gas/pic30/cert0125a\.s:57     \.text:00000036 L81
\./\./gas/pic30/cert0125a\.s:61     \.text:0000003c L91
\./\./gas/pic30/cert0125a\.s:64     \.text:00000040 L1

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
