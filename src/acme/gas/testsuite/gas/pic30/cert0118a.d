#as:
#name: .psize, functionality
#source: cert0118a.s

MPLAB ASM30 Listing:  .+cert0118a\.s 			page 1
cert0118 \.psize
subtitle1 test
   1              		\.title cert0118 \.psize
   2              		\.sbttl subtitle1 test
   3              		\.list
   4              		\.data
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 2
cert0118 \.psize
subtitle1 test
   5                 		
   6                 		\.psize 7
   7                 		
   8 0000 00 00 00 10 	long1:	\.long	0x10000000
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 3
cert0118 \.psize
subtitle1 test
   9 0004 00 10 00 00 	int1:	\.int	0x1000
  10                 	
  11 0008 00 00 00 20 	long2:	\.long	0x20000000
  12 000c 00 20 00 00 	int2:	\.int	0x2000
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 4
cert0118 \.psize
subtitle1 test
  13                 	
  14 0010 00 00 00 30 	long3:	\.long	0x30000000
  15 0014 00 30 00 00 	int3:	\.int	0x3000
  16                 	
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 5
cert0118 \.psize
subtitle1 test
  17 0018 FF FF 00 00 	orgnext: \.int	0xFFFF
  18                 	
  19                 	
  20 001c 00 00 00 40 	long4:	\.long	0x40000000
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 6
cert0118 \.psize
subtitle1 test
  21 0020 00 40 00 00 	int4:	\.int	0x4000
  22                 	
  23 0024 00 00 00 50 	long5:	\.long	0x50000000
  24 0028 00 50 00 00 	int5:	\.int	0x5000
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 7
cert0118 \.psize
subtitle1 test
  25                 	
  26 002c 00 00 00 60 	long6:	\.long	0x60000000
  27 0030 00 60 00 00 	int6:	\.int	0x6000
  28 0034 00 00 00 70 	long7:	\.long	0x70000000
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 8
cert0118 \.psize
subtitle1 test
  29 0038 00 80 00 00 	int7:	\.int	0x8000
  30 003c FF FF 00 00 	last:	\.int	0xFFFF
  31                 	
  32                 		\.text
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 9
cert0118 \.psize
subtitle1 test
  33              	
  34              	main:
  35 000000  55 00 20 		MOV \#5, w5
  36 000002  16 00 20 		MOV \#1, w6	
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 10
cert0118 \.psize
subtitle1 test
  37              		
  38 000004  86 83 4A 	1:	addc w5, w6, w7
  39 000006  06 AC B8 		MUL\.US	w5, w6, w8
  40 000008  16 00 20 		MOV \#1, w6
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 11
cert0118 \.psize
subtitle1 test
  41              		
  42 00000a  86 83 4A 	2:	addc w5, w6, w7
  43 00000c  06 AC B8 		MUL\.US	w5, w6, w8
  44 00000e  16 00 20 		MOV \#1, w6
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 12
cert0118 \.psize
subtitle1 test
  45 000010  86 83 4A 		addc w5, w6, w7
  46              		
  47 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
  48              		
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 13
cert0118 \.psize
subtitle1 test
  49 000014  16 00 20 		MOV \#1, w6
  50              		
  51 000016  86 83 4A 	4:	addc w5, w6, w7
  52 000018  06 AC B8 		MUL\.US	w5, w6, w8	
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 14
cert0118 \.psize
subtitle1 test
  53 00001a  00 00 37 		bra 1b
  54              	
  55              		
  56 00001c  16 00 20 	5:	MOV \#1, w6
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 15
cert0118 \.psize
subtitle1 test
  57 00001e  86 83 4A 		addc w5, w6, w7
  58 000020  16 00 20 		MOV \#1, w6
  59 000022  06 AC B8 		MUL\.US	w5, w6, w8	
  60              		
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 16
cert0118 \.psize
subtitle1 test
  61 000024  16 00 20 	6:	MOV \#1, w6
  62 000026  86 83 4A 		addc w5, w6, w7
  63 000028  06 AC B8 		MUL\.US	w5, w6, w8	
  64              	
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 17
cert0118 \.psize
subtitle1 test
  65 00002a  01 04 78 		MOV	w1, w8
  66 00002c  F5 A9 2F 		MOV \#64159, w5
  67              		
  68 00002e  16 00 20 	7:	MOV \#1, w6
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 18
cert0118 \.psize
subtitle1 test
  69 000030  86 83 4A 		addc w5, w6, w7
  70 000032  06 AC B8 		MUL\.US	w5, w6, w8	
  71 000034  16 00 20 		MOV \#1, w6
  72              		
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 19
cert0118 \.psize
subtitle1 test
  73 000036  86 83 4A 	8:	addc w5, w6, w7
  74 000038  06 AC B8 		MUL\.US	w5, w6, w8
  75 00003a  16 00 20 		MOV \#1, w6
  76              		
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 20
cert0118 \.psize
subtitle1 test
  77 00003c  86 83 4A 	9:	addc w5, w6, w7
  78 00003e  06 AC B8 		MUL\.US	w5, w6, w8
  79              		
  80 000040  00 00 04 	0:	goto	main	
