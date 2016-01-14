#as:
#name: .int, Assemble Numbers limits, text
#source: cert0303a.s




.*  .*cert0303a\.s 			page 1
cert0303 \.int Assemble Numbers limits,text
subtitle1 test
   1              	
   2              		\.title cert0303 \.int Assemble Numbers limits, text
   3              		\.sbttl subtitle1 test
   4              	
   5              		\.data
   6                 	
   7                 		
   8                 		\.text
   9              	
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
  24              	
  25 00001a  00 00 00 		\.int 1-1, 0-0, -1\+1
  25         00 00 00 
  25         00 00 00 
  25         00 00 00 
  25         00 00 00 
  25         00 00 00 
  26 000026  FF FF 00 		\.int 0xFFFE\+1, 1\+0xFFFE
  26         00 00 00 
  26         FF FF 00 
  26         00 00 00 
  27 00002e  00 00 00 		\.int 0xFFFF - 0xFFFF
  27         00 00 00 
  28 000032  FF 00 00 		\.int 0xFF
  28         00 00 00 
  29 000036  00 01 00 		\.int 0xFF \+ 1	
  29         00 00 00 
  30              	
  31 00003a  00 00 37 		bra lb
  32              	
  33 00003c  16 00 20 	5:	MOV #1, w6
  34 00003e  86 83 4A 		addc w5, w6, w7
  35 000040  16 00 20 		MOV #1, w6
  36 000042  06 AC B8 		MUL\.US	w5, w6, w8	
  37 000044  16 00 20 	6:	MOV #1, w6
  38 000046  86 83 4A 		addc w5, w6, w7
  39 000048  06 AC B8 		MUL\.US	w5, w6, w8	
  40              	
  41 00004a  FE FF 00 		\.int 0xFFFE
  41         00 00 00 
  42 00004e  FF FF 00 		\.int 0xFFFE \+ 1	
  42         00 00 00 
  43 000052  FF FF 00 		\.int 0xFFFF
  43         00 00 00 
.*  .*cert0303a\.s 			page 2
cert0303 \.int Assemble Numbers limits,text
subtitle1 test
  44              		
  45 000056  00 00 00 		\.int 0xFFFF \+ 1
  45         01 00 00 
  46              		
  47 00005a  00 00 00 		\.int 0
  47         00 00 00 
  48              		
  49 00005e  FF FF 00 		\.int -1
  49         FF FF 00 
  50              		
  51 000062  FF FF 00 		\.int 0xFFFFFFFE \+ 1
  51         FF FF 00 
  52 000066  FF FF 00 		\.int 0xFFFFFFFF
  52         FF FF 00 
  53 00006a  FF FF 00 		\.int 0x10000000 - 1
  53         FF 0F 00 
  54              	
  55 00006e  16 00 20 	7:	MOV #1, w6
  56 000070  86 83 4A 		addc w5, w6, w7
  57 000072  06 AC B8 		MUL\.US	w5, w6, w8	
  58 000074  16 00 20 		MOV #1, w6
  59 000076  86 83 4A 	8:	addc w5, w6, w7
  60 000078  06 AC B8 		MUL\.US	w5, w6, w8
  61 00007a  16 00 20 		MOV #1, w6
  62 00007c  86 83 4A 	9:	addc w5, w6, w7
  63 00007e  06 AC B8 		MUL\.US	w5, w6, w8
  64              			
  65 000080  00 00 04 	0:	goto	main	
  65         00 00 00 
  66              		
  67              		\.end
