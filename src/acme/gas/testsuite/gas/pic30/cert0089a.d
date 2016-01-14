#as:
#name: .int, Assemble Numbers limits, data
#source: cert0089a.s




.*  .*cert0089a\.s 			page 1
cert0089 \.int Assemble Numbers limits,data
subtitle1 test
   1              	
   2              		\.title cert0089 \.int Assemble Numbers limits, data
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7 0000 00 00 00 00 		\.int 1-1, 0-0, -1\+1
   7      00 00 00 00 
   7      00 00 00 00 
   8 000c FF FF FF FF 		\.int 0xFFFFFFFE\+1, 1\+0xFFFFFFFE
   8      FF FF FF FF 
   9 0014 00 00 00 00 		\.int 0xFFFFFFFF - 0xFFFFFFFF
  10 0018 FF 00 00 00 		\.int 0xFF
  11 001c 00 01 00 00 		\.int 0xFF \+ 1	
  12 0020 FF FF 00 00 		\.int 0xFFFF
  13 0024 00 00 01 00 		\.int 0xFFFF \+ 1	
  14 0028 FF FF FF 00 		\.int 0xFFFFFF
  15 002c 00 00 00 01 		\.int 0xFFFFFF \+ 1	
  16 0030 FE FF FF 00 		\.int 0xFFFFFF - 1
  17 0034 FF FF FF FF 		\.int 0xFFFFFFFF
  18                 		
  19                 		\.text
  20              	
  21              	main:
  22 000000  55 00 20 		MOV #5, w5
  23 000002  16 00 20 		MOV #1, w6	
  24 000004  86 83 4A 	1:	addc w5, w6, w7
  25 000006  06 AC B8 		MUL\.US	w5, w6, w8
  26 000008  16 00 20 		MOV #1, w6
  27 00000a  86 83 4A 	2:	addc w5, w6, w7
  28 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  29 00000e  16 00 20 		MOV #1, w6
  30 000010  86 83 4A 		addc w5, w6, w7
  31 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  32 000014  16 00 20 		MOV #1, w6
  33 000016  86 83 4A 	4:	addc w5, w6, w7
  34 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  35              	
  36 00001a  00 00 37 		bra lb
  37              	
  38 00001c  16 00 20 	5:	MOV #1, w6
  39 00001e  86 83 4A 		addc w5, w6, w7
  40 000020  16 00 20 		MOV #1, w6
  41 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  42 000024  16 00 20 	6:	MOV #1, w6
  43 000026  86 83 4A 		addc w5, w6, w7
  44 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  45              	
  46 00002a  16 00 20 	7:	MOV #1, w6
  47 00002c  86 83 4A 		addc w5, w6, w7
  48 00002e  06 AC B8 		MUL\.US	w5, w6, w8	
  49 000030  16 00 20 		MOV #1, w6
  50 000032  86 83 4A 	8:	addc w5, w6, w7
  51 000034  06 AC B8 		MUL\.US	w5, w6, w8
  52 000036  16 00 20 		MOV #1, w6
  53 000038  86 83 4A 	9:	addc w5, w6, w7
  54 00003a  06 AC B8 		MUL\.US	w5, w6, w8
.*  .*cert0089a\.s 			page 2
cert0089 \.int Assemble Numbers limits,data
subtitle1 test
  55              			
  56 00003c  00 00 04 	0:	goto	main	
  56         00 00 00 
  57              		
  58              		\.end
