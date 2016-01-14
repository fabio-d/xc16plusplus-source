#as:
#name: .psize, max/min limits (a)

   1              		\.title cert0118 \.psize
   2              		\.sbttl subtitle1 test
   3              		\.list
   4              		\.data
   5                 	
   6 0000 00 00 00 10 	long1:	\.long	0x10000000
   7                 	
   8 0004 00 10 00 00 	int1:	\.int	0x1000
   9                 	
  10 0008 00 00 00 20 	long2:	\.long	0x20000000
  11                 	
  12 000c 00 20 00 00 	int2:	\.int	0x2000
  13                 	
  14 0010 00 00 00 30 	long3:	\.long	0x30000000
  15                 	
  16 0014 00 30 00 00 	int3:	\.int	0x3000
  17                 	
  18 0018 FF FF 00 00 	orgnext: \.int	0xFFFF
  19                 	
  20                 		\.psize 0, 0
  21                 	
  22                 	
  23 001c 00 00 00 40 	long4:	\.long	0x40000000
  24                 	
  25 0020 00 40 00 00 	int4:	\.int	0x4000
  26                 	
  27 0024 00 00 00 50 	long5:	\.long	0x50000000
  28                 	
  29 0028 00 50 00 00 	int5:	\.int	0x5000
  30                 	
  31 002c 00 00 00 60 	long6:	\.long	0x60000000
  32                 	
  33 0030 00 60 00 00 	int6:	\.int	0x6000
  34                 	
  35 0034 00 00 00 70 	long7:	\.long	0x70000000
  36                 	
  37 0038 00 80 00 00 	int7:	\.int	0x8000
  38                 	
  39 003c FF FF 00 00 	last:	\.int	0xFFFF
  40                 	
  41                 	
  42                 	
  43 0040 00 00 00 60 	long8:	\.long	0x60000000
  44                 	
  45 0044 00 60 00 00 	int8:	\.int	0x6000
  46                 	
  47 0048 00 00 00 70 	long9:	\.long	0x70000000
  48                 	
  49 004c 00 80 00 00 	int9:	\.int	0x8000
  50                 	
  51 0050 FF FF 00 00 	last2:	\.int	0xFFFF
  52                 	
  53 0054 FF FF 00 00 		\.int	0xFFFF
  54 0058 FF FF 00 00 		\.int	0xFFFF	
  55 005c FF FF 00 00 		\.int	0xFFFF
  56 0060 FF FF 00 00 		\.int	0xFFFF	
  57 0064 FF FF 00 00 		\.int	0xFFFF
  58 0068 FF FF 00 00 		\.int	0xFFFF	
  59 006c FF FF 00 00 		\.int	0xFFFF
  60 0070 FF FF 00 00 		\.int	0xFFFF	
  61 0074 FF FF 00 00 		\.int	0xFFFF
  62 0078 FF FF 00 00 		\.int	0xFFFF	
  63 007c FF FF 00 00 		\.int	0xFFFF
  64 0080 FF FF 00 00 		\.int	0xFFFF		
  65 0084 FF FF 00 00 		\.int	0xFFFF
  66 0088 FF FF 00 00 		\.int	0xFFFF	
  67 008c FF FF 00 00 		\.int	0xFFFF
  68 0090 FF FF 00 00 		\.int	0xFFFF	
  69 0094 FF FF 00 00 		\.int	0xFFFF
  70 0098 FF FF 00 00 		\.int	0xFFFF		
  71 009c FF FF 00 00 		\.int	0xFFFF
  72 00a0 FF FF 00 00 		\.int	0xFFFF		
  73 00a4 FF FF 00 00 		\.int	0xFFFF
  74 00a8 FF FF 00 00 		\.int	0xFFFF		
  75 00ac FF FF 00 00 		\.int	0xFFFF
  76 00b0 FF FF 00 00 		\.int	0xFFFF		
  77                 	
  78                 	
  79 00b4 FF FF 00 00 		\.int	0xFFFF
  80                 	
  81 00b8 FF FF 00 00 		\.int	0xFFFF		
  82                 	
  83 00bc FF FF 00 00 		\.int	0xFFFF
  84                 	
  85 00c0 FF FF 00 00 		\.int	0xFFFF	
  86                 	
  87 00c4 FF FF 00 00 		\.int	0xFFFF
  88                 	
  89 00c8 FF FF 00 00 		\.int	0xFFFF	
  90                 	
  91 00cc FF FF 00 00 		\.int	0xFFFF
  92                 	
  93 00d0 FF FF 00 00 		\.int	0xFFFF	
  94                 	
  95 00d4 FF FF 00 00 		\.int	0xFFFF
  96                 	
  97 00d8 FF FF 00 00 		\.int	0xFFFF	
  98                 	
  99 00dc FF FF 00 00 		\.int	0xFFFF
 100                 	
 101 00e0 FF FF 00 00 		\.int	0xFFFF	
 102                 		
 103 00e4 01          		\.byte 0x01
 104                 		
 105 00e5 01          		\.byte 0x01
 106 00e6 01          		\.byte 0x01	
 107                 	
 108 00e7 01          		\.byte 0x01
 109 00e8 01          		\.byte 0x01
 110 00e9 01          		\.byte 0x01
 111 00ea 01          		\.byte 0x01
 112 00eb 01          		\.byte 0x01
 113 00ec 01          		\.byte 0x01
 114 00ed 01          		\.byte 0x01
 115 00ee 01          		\.byte 0x01
 116 00ef 01          		\.byte 0x01
 117 00f0 01          		\.byte 0x01
 118 00f1 01          		\.byte 0x01
 119 00f2 01          		\.byte 0x01
 120 00f3 01          		\.byte 0x01
 121 00f4 01          		\.byte 0x01
 122 00f5 01          		\.byte 0x01
 123 00f6 01          		\.byte 0x01
 124 00f7 01          		\.byte 0x01
 125 00f8 01          		\.byte 0x01
 126 00f9 01          		\.byte 0x01
 127 00fa 01          		\.byte 0x01
 128 00fb 01          		\.byte 0x01
 129                 		
 130                 	
 131                 		\.text
 132              		
 133              	
 134              	
 135              	main:
 136              	
 137              	
 138 000000  55 00 20 		MOV \#5, w5
 139              	
 140 000002  16 00 20 		MOV \#1, w6
 141              		
 142              		
 143              		
 144              	1:	
 145 000004  86 83 4A 		addc w5, w6, w7
 146              		
 147 000006  06 AC B8 		MUL\.US	w5, w6, w8
 148              		
 149 000008  16 00 20 		MOV \#1, w6
 150              		
 151 00000a  86 83 4A 	2:	addc w5, w6, w7
 152              	
 153 00000c  06 AC B8 		MUL\.US	w5, w6, w8
 154              		
 155 00000e  16 00 20 		MOV \#1, w6
 156              		
 157 000010  86 83 4A 		addc w5, w6, w7
 158              		
 159              		
 160              		
 161 000012  06 AC B8 	3:	MUL\.US	w5, w6, w8
 162              	
 163              		
 164              		
 165 000014  16 00 20 		MOV \#1, w6
 166              		
 167              		
 168              		
 169 000016  86 83 4A 	4:	addc w5, w6, w7
 170              	
 171 000018  06 AC B8 		MUL\.US	w5, w6, w8	
 172              		
 173 00001a  00 00 37 		bra 1b
 174              		
 175              	
 176              	
 177              		
 178              		
 179 00001c  16 00 20 	5:	MOV \#1, w6
 180              	
 181 00001e  86 83 4A 		addc w5, w6, w7
 182              		
 183              		
 184 000020  16 00 20 		MOV \#1, w6
 185              		
 186 000022  06 AC B8 		MUL\.US	w5, w6, w8	
 187              		
 188              		
 189 000024  16 00 20 	6:	MOV \#1, w6
 190              	
 191 000026  86 83 4A 		addc w5, w6, w7
 192              	
 193 000028  06 AC B8 		MUL\.US	w5, w6, w8	
 194              	
 195              	
 196              	
 197 00002a  01 04 78 		MOV	w1, w8
 198              	
 199 00002c  F5 A9 2F 		MOV \#64159, w5
 200              	
 201              		
 202              	
 203 00002e  16 00 20 	7:	MOV \#1, w6
 204              	
 205 000030  86 83 4A 		addc w5, w6, w7
 206              	
 207 000032  06 AC B8 		MUL\.US	w5, w6, w8	
 208              	
 209 000034  16 00 20 		MOV \#1, w6
 210              		
 211              	
 212 000036  86 83 4A 	8:	addc w5, w6, w7
 213              	
 214 000038  06 AC B8 		MUL\.US	w5, w6, w8
 215              	
 216 00003a  16 00 20 		MOV \#1, w6
 217              	
 218              		
 219 00003c  86 83 4A 	9:	addc w5, w6, w7
 220              	
 221 00003e  06 AC B8 		MUL\.US	w5, w6, w8
 222              	
 223              		
 224              	
 225 000040  00 00 04 	0:	goto	main	
 225         00 00 00 
 226              	
 227              	
 228              	
 229              		\.end
DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0119a.s:6      .data:00000000 long1
.+cert0119a.s:8      .data:00000004 int1
.+cert0119a.s:10     .data:00000008 long2
.+cert0119a.s:12     .data:0000000c int2
.+cert0119a.s:14     .data:00000010 long3
.+cert0119a.s:16     .data:00000014 int3
.+cert0119a.s:18     .data:00000018 orgnext
.+cert0119a.s:23     .data:0000001c long4
.+cert0119a.s:25     .data:00000020 int4
.+cert0119a.s:27     .data:00000024 long5
.+cert0119a.s:29     .data:00000028 int5
.+cert0119a.s:31     .data:0000002c long6
.+cert0119a.s:33     .data:00000030 int6
.+cert0119a.s:35     .data:00000034 long7
.+cert0119a.s:37     .data:00000038 int7
.+cert0119a.s:39     .data:0000003c last
.+cert0119a.s:43     .data:00000040 long8
.+cert0119a.s:45     .data:00000044 int8
.+cert0119a.s:47     .data:00000048 long9
.+cert0119a.s:49     .data:0000004c int9
.+cert0119a.s:51     .data:00000050 last2
.+cert0119a.s:135    .text:00000000 main
.+cert0119a.s:144    .text:00000004 L11
.+cert0119a.s:151    .text:0000000a L21
.+cert0119a.s:161    .text:00000012 L31
.+cert0119a.s:169    .text:00000016 L41
.+cert0119a.s:179    .text:0000001c L51
.+cert0119a.s:189    .text:00000024 L61
.+cert0119a.s:203    .text:0000002e L71
.+cert0119a.s:212    .text:00000036 L81
.+cert0119a.s:219    .text:0000003c L91
.+cert0119a.s:225    .text:00000040 L1

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
