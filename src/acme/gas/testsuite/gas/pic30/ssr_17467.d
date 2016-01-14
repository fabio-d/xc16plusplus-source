#as:
#name: Extended Mnemonics for bit instructions

MPLAB ASM30 Listing:  .*ssr_17467.s 			page 1


   1              	; p30F6014\.inc  Standard Include/Header File, Version 1\.4
   2              	; \(c\) Copyright 2001 Microchip Technology, All rights reserved
   3              	
 2103              	\.LIST
 2104              	
 2105              	
 2106              	
 2107              		\.title Certification tests
 2108              		\.sbttl subtitle1 test
 2109              	
 2110              		\.data
 2111                 	
 2112                 		\.text
 2113              	main:
 2114              	
 2115 000000  01 40 A9 		BCLR\.w 	CORCON, #EDT
 2116 000002  01 40 A9 		BCLR\.w	CORCON\+1, #2
 2117 000004  01 20 A9 		BCLR\.w 	CORCON, #DL1
 2118 000006  01 20 A9 		BCLR\.w	CORCON\+1, #1
 2119 000008  01 00 A9 		BCLR\.w	CORCON, #DL0
 2120 00000a  01 00 A9 		BCLR\.w	CORCON\+1, #0
 2121              	
 2122 00000c  00 E0 A9 		BCLR\.w	CORCON, #SATA
 2123 00000e  00 A0 A9 		BCLR\.w	CORCON, #SATDW
 2124 000010  00 80 A9 		BCLR\.w	CORCON, #ACCSAT
 2125 000012  00 40 A9 		BCLR\.w	CORCON, #PSV
 2126 000014  00 00 A9 		BCLR\.w	CORCON, #IF
 2127              	
 2128              	
 2129 000016  01 40 A8 		BSET\.w 	CORCON, #EDT
 2130 000018  01 40 A8 		BSET\.w	CORCON\+1, #2
 2131 00001a  01 20 A8 		BSET\.w 	CORCON, #DL1
 2132 00001c  01 20 A8 		BSET\.w	CORCON\+1, #1
 2133 00001e  01 00 A8 		BSET\.w	CORCON, #DL0
 2134 000020  01 00 A8 		BSET\.w	CORCON\+1, #0
 2135              	
 2136 000022  00 E0 A8 		BSET\.w	CORCON, #SATA
 2137 000024  00 A0 A8 		BSET\.w	CORCON, #SATDW
 2138 000026  00 80 A8 		BSET\.w	CORCON, #ACCSAT
 2139 000028  00 40 A8 		BSET\.w	CORCON, #PSV
 2140 00002a  00 00 A8 		BSET\.w	CORCON, #IF
 2141              	
 2142 00002c  01 40 AB 		BTST\.w 	CORCON, #EDT
 2143 00002e  01 40 AB 		BTST\.w	CORCON\+1, #2
 2144 000030  01 20 AB 		BTST\.w 	CORCON, #DL1
 2145 000032  01 20 AB 		BTST\.w	CORCON\+1, #1
 2146 000034  01 00 AB 		BTST\.w	CORCON, #DL0
 2147 000036  01 00 AB 		BTST\.w	CORCON\+1, #0
 2148              	
 2149 000038  00 E0 AB 		BTST\.w	CORCON, #SATA
 2150 00003a  00 A0 AB 		BTST\.w	CORCON, #SATDW
 2151 00003c  00 80 AB 		BTST\.w	CORCON, #ACCSAT
 2152 00003e  00 40 AB 		BTST\.w	CORCON, #PSV
 2153 000040  00 00 AB 		BTST\.w	CORCON, #IF
 2154              	
 2155 000042  01 40 AC 		BTSTS\.w	CORCON, #EDT
 2156 000044  01 40 AC 		BTSTS\.w	CORCON\+1, #2
MPLAB ASM30 Listing:  .*ssr_17467.s 			page 2
Certification tests
subtitle1 test
 2157 000046  01 20 AC 		BTSTS\.w	CORCON, #DL1
 2158 000048  01 20 AC 		BTSTS\.w	CORCON\+1, #1
 2159 00004a  01 00 AC 		BTSTS\.w	CORCON, #DL0
 2160 00004c  01 00 AC 		BTSTS\.w	CORCON\+1, #0
 2161              	
 2162 00004e  00 E0 AC 		BTSTS\.w	CORCON, #SATA
 2163 000050  00 A0 AC 		BTSTS\.w	CORCON, #SATDW
 2164 000052  00 80 AC 		BTSTS\.w	CORCON, #ACCSAT
 2165 000054  00 40 AC 		BTSTS\.w	CORCON, #PSV
 2166 000056  00 00 AC 		BTSTS\.w	CORCON, #IF
 2167              	
 2168 000058  00 00 04 		goto	main
 2168         00 00 00 
 2169              	
 2170              		\.end
