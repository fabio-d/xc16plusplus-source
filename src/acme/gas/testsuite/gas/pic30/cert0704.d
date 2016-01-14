#as: --listing-cont-lines=100 --listing-lhs-width=16 --listing-lhs-width2=16
#name: .incbin directive in .bss
#source: cert0704.s

MPLAB ASM30 Listing:  .*cert0704.s 			page 1


   1                                                     	
   2                                                     	        /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
   3                                                     	                     Start of assembly code
   4                                                     	        \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
   5                                                     	         ; Define a macro/pseudo-instruction for the undocumented HALT instruction\.
   6                                                     	         \.macro HALT
   7                                                     	            \.pword 0xDA4000
   8                                                     	         \.endm
   9                                                     	
  10                                                     	         \.text
  11 000000  00 00 04 00 00 00                               	          GOTO END
  12                                                     	
  13                                                     	         \.bss
  14 0000 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F 	         \.incbin \".*incbin-1\.bin\"
  14      10 11 12 13 14 15 16 17 18 19 1A 1B 1C 1D 1E 1F 
  14      20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F 
  14      30 31 32 33 34 35 36 37 38 39 3A 3B 3C 3D 3E 3F 
  14      40 41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 
  14      50 51 52 53 54 55 56 57 58 59 5A 5B 5C 5D 5E 5F 
  14      60 61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 
  14      70 71 72 73 74 75 76 77 78 79 7A 7B 7C 7D 7E 7F 
  14      80 81 82 83 84 85 86 87 88 89 8A 8B 8C 8D 8E 8F 
  14      90 91 92 93 94 95 96 97 98 99 9A 9B 9C 9D 9E 9F 
  14      A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 AA AB AC AD AE AF 
  14      B0 B1 B2 B3 B4 B5 B6 B7 B8 B9 BA BB BC BD BE BF 
  14      C0 C1 C2 C3 C4 C5 C6 C7 C8 C9 CA CB CC CD CE CF 
  14      D0 D1 D2 D3 D4 D5 D6 D7 D8 D9 DA DB DC DD DE DF 
  14      E0 E1 E2 E3 E4 E5 E6 E7 E8 E9 EA EB EC ED EE EF 
  14      F0 F1 F2 F3 F4 F5 F6 F7 F8 F9 FA FB FC FD FE FF 
  14      00 
  15                                                     	
  16 0101 00                                              	         \.data
  17 0000 01 00                                           	         \.word 1
  18                                                     	
  19                                                     	         \.text
  20                                                     	         \.align 2
  21 000004  00 40 DA                                        	END:      HALT
  22                                                     	         \.end
