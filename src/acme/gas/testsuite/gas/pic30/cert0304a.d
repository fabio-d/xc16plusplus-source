#as: --no-warn
#name: .int, Assemble Numbers range, data
#source: cert0304a.s



.*  .*cert0304a\.s 			page 1
cert0304 \.int Assemble Numbers range,text
subtitle1 test
   1              		\.title cert0304 \.int Assemble Numbers range, text
   2              		\.sbttl subtitle1 test
   3              	
   4              		\.data
   5                 	
   6                 	
   7                 	
   8                 		
   9                 		\.text
  10              	main:
  11 000000  55 00 20 		MOV #5, w5
  12 000002  16 00 20 		MOV #1, w6	
  13 000004  86 83 4A 	1:	addc w5, w6, w7
  14 000006  06 AC B8 		MUL\.US	w5, w6, w8
  15 000008  16 00 20 		MOV #1, w6
  16 00000a  86 83 4A 	2:	addc w5, w6, w7
  17 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  18 00000e  16 00 20 		MOV #1, w6
  19 000010  86 83 4A 		addc w5, w6, w7
  20 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  21 000014  16 00 20 		MOV #1, w6
  22 000016  86 83 4A 	4:	addc w5, w6, w7
  23 000018  06 AC B8 		MUL\.US	w5, w6, w8	
  24 00001a  00 00 37 		bra lb
  25              	
  26 00001c  16 00 20 	5:	MOV #1, w6
  27 00001e  86 83 4A 		addc w5, w6, w7
  28 000020  16 00 20 		MOV #1, w6
  29 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  30 000024  16 00 20 	6:	MOV #1, w6
  31 000026  86 83 4A 		addc w5, w6, w7
  32 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  33              	
  34 00002a  FF FF 00 		\.int -1
  34         FF FF 00 
  35 00002e  FF FF 00 		\.int 0xFFFFFFFFF
  35         FF FF 00 
  36 000032  00 00 00 		\.int 0x100000000
  36         00 00 00 
  37 000036  FF FF 00 		\.int 0xFFFFFFFFFF
  37         FF FF 00 
  38 00003a  00 00 00 		\.int 0x1000000000
  38         00 00 00 
  39 00003e  01 00 00 		\.int 0x000000000001
  39         00 00 00 
  40 000042  90 78 00 		\.int 0x1234567890
  40         56 34 00 
  41              	
  42 000046  16 00 20 	7:	MOV #1, w6
  43 000048  86 83 4A 		addc w5, w6, w7
  44 00004a  06 AC B8 		MUL\.US	w5, w6, w8	
  45 00004c  16 00 20 		MOV #1, w6
  46 00004e  86 83 4A 	8:	addc w5, w6, w7
  47 000050  06 AC B8 		MUL\.US	w5, w6, w8
  48 000052  16 00 20 		MOV #1, w6
  49 000054  86 83 4A 	9:	addc w5, w6, w7
  50 000056  06 AC B8 		MUL\.US	w5, w6, w8
.*  .*cert0304a\.s 			page 2
cert0304 \.int Assemble Numbers range,text
subtitle1 test
  51              			
  52 000058  00 00 04 	0:	goto	main	
  52         00 00 00 
  53              		
  54              		\.end
