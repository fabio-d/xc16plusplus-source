#as:
#name: .int, Assemble Numbers that evaluate at runtime, data
#source: cert0088a.s




.*  .*cert0088a\.s 			page 1
cert0088 \.int Assemble Numbers that evaluate at runtime
subtitle1 test
   1              	
   2              		\.title cert0088 \.int Assemble Numbers that evaluate at runtime
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7 0000 04 00 00 00 		\.int 1\+3, 0xFF\+0x01, paddr\(main\) - 2
   7      00 01 00 00 
   7      FE FF FF FF 
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
  26 00001a  00 00 37 		bra lb
  27              	
  28 00001c  16 00 20 	5:	MOV #1, w6
  29 00001e  86 83 4A 		addc w5, w6, w7
  30 000020  16 00 20 		MOV #1, w6
  31 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  32 000024  16 00 20 	6:	MOV #1, w6
  33 000026  86 83 4A 		addc w5, w6, w7
  34 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  35              	
  36 00002a  16 00 20 	7:	MOV #1, w6
  37 00002c  86 83 4A 		addc w5, w6, w7
  38 00002e  06 AC B8 		MUL\.US	w5, w6, w8	
  39 000030  16 00 20 		MOV #1, w6
  40 000032  86 83 4A 	8:	addc w5, w6, w7
  41 000034  06 AC B8 		MUL\.US	w5, w6, w8
  42 000036  16 00 20 		MOV #1, w6
  43 000038  86 83 4A 	9:	addc w5, w6, w7
  44 00003a  06 AC B8 		MUL\.US	w5, w6, w8
  45              			
  46 00003c  00 00 04 	0:	goto	main	
  46         00 00 00 
  47              		
  48              		\.end
