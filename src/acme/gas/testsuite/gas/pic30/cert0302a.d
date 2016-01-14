#as:
#name: .int, Assemble Numbers that evaluate at runtime, text
#source: cert0302a.s




.*  .*cert0302a\.s 			page 1
cert0302 \.int Assemble Numbers that evaluate at runtime,text
subtitle1 test
   1              	
   2              		\.title cert0302 \.int Assemble Numbers that evaluate at runtime, text
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7                 	
   8                 	
   9                 		\.text
  10              	
  11              	main:
  12 000000  55 00 20 		MOV #5, w5
  13 000002  16 00 20 		MOV #1, w6	
  14 000004  86 83 4A 	1:	addc w5, w6, w7
  15 000006  06 AC B8 		MUL\.US	w5, w6, w8
  16 000008  16 00 20 		MOV #1, w6
  17 00000a  86 83 4A 	2:	addc w5, w6, w7
  18 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  19 00000e  16 00 20 		MOV #1, w6
  20 000010  86 83 4A 		addc w5, w6, w7
  21 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  22 000014  16 00 20 		MOV #1, w6
  23 000016  86 83 4A 	4:	addc w5, w6, w7
  24 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  25              	
  26              	
  27 00001a  04 00 00 		\.int 1\+3, 0xFF\+0x01, paddr\(main\) - 2
  27         00 00 00 
  27         00 01 00 
  27         00 00 00 
  27         FE FF 00 
  27         FF FF 00 
  28              	
  29 000026  00 00 37 		bra lb
  30              	
  31 000028  16 00 20 	5:	MOV #1, w6
  32 00002a  86 83 4A 		addc w5, w6, w7
  33 00002c  16 00 20 		MOV #1, w6
  34 00002e  06 AC B8 		MUL\.US	w5, w6, w8	
  35 000030  16 00 20 	6:	MOV #1, w6
  36 000032  86 83 4A 		addc w5, w6, w7
  37 000034  06 AC B8 		MUL\.US	w5, w6, w8	
  38              	
  39 000036  03 00 00 		\.int paddr\(5b\)\+3, 0xFF \+ 0xFE
  39         00 00 00 
  39         FD 01 00 
  39         00 00 00 
  40              	
  41 00003e  16 00 20 	7:	MOV #1, w6
  42 000040  86 83 4A 		addc w5, w6, w7
  43 000042  06 AC B8 		MUL\.US	w5, w6, w8	
  44 000044  16 00 20 		MOV #1, w6
  45 000046  86 83 4A 	8:	addc w5, w6, w7
  46 000048  06 AC B8 		MUL\.US	w5, w6, w8
  47 00004a  16 00 20 		MOV #1, w6
  48 00004c  86 83 4A 	9:	addc w5, w6, w7
  49 00004e  06 AC B8 		MUL\.US	w5, w6, w8
.*  .*cert0302a\.s 			page 2
cert0302 \.int Assemble Numbers that evaluate at runtime,text
subtitle1 test
  50              			
  51 000050  00 00 04 	0:	goto	main	
  51         00 00 00 
  52              		
  53              		\.end
