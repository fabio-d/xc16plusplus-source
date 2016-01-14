#as:
#objdump: -t -r
#name: .extern Directive ignored
#source: cert0074a.s


dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000001a L11
\[  4\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000020 L21
\[  5\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000028 L31
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000002c L41
\[  7\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000030 L51
\[  8\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000036 L61
\[  9\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000003c L71
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000044 L81
\[ 11\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000004a L91
\[ 12\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000004e L1
\[ 13\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0xa4 nreloc 11 nlnno 0
\[ 15\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 17\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 19\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x0000000c main
\[ 20\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 one
\[ 21\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000004 two
\[ 22\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000008 three
\[ 23\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x0000000a foo
\[ 24\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 ex1
\[ 25\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 ex2
\[ 26\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 ex3
\[ 27\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 ex4
\[ 28\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 externdefine
\[ 29\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 main2


RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
0000000c FILE REG - WORD with DST\.  ex1
0000000e FILE REG - WORD with DST\.  ex2
00000010 FILE REG - WORD with DST\.  ex3
00000000 PROGRAM ADDRESS LSB  externdefine
00000002 PROGRAM ADDRESS MSB  externdefine
00000004 PROGRAM ADDRESS LSB  main2
00000006 PROGRAM ADDRESS MSB  main2
00000012 PROGRAM ADDRESS LSB  ex4
00000014 PROGRAM ADDRESS MSB  ex4
0000004e PROGRAM ADDRESS LSB  main
00000050 PROGRAM ADDRESS MSB  main

