#as: --keep-locals
#objdump: -s -t -r
#name: -L Keep Local Labels
#source: cert0033a.s


dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000010c main
\[  4\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000110 L11
\[  5\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000116 L21
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000011e L31
\[  7\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000122 L41
\[  8\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000126 L51
\[  9\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000012c L61
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000132 L71
\[ 11\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000013a L81
\[ 12\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000140 L91
\[ 13\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000144 L1
\[ 14\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000106 test
\[ 15\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000108 test2
\[ 16\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000010a test3
\[ 17\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x290 nreloc 26 nlnno 0
\[ 19\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 21\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 23\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x0000002e foo


RELOCATION RECORDS FOR \[\.text\]:
OFFSET   TYPE              VALUE 
00000108 HANDLE \(pointer to function\)  test
0000010a HANDLE \(pointer to function\)  test
00000000 PROGRAM ADDRESS LSB  main
00000002 PROGRAM ADDRESS MSB  main
00000004 PROGRAM ADDRESS LSB  L11
00000006 PROGRAM ADDRESS MSB  L11
00000008 PROGRAM ADDRESS LSB  L21
0000000a PROGRAM ADDRESS MSB  L21
0000000c PROGRAM ADDRESS LSB  L31
0000000e PROGRAM ADDRESS MSB  L31
00000010 PROGRAM ADDRESS LSB  L41
00000012 PROGRAM ADDRESS MSB  L41
00000014 PROGRAM ADDRESS LSB  L51
00000016 PROGRAM ADDRESS MSB  L51
00000018 PROGRAM ADDRESS LSB  L61
0000001a PROGRAM ADDRESS MSB  L61
0000001c PROGRAM ADDRESS LSB  L71
0000001e PROGRAM ADDRESS MSB  L71
00000020 PROGRAM ADDRESS LSB  L81
00000022 PROGRAM ADDRESS MSB  L81
00000024 PROGRAM ADDRESS LSB  L91
00000026 PROGRAM ADDRESS MSB  L91
00000028 PROGRAM ADDRESS LSB  L1
0000002a PROGRAM ADDRESS MSB  L1
00000144 PROGRAM ADDRESS LSB  main
00000146 PROGRAM ADDRESS MSB  main


Contents of section \.text:
 0000 000004 000000 000004 000000  \.\.\.\.\.\.\.\.\.\.\.\.
 0008 000004 000000 000004 000000  \.\.\.\.\.\.\.\.\.\.\.\.
 0010 000004 000000 000004 000000  \.\.\.\.\.\.\.\.\.\.\.\.
 0018 000004 000000 000004 000000  \.\.\.\.\.\.\.\.\.\.\.\.
 0020 000004 000000 000004 000000  \.\.\.\.\.\.\.\.\.\.\.\.
 0028 000004 000000 0000ff 0000ff  ............
 0030 546500 737400 206f00 662000  Te\.st\. o\.f \.
 0038 6c6900 737400 696e00 672000  li\.st\.in\.g \.
 0040 636f00 6e7400 696e00 756100  co\.nt\.in\.ua\.
 0048 746900 6f6e00 206c00 696e00  ti\.on\. l\.in\.
 0050 657300 2e2000 205400 686900  es\.\. \. T\.hi\.
 0058 732000 6c6900 6e6500 207300  s \.li\.ne\. s\.
 0060 686f00 756c00 642000 626500  ho\.ul\.d \.be\.
 0068 207200 656100 6c6c00 792000   r\.ea\.ll\.y \.
 0070 726500 616c00 6c7900 207200  re\.al\.ly\. r\.
 0078 656100 6c6c00 792000 6c6f00  ea\.ll\.y \.lo\.
 0080 6e6700 207300 6f2000 746800  ng\. s\.o \.th\.
 0088 617400 206700 617300 206900  at\. g\.as\. i\.
 0090 732000 666f00 726300 656400  s \.fo\.rc\.ed\.
 0098 207400 6f2000 757300 652000   t\.o \.us\.e \.
 00a0 636f00 6e7400 696e00 756100  co\.nt\.in\.ua\.
 00a8 746900 6f6e00 206c00 696e00  ti\.on\. l\.in\.
 00b0 657300 2e0a00 546800 697300  es\.\.\.\.Th\.is\.
 00b8 206100 736300 696900 207300   a\.sc\.ii\. s\.
 00c0 747200 696e00 672000 736800  tr\.in\.g \.sh\.
 00c8 6f7500 6c6400 206e00 6f7400  ou\.ld\. n\.ot\.
 00d0 206100 707000 656100 722000   a\.pp\.ea\.r \.
 00d8 696e00 207400 686500 206c00  in\. t\.he\. l\.
 00e0 697300 742000 666900 6c6500  is\.t \.fi\.le\.
 00e8 0a5200 657300 756d00 652000  \.R\.es\.um\.e \.
 00f0 6c6900 737400 696e00 672000  li\.st\.in\.g \.
 00f8 696e00 206c00 697300 742000  in\. l\.is\.t \.
 0100 666900 6c6500 2e0000 018000  fi\.le\.\.\.\.\.\.\.
 0108 9cff00 00ff00 550020 160020  ............
 0110 86834a 06acb8 160020 86834a  ............
 0118 06acb8 160020 86834a 06acb8  ............
 0120 160020 86834a 06acb8 160020  ............
 0128 86834a 06acb8 160020 86834a  ............
 0130 06acb8 160020 86834a 06acb8  ............
 0138 160020 86834a 06acb8 160020  ............
 0140 86834a 06acb8 000004 000000  ............
