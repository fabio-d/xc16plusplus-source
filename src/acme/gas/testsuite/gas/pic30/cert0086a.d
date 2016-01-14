#as:
#name: .ifnotdef Conditional Compilation functionality
#source: cert0086a.s


.*  .*cert0086a\.s 			page 1
cert0086 ifnotdef Conditional Compilation
subtitle1 test
   1              	
   2              		\.title cert0086 ifnotdef Conditional Compilation
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
  15              	\.ifnotdef hwd1
  16              		\.asciz "This section should NOT compile"
  17              	\.endif	
  18              	
  19              	\.ifndef hwd1
  20              		\.asciz "This second section should NOT compile"
  21              	\.endif	
  22              	
  23              	
  24              	
  25 000000  55 00 20 		MOV #5, w5
  26 000002  16 00 20 		MOV #1, w6	
  27 000004  86 83 4A 	1:	addc w5, w6, w7
  28 000006  06 AC B8 		MUL\.US	w5, w6, w8
  29 000008  16 00 20 		MOV #1, w6
  30 00000a  86 83 4A 	2:	addc w5, w6, w7
  31 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  32 00000e  16 00 20 		MOV #1, w6
  33 000010  86 83 4A 		addc w5, w6, w7
  34 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  35 000014  16 00 20 		MOV #1, w6
  36 000016  86 83 4A 	4:	addc w5, w6, w7
  37 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  38              	
  39 00001a  00 00 37 		bra lb
  40              	\.ifndef undefsym
  41 00001c  54 68 00 		\.asciz "This section SHOULD compile"
  41         69 73 00 
  41         20 73 00 
  41         65 63 00 
  41         74 69 00 
  41         6F 6E 00 
  41         20 53 00 
  41         48 4F 00 
  41         55 4C 00 
  42              	\.endif
  43              	
  44              	\.ifnotdef undefsym
  45 000038  54 68 00 		\.asciz "This second section SHOULD compile"
  45         69 73 00 
  45         20 73 00 
  45         65 63 00 
  45         6F 6E 00 
.*  .*cert0086a\.s 			page 2
cert0086 ifnotdef Conditional Compilation
subtitle1 test
  45         64 20 00 
  45         73 65 00 
  45         63 74 00 
  45         69 6F 00 
  46              	\.endif
  47              	
  48            00 00 	
  49 00005c  16 00 20 	5:	MOV #1, w6
  50 00005e  86 83 4A 		addc w5, w6, w7
  51 000060  16 00 20 		MOV #1, w6
  52 000062  06 AC B8 		MUL\.US	w5, w6, w8	
  53 000064  16 00 20 	6:	MOV #1, w6
  54 000066  86 83 4A 		addc w5, w6, w7
  55 000068  06 AC B8 		MUL\.US	w5, w6, w8	
  56              		
  57 00006a  DC FE 00 	hwd2:	\.hword	0xFEDC
  58 00006c  F0 C3 00 	hwd3:	\.hword	0b1100001111110000
  59              	
  60              	
  61 00006e  16 00 20 	7:	MOV #1, w6
  62 000070  86 83 4A 		addc w5, w6, w7
  63 000072  06 AC B8 		MUL\.US	w5, w6, w8	
  64 000074  16 00 20 		MOV #1, w6
  65 000076  86 83 4A 	8:	addc w5, w6, w7
  66 000078  06 AC B8 		MUL\.US	w5, w6, w8
  67 00007a  16 00 20 		MOV #1, w6
  68 00007c  86 83 4A 	9:	addc w5, w6, w7
  69 00007e  06 AC B8 		MUL\.US	w5, w6, w8
  70              			
  71 000080  00 00 04 	0:	goto	main	
  71         00 00 00 
  72              		
  73              		\.end
