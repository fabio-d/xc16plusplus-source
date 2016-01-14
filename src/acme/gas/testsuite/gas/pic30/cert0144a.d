MPLAB ASM30 Listing:  \./\./gas/pic30/cert0144a\.s 			page 1
cert tests
subtitle1 test
   1              		\.title cert tests
   2              		\.sbttl subtitle1 test
   3              		\.list
   4              	
   5              		\.data
   6 0000 00 00 00 10 	long1:	\.long	0x10000000
   7                 	
   8 0004 00 10 00 00 	int1:	\.int	0x1000
   9                 	
  10                 		\.text
  11              		
  12              	main:
  13 000000  55 00 20 		MOV #5, w5
  14 000002  16 00 20 		MOV #1, w6
  15              	1:	
  16 000004  86 83 4A 		addc w5, w6, w7
  17 000006  06 AC B8 		MUL\.US	w5, w6, w8
  18 000008  16 00 20 		MOV #1, w6
  19              		
  20              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0144a\.s 			page 2
cert test second title
subtitle on page 2
  21              		\.title cert test second title
  22              		\.sbttl subtitle on page 2
  23              		
  24 00000a  86 83 4A 	2:	addc w5, w6, w7
  25 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  26              		
  27 00000e  16 00 20 		MOV #1, w6
  28 000010  86 83 4A 		addc w5, w6, w7
  29 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  30 000014  16 00 20 		MOV #1, w6
  31 000016  86 83 4A 	4:	addc w5, w6, w7
  32 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  33 00001a  00 00 37 		bra 4b
  34              	
  35              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0144a\.s 			page 3
cert test second title
subtitle on page 3
  36              		\.sbttl subtitle on page 3
  37              	
  38 00001c  16 00 20 	5:	MOV #1, w6
  39 00001e  86 83 4A 		addc w5, w6, w7
  40 000020  16 00 20 		MOV #1, w6
  41 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  42              		
  43 000024  16 00 20 	6:	MOV #1, w6
  44 000026  86 83 4A 		addc w5, w6, w7
  45              		
  46              		\.title This title starts on page 4
  47              		
  48 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  49 00002a  01 04 78 		MOV	w1, w8
  50              		
  51 00002c  F5 A9 2F 		MOV #64159, w5
  52 00002e  16 00 20 	7:	MOV #1, w6
  53 000030  86 83 4A 		addc w5, w6, w7
  54 000032  06 AC B8 		MUL\.US	w5, w6, w8	
  55 000034  16 00 20 		MOV #1, w6
  56              		
  57              		\.eject
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0144a\.s 			page 4
This title starts on page 4
subtitle on page 4
  58              		\.sbttl subtitle on page 4
  59              		
  60 000036  86 83 4A 	8:	addc w5, w6, w7
  61 000038  06 AC B8 		MUL\.US	w5, w6, w8
  62 00003a  16 00 20 		MOV #1, w6
  63 00003c  86 83 4A 	9:	addc w5, w6, w7
  64 00003e  06 AC B8 		MUL\.US	w5, w6, w8
  65 000040  00 00 04 	0:	goto	main	
  65         00 00 00 
  66              			
  67              		\.end
MPLAB ASM30 Listing:  \./\./gas/pic30/cert0144a\.s 			page 5
This title starts on page 4
subtitle on page 4
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
\./\./gas/pic30/cert0144a\.s:6      \.data:00000000 long1
\./\./gas/pic30/cert0144a\.s:8      \.data:00000004 int1
\./\./gas/pic30/cert0144a\.s:12     \.text:00000000 main
\./\./gas/pic30/cert0144a\.s:15     \.text:00000004 L11
\./\./gas/pic30/cert0144a\.s:24     \.text:0000000a L21
\./\./gas/pic30/cert0144a\.s:29     \.text:00000012 L31
\./\./gas/pic30/cert0144a\.s:31     \.text:00000016 L41
\./\./gas/pic30/cert0144a\.s:38     \.text:0000001c L51
\./\./gas/pic30/cert0144a\.s:43     \.text:00000024 L61
\./\./gas/pic30/cert0144a\.s:52     \.text:0000002e L71
\./\./gas/pic30/cert0144a\.s:60     \.text:00000036 L81
\./\./gas/pic30/cert0144a\.s:63     \.text:0000003c L91
\./\./gas/pic30/cert0144a\.s:65     \.text:00000040 L1

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
