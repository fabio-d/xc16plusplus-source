#as:
#name: .else Conditional Else (negative)
#source: cert0063b.s



.*  .*cert0063b\.s 			page 1
cert0063b Conditional Else\(negative\)
subtitle1 test
   1              	
   2              		\.title cert0063b Conditional Else \(negative\)
   3              		\.sbttl subtitle1 test
   4              	
   5              		
   6              		\.data
   7                 	
   8                 		\.text
   9              		\.global main
  10 000000  00 00 04 		goto externdefine
  10         00 00 00 
  11 000004  00 00 04 		goto main2
  11         00 00 00 
  12 000008  00 00 04 		goto 1f
  12         00 00 00 
  13 00000c  00 00 04 		goto 2f
  13         00 00 00 
  14 000010  00 00 04 		goto 3f
  14         00 00 00 
  15 000014  00 00 04 		goto 4f
  15         00 00 00 
  16 000018  00 00 04 		goto 5f
  16         00 00 00 
  17 00001c  00 00 04 		goto 6f
  17         00 00 00 
  18 000020  00 00 04 		goto 7f
  18         00 00 00 
  19 000024  00 00 04 		goto 8f
  19         00 00 00 
  20 000028  00 00 04 		goto 9f
  20         00 00 00 
  21 00002c  00 00 04 		goto 0f
  21         00 00 00 
  22 000030  00 00 FF 		nopr
  23              		\.global foo
  24 000032  00 00 FF 	foo:	nopr
  25              	
  26              		\.if 1
  27 000034  54 68 00 		\.ascii "This string should assemble"
  27         69 73 00 
  27         20 73 00 
  27         74 72 00 
  27         69 6E 00 
  27         67 20 00 
  27         73 68 00 
  27         6F 75 00 
  27         6C 64 00 
  28              		\.else
  29              		\.ascii "This string should NOT assemble"
  30              		\.endif
  31            00 00 		
  32 000050  55 00 20 	main:	MOV #5, w5
  33 000052  16 00 20 		MOV #1, w6
  34 000054  86 83 4A 	1:	addc w5, w6, w7
  35 000056  06 AC B8 		MUL\.US	w5, w6, w8
  36 000058  16 00 20 		MOV #1, w6
  37 00005a  86 83 4A 	2:	addc w5, w6, w7
.*  .*cert0063b\.s 			page 2
cert0063b Conditional Else\(negative\)
subtitle1 test
  38 00005c  06 AC B8 		MUL\.US	w5, w6, w8
  39 00005e  16 00 20 		MOV #1, w6
  40 000060  86 83 4A 		addc w5, w6, w7
  41 000062  06 AC B8 	3:	MUL\.US	w5, w6, w8
  42 000064  16 00 20 		MOV #1, w6
  43 000066  86 83 4A 	4:	addc w5, w6, w7
  44 000068  06 AC B8 		MUL\.US	w5, w6, w8	
  45 00006a  16 00 20 	5:	MOV #1, w6
  46 00006c  86 83 4A 		addc w5, w6, w7
  47 00006e  06 AC B8 		MUL\.US	w5, w6, w8	
  48 000070  16 00 20 	6:	MOV #1, w6
  49 000072  86 83 4A 		addc w5, w6, w7
  50 000074  06 AC B8 		MUL\.US	w5, w6, w8	
  51 000076  16 00 20 	7:	MOV #1, w6
  52 000078  86 83 4A 		addc w5, w6, w7
  53 00007a  06 AC B8 		MUL\.US	w5, w6, w8	
  54 00007c  16 00 20 		MOV #1, w6
  55 00007e  86 83 4A 	8:	addc w5, w6, w7
  56 000080  06 AC B8 		MUL\.US	w5, w6, w8
  57 000082  16 00 20 		MOV #1, w6
  58 000084  86 83 4A 	9:	addc w5, w6, w7
  59 000086  06 AC B8 		MUL\.US	w5, w6, w8
  60              		
  61 000088  00 00 04 	0:	goto	main	
  61         00 00 00 
