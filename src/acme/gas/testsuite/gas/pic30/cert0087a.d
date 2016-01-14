#as:
#name: .include directive functionality
#source: cert0087a.s


.*  .*cert0087a\.s 			page 1
cert0087 \.include
subtitle1 test
   1              	
   2              		\.title cert0087 \.include
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7                 		\.include "gas/pic30/cert0087ainc\.s"
   1                 	
   2 0000 54 68 69 73 		\.ascii "This string is from the include file\. "
   2      20 73 74 72 
   2      69 6E 67 20 
   2      69 73 20 66 
   2      72 6F 6D 20 
   2      74 68 65 20 
   2      69 6E 63 6C 
   2      75 64 65 20 
   2      66 69 6C 65 
   3 0026 49 66 20 79 		\.ascii "If you can see these strings, then the "
   3      6F 75 20 63 
   3      61 6E 20 73 
   3      65 65 20 74 
   3      68 65 73 65 
   3      20 73 74 72 
   3      69 6E 67 73 
   3      2C 20 74 68 
   3      65 6E 20 74 
   4 004d 2E 69 6E 63 		\.asciz "\.include directive was successful\."
   4      6C 75 64 65 
   4      20 64 69 72 
   4      65 63 74 69 
   4      76 65 20 77 
   4      61 73 20 73 
   4      75 63 63 65 
   4      73 73 66 75 
   4      6C 2E 00 
   5                 		
   6                 		
   8                 		
   9 0070 34 12       	hwd1:	\.hword	0x1234
  10                 	
  11                 		\.text
  12              	
  13              	main:
  14 000000  55 00 20 		MOV #5, w5
  15 000002  16 00 20 		MOV #1, w6	
  16 000004  86 83 4A 	1:	addc w5, w6, w7
  17 000006  06 AC B8 		MUL\.US	w5, w6, w8
  18 000008  16 00 20 		MOV #1, w6
  19 00000a  86 83 4A 	2:	addc w5, w6, w7
  20 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  21 00000e  16 00 20 		MOV #1, w6
  22 000010  86 83 4A 		addc w5, w6, w7
  23 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  24 000014  16 00 20 		MOV #1, w6
  25 000016  86 83 4A 	4:	addc w5, w6, w7
  26 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  27              	
.*  .*cert0087a\.s 			page 2
cert0087 \.include
subtitle1 test
  28 00001a  00 00 37 		bra lb
  29              	
  30 00001c  16 00 20 	5:	MOV #1, w6
  31 00001e  86 83 4A 		addc w5, w6, w7
  32 000020  16 00 20 		MOV #1, w6
  33 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  34 000024  16 00 20 	6:	MOV #1, w6
  35 000026  86 83 4A 		addc w5, w6, w7
  36 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  37              		
  38 00002a  DC FE 00 	hwd2:	\.hword	0xFEDC
  39 00002c  F0 C3 00 	hwd3:	\.hword	0b1100001111110000
  40              	
  41              	
  42 00002e  16 00 20 	7:	MOV #1, w6
  43 000030  86 83 4A 		addc w5, w6, w7
  44 000032  06 AC B8 		MUL\.US	w5, w6, w8	
  45 000034  16 00 20 		MOV #1, w6
  46 000036  86 83 4A 	8:	addc w5, w6, w7
  47 000038  06 AC B8 		MUL\.US	w5, w6, w8
  48 00003a  16 00 20 		MOV #1, w6
  49 00003c  86 83 4A 	9:	addc w5, w6, w7
  50 00003e  06 AC B8 		MUL\.US	w5, w6, w8
  51              			
  52 000040  00 00 04 	0:	goto	main	
  52         00 00 00 
  53              		
  54              		\.end
