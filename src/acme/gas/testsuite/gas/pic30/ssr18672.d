#as: --relax
#name: --relax should relax GOTO to BRA
#source: ssr18672.s

MPLAB ASM30 Listing:  .*ssr18672\.s 			page 1


   1              	          \.text
   2 000000  00 00 37 	          GOTO 1f
   3 000002  00 00 37 	          BRA 1f
   4 000004  00 00 00 	          nop
   5 000006  00 00 00 	          nop
   6              	          
   7 000008  00 00 00 	1:        nop
   8 00000a  00 00 00 	          nop
   9 00000c  00 00 00 	          nop
  10              	          
  11 00000e  00 00 37 	          GOTO 1b
  12 000010  00 00 37 	          BRA 1b
  13              	          
  14 000012  00 00 00 	          nop
  15 000014  00 00 00 	          nop
  16 000016  00 00 00 	          nop
  17              	          
  18              	         \.end
MPLAB ASM30 Listing:  .*ssr18672\.s 			page 2


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+ssr18672\.s:7      \.text:00000008 L1\1

NO UNDEFINED SYMBOLS
