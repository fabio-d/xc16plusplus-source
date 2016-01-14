#as:
#name: .psize, functionality (b)

MPLAB ASM30 Listing:  .+cert0118b\.s 			page 1
cert0118 \.psize
subtitle1 test
   1              		\.title 
   2              		\.sbttl 
   3              		\.list
   4              		\.data
   5                 	
   6 0000 00 00 00 10 	long1:	\.
   7 0004 00 10 00 00 	int1:	\.i
   8                 	
   9 0008 00 00 00 20 	long2:	\.
  10 000c 00 20 00 00 	int2:	\.i
  11                 	
  12 0010 00 00 00 30 	long3:	\.
  13 0014 00 30 00 00 	int3:	\.i
  14                 	
  15 0018 FF FF 00 00 	orgnext:
  16                 	
  17                 		\.psize 
MPLAB ASM30 Listing:  .+cert0118b\.s 			page 2
cert0118 \.psize
subtitle1 test
  18                 	
  19 001c 00 00 00 40 	long4:	\.
  20 0020 00 40 00 00 	int4:	\.i
  21                 	
  22 0024 00 00 00 50 	long5:	\.
  23 0028 00 50 00 00 	int5:	\.i
  24                 	
  25 002c 00 00 00 60 	long6:	\.
  26 0030 00 60 00 00 	int6:	\.i
  27 0034 00 00 00 70 	long7:	\.
  28 0038 00 80 00 00 	int7:	\.i
  29 003c FF FF 00 00 	last:	\.i
  30                 	
  31                 		\.text
  32              	
  33              	main:
  34 000000  55 00 20 		MOV \#5,
MPLAB ASM30 Listing:  .+cert0118b\.s 			page 3
cert0118 \.psize
subtitle1 test
  35 000002  16 00 20 		MOV \#1,
  36              		
  37 000004  86 83 4A 	1:	addc 
  38 000006  06 AC B8 		MUL\.US	
  39 000008  16 00 20 		MOV \#1,
  40              		
  41 00000a  86 83 4A 	2:	addc 
  42 00000c  06 AC B8 		MUL\.US	
  43 00000e  16 00 20 		MOV \#1,
  44 000010  86 83 4A 		addc w5
  45              		
  46 000012  06 AC B8 	3:	MUL\.U
  47              		
  48 000014  16 00 20 		MOV \#1,
  49              		
  50 000016  86 83 4A 	4:	addc 
  51 000018  06 AC B8 		MUL\.US	
MPLAB ASM30 Listing:  .+cert0118b\.s 			page 4
cert0118 \.psize
subtitle1 test
  52 00001a  00 00 37 		bra 1b
  53              	
  54              		
  55 00001c  16 00 20 	5:	MOV \#
  56 00001e  86 83 4A 		addc w5
  57 000020  16 00 20 		MOV \#1,
  58 000022  06 AC B8 		MUL\.US	
  59              		
  60 000024  16 00 20 	6:	MOV \#
  61 000026  86 83 4A 		addc w5
  62 000028  06 AC B8 		MUL\.US	
  63              	
  64 00002a  01 04 78 		MOV	w1,
  65 00002c  F5 A9 2F 		MOV \#64
  66              		
  67 00002e  16 00 20 	7:	MOV \#
  68 000030  86 83 4A 		addc w5
MPLAB ASM30 Listing:  .+cert0118b\.s 			page 5
cert0118 \.psize
subtitle1 test
  69 000032  06 AC B8 		MUL\.US	
  70 000034  16 00 20 		MOV \#1,
  71              		
  72 000036  86 83 4A 	8:	addc 
  73 000038  06 AC B8 		MUL\.US	
  74 00003a  16 00 20 		MOV \#1,
  75              		
  76 00003c  86 83 4A 	9:	addc 
  77 00003e  06 AC B8 		MUL\.US	
  78              		
  79 000040  00 00 04 	0:	goto	
  79         00 00 00 
  80              	
  81              		\.end
MPLAB ASM30 Listing:  .+cert0118b.s 			page 6
cert0118 .psize
subtitle1 test
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0118b.s:6      .data:00000000 long1
.+cert0118b.s:7      .data:00000004 int1
.+cert0118b.s:9      .data:00000008 long2
.+cert0118b.s:10     .data:0000000c int2
.+cert0118b.s:12     .data:00000010 long3
.+cert0118b.s:13     .data:00000014 int3
.+cert0118b.s:15     .data:00000018 orgnext
.+cert0118b.s:19     .data:0000001c long4
.+cert0118b.s:20     .data:00000020 int4
.+cert0118b.s:22     .data:00000024 long5
.+cert0118b.s:23     .data:00000028 int5
.+cert0118b.s:25     .data:0000002c long6
.+cert0118b.s:26     .data:00000030 int6
.+cert0118b.s:27     .data:00000034 long7
MPLAB ASM30 Listing:  .+cert0118b.s 			page 7
cert0118 .psize
subtitle1 test
.+cert0118b.s:28     .data:00000038 int7
.+cert0118b.s:29     .data:0000003c last
.+cert0118b.s:33     .text:00000000 main
.+cert0118b.s:37     .text:00000004 L11
.+cert0118b.s:41     .text:0000000a L21
.+cert0118b.s:46     .text:00000012 L31
.+cert0118b.s:50     .text:00000016 L41
.+cert0118b.s:55     .text:0000001c L51
.+cert0118b.s:60     .text:00000024 L61
.+cert0118b.s:67     .text:0000002e L71
.+cert0118b.s:72     .text:00000036 L81
.+cert0118b.s:76     .text:0000003c L91
.+cert0118b.s:79     .text:00000040 L1

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
