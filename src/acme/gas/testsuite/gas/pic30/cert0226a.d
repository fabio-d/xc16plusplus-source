#as: --no-warn
#objdump: -s -t
#name: .hword directive, range, data
#source: cert0226a.s

dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000005 hwd1
\[  4\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000007 test1
\[  5\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000000 main
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000004 L11
\[  7\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000000a L21
\[  8\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000012 L31
\[  9\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000016 L41
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000001c L51
\[ 11\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000024 L61
\[ 12\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000002a L71
\[ 13\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000032 L81
\[ 14\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000038 L91
\[ 15\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000003c L1
\[ 16\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x80 nreloc 3 nlnno 0
\[ 18\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x10 nreloc 0 nlnno 0
\[ 20\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 22\]\(sec  0\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000000 lb


Contents of section \.text:
 0000 550020 160020 86834a 06acb8  .+
 0008 160020 86834a 06acb8 160020  .+
 0010 86834a 06acb8 160020 86834a  .+
 0018 06acb8 000037 160020 86834a  .+
 0020 160020 06acb8 160020 86834a  .+
 0028 06acb8 160020 86834a 06acb8  .+
 0030 160020 86834a 06acb8 160020  .+
 0038 86834a 06acb8 000004 000000  .+
Contents of section \.data:
 0000 eeeeeeee ee0000ac            .+