MPLAB ASM30 Listing:  .+cert0118a\.s 			page 21
cert0118 \.psize
subtitle1 test
  80         00 00 00 
  81              	
  82              		\.end
MPLAB ASM30 Listing:  .+cert0118a.s 			page 22
cert0118 .psize
subtitle1 test
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0118a.s:8      .data:00000000 long1
MPLAB ASM30 Listing:  .+cert0118a.s 			page 23
cert0118 .psize
subtitle1 test
.+cert0118a.s:9      .data:00000004 int1
.+cert0118a.s:11     .data:00000008 long2
.+cert0118a.s:12     .data:0000000c int2
.+cert0118a.s:14     .data:00000010 long3
MPLAB ASM30 Listing:  .+cert0118a.s 			page 24
cert0118 .psize
subtitle1 test
.+cert0118a.s:15     .data:00000014 int3
.+cert0118a.s:17     .data:00000018 orgnext
.+cert0118a.s:20     .data:0000001c long4
.+cert0118a.s:21     .data:00000020 int4
MPLAB ASM30 Listing:  .+cert0118a.s 			page 25
cert0118 .psize
subtitle1 test
.+cert0118a.s:23     .data:00000024 long5
.+cert0118a.s:24     .data:00000028 int5
.+cert0118a.s:26     .data:0000002c long6
.+cert0118a.s:27     .data:00000030 int6
MPLAB ASM30 Listing:  .+cert0118a.s 			page 26
cert0118 .psize
subtitle1 test
.+cert0118a.s:28     .data:00000034 long7
.+cert0118a.s:29     .data:00000038 int7
.+cert0118a.s:30     .data:0000003c last
.+cert0118a.s:34     .text:00000000 main
MPLAB ASM30 Listing:  .+cert0118a.s 			page 27
cert0118 .psize
subtitle1 test
.+cert0118a.s:38     .text:00000004 L11
.+cert0118a.s:42     .text:0000000a L21
.+cert0118a.s:47     .text:00000012 L31
.+cert0118a.s:51     .text:00000016 L41
MPLAB ASM30 Listing:  .+cert0118a.s 			page 28
cert0118 .psize
subtitle1 test
.+cert0118a.s:56     .text:0000001c L51
.+cert0118a.s:61     .text:00000024 L61
.+cert0118a.s:68     .text:0000002e L71
.+cert0118a.s:73     .text:00000036 L81
MPLAB ASM30 Listing:  .+cert0118a.s 			page 29
cert0118 .psize
subtitle1 test
.+cert0118a.s:77     .text:0000003c L91
.+cert0118a.s:80     .text:00000040 L1

NO UNDEFINED SYMBOLS
MPLAB ASM30 Listing:  .+cert0118a.s 			page 30
cert0118 .psize
subtitle1 test
EQUATE SYMBOLS
                       __C30COFF = 0x1
