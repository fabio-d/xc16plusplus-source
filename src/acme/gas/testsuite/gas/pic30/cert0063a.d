#as:
#name: .else Conditional Else
#source: cert0063a.s



.*  .*cert0063a\.s 			page 1
cert0063a Conditional Else
subtitle1 test
   1              	
   2              		\.title cert0063a Conditional Else
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
.*  .*cert0063a\.s 			page 2
cert0063a Conditional Else
subtitle1 test
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
.*  .*cert0063a\.s 			page 3
cert0063a Conditional Else
subtitle1 test
  23              		\.global foo
  24 000032  00 00 FF 	foo:	nopr
  25              	
  26              		\.if 0
  27              		\.ascii "This string should NOT assemble"
  28              		\.else
  29 000034  54 68 00 		\.ascii "This string should assemble"
  29         69 73 00 
  29         20 73 00 
  29         74 72 00 
  29         69 6E 00 
  29         67 20 00 
  29         73 68 00 
  29         6F 75 00 
  29         6C 64 00 
  30              		\.endif
  31              	
.*  .*cert0063a\.s 			page 4
cert0063a Conditional Else
subtitle1 test
  32            54 00 		\.ascii "Test of listing continuation lines\.\\n"
  32 000050  65 73 00 
  32         74 20 00 
  32         6F 66 00 
  32         20 6C 00 
  32         69 73 00 
  32         74 69 00 
  32         6E 67 00 
  32         20 63 00 
  33              	
  34              		\.if 0
  35              		\.ascii "This ascii string is within a false conditional"
  36              		\.endif
  37              		\.sbttl subtitle2 test
  38            52 00 		\.ascii "Resume listing in list file\."
  38 000074  65 73 00 
  38         75 6D 00 
.*  .*cert0063a\.s 			page 5
cert0063a Conditional Else
subtitle3 test main routine
  38         65 20 00 
  38         6C 69 00 
  38         73 74 00 
  38         69 6E 00 
  38         67 20 00 
  38         69 6E 00 
  39              		\.sbttl subtitle3 test main routine
  40              		\.psize 20
  41            00 00 		
  42 000090  55 00 20 	main:	MOV #5, w5
  43 000092  16 00 20 		MOV #1, w6
  44 000094  86 83 4A 	1:	addc w5, w6, w7
  45 000096  06 AC B8 		MUL\.US	w5, w6, w8
  46 000098  16 00 20 		MOV #1, w6
  47 00009a  86 83 4A 	2:	addc w5, w6, w7
  48 00009c  06 AC B8 		MUL\.US	w5, w6, w8
  49 00009e  16 00 20 		MOV #1, w6
.*  .*cert0063a\.s 			page 6
cert0063a Conditional Else
subtitle3 test main routine
  50 0000a0  86 83 4A 		addc w5, w6, w7
  51 0000a2  06 AC B8 	3:	MUL\.US	w5, w6, w8
  52 0000a4  16 00 20 		MOV #1, w6
  53 0000a6  86 83 4A 	4:	addc w5, w6, w7
  54 0000a8  06 AC B8 		MUL\.US	w5, w6, w8	
  55 0000aa  16 00 20 	5:	MOV #1, w6
  56 0000ac  86 83 4A 		addc w5, w6, w7
  57 0000ae  06 AC B8 		MUL\.US	w5, w6, w8	
  58 0000b0  16 00 20 	6:	MOV #1, w6
  59 0000b2  86 83 4A 		addc w5, w6, w7
  60 0000b4  06 AC B8 		MUL\.US	w5, w6, w8	
  61 0000b6  16 00 20 	7:	MOV #1, w6
  62 0000b8  86 83 4A 		addc w5, w6, w7
  63 0000ba  06 AC B8 		MUL\.US	w5, w6, w8	
  64 0000bc  16 00 20 		MOV #1, w6
  65 0000be  86 83 4A 	8:	addc w5, w6, w7
  66 0000c0  06 AC B8 		MUL\.US	w5, w6, w8
.*  .*cert0063a\.s 			page 7
cert0063a Conditional Else
subtitle3 test main routine
  67 0000c2  16 00 20 		MOV #1, w6
  68 0000c4  86 83 4A 	9:	addc w5, w6, w7
  69 0000c6  06 AC B8 		MUL\.US	w5, w6, w8
  70              		
  71 0000c8  00 00 04 	0:	goto	main	
  71         00 00 00 
