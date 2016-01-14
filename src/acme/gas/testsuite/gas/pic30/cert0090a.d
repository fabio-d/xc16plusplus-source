#as: --no-warn
#name: \.int, Assemble Numbers range, data
#source: cert0090a\.s



.*  .*cert0090a\.s 			page 1
cert0090 \.int Assemble Numbers range,data
subtitle1 test
   1              	
   2              		\.title cert0090 \.int Assemble Numbers range, data
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7                 	
   8 0000 FF FF FF FF 		\.int -1
   9 0004 FF FF FF FF 		\.int 0xFFFFFFFFF
  10 0008 00 00 00 00 		\.int 0x100000000
  11 000c FF FF FF FF 		\.int 0xFFFFFFFFFF
  12 0010 00 00 00 00 		\.int 0x1000000000
  13 0014 01 00 00 00 		\.int 0x000000000001
  14 0018 90 78 56 34 		\.int 0x1234567890
  15                 		
  16                 		\.text
  17              	
  18              	main:
  19 000000  55 00 20 		MOV #5, w5
  20 000002  16 00 20 		MOV #1, w6	
  21 000004  86 83 4A 	1:	addc w5, w6, w7
  22 000006  06 AC B8 		MUL\.US	w5, w6, w8
  23 000008  16 00 20 		MOV #1, w6
  24 00000a  86 83 4A 	2:	addc w5, w6, w7
  25 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  26 00000e  16 00 20 		MOV #1, w6
  27 000010  86 83 4A 		addc w5, w6, w7
  28 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  29 000014  16 00 20 		MOV #1, w6
  30 000016  86 83 4A 	4:	addc w5, w6, w7
  31 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  32              	
  33              	
  34              	
  35 00001a  00 00 37 		bra lb
  36              	
  37 00001c  16 00 20 	5:	MOV #1, w6
  38 00001e  86 83 4A 		addc w5, w6, w7
  39 000020  16 00 20 		MOV #1, w6
  40 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  41 000024  16 00 20 	6:	MOV #1, w6
  42 000026  86 83 4A 		addc w5, w6, w7
  43 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  44              	
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
  55              			
  56 00003c  00 00 04 	0:	goto	main	
  56         00 00 00 
.*  .*cert0090a\.s 			page 2
cert0090 \.int Assemble Numbers range,data
subtitle1 test
  57              		
  58              		\.end
