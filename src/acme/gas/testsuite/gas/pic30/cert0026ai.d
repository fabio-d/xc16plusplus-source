#as: --no-warn
#name: -as Include symbols in listing
#source: cert0026ai.s

# Include symbols in the listing file
MPLAB ASM30 Listing:  .+cert0026ai\.s 			page 1


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
.+cert0026ai\.s:54     \.text:0000010a main
.+cert0026ai\.s:19     \.text:00000006 foo

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
