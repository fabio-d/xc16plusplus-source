#as: 
#name: .lcomm, Reserve bytes for local common (limit test)
#source: cert0095a.s

MPLAB ASM30 Listing:  .+cert0095a\.s 			page 1


DEFINED SYMBOLS
                            \*ABS\*:00000000 fake
                            \*ABS\*:00000001 __C30COFF
                             \.bss:00000000 lctestdata0
.+cert0095a\.s:5      \.bss:00000000 lctestdatamax1
.+cert0095a\.s:6      \.bss:0000ffff lctestdatalast
.+cert0095a\.s:10     \.text:00000000 main
.+cert0095a\.s:13     \.text:00000004 L11
.+cert0095a\.s:16     \.text:0000000a L21
.+cert0095a\.s:22     \.text:00000012 L31
.+cert0095a\.s:24     \.text:00000016 L41
.+cert0095a\.s:28     \.text:0000001c L51
.+cert0095a\.s:32     \.text:00000024 L61
.+cert0095a\.s:40     \.text:0000002e L71
.+cert0095a\.s:44     \.text:00000036 L81
.+cert0095a\.s:47     \.text:0000003c L91
.+cert0095a\.s:50     \.text:00000040 L1

NO UNDEFINED SYMBOLS
EQUATE SYMBOLS
                       __C30COFF = 0x1
