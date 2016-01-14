#as: 
#name: SSR 20404 -- Error for invalid addressing mode
#source: ssr20404b.s

MPLAB ASM30 Listing:  .*ssr20404b.s 			page 1


   1              	         \.text
   2 000000  D0 00 78 	          mov \[\+\+w0\],w1
   3 000002  C0 00 78 	          mov \[--w0\],w1
   4 000004  B0 00 78 	          mov \[w0\+\+\],w1
   5 000006  A0 00 78 	          mov \[w0--\],w1
   6              	         \.end
