#as: 
#objdump: -t -s
#name: .val in .text (limits)

dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000000 long1
\[  4\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000004 int1
\[  5\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000000 main
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000004 L11
\[  7\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000000a L21
\[  8\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000000e word0
\[  9\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000014 L31
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000018 L41
\[ 11\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000001e wordFFFF
\[ 12\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000020 L51
\[ 13\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000028 word7FFF
\[ 14\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000002a L61
\[ 15\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000034 L71
\[ 16\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000003c L81
\[ 17\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000042 L91
\[ 18\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000046 L1
\[ 19\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x94 nreloc 3 nlnno 0
\[ 21\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x10 nreloc 0 nlnno 0
\[ 23\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0


Contents of section \.text:
 0000 550020 160020 86834a 06acb8  U\. \.\. †ƒJ\.¬¸
 0008 160020 86834a 06acb8 000000  \.\. †ƒJ\.¬¸\.\.\.
 0010 160020 86834a 06acb8 160020  \.\. †ƒJ\.¬¸\.\. 
 0018 86834a 06acb8 000037 ffff00  †ƒJ\.¬¸\.\.7ÿÿ\.
 0020 160020 86834a 160020 06acb8  \.\. †ƒJ\.\. \.¬¸
 0028 ff7f00 160020 86834a 06acb8  ÿ\.\.\.\. †ƒJ\.¬¸
 0030 010478 f5a92f 160020 86834a  \.\.xõ©/\.\. †ƒJ
 0038 06acb8 160020 86834a 06acb8  \.¬¸\.\. †ƒJ\.¬¸
 0040 160020 86834a 06acb8 000004  \.\. †ƒJ\.¬¸\.\.\.
 0048 000000                       \.\.\.         
Contents of section \.data:
 0000 00000010 00100000                    \.\.\.\.\.\.\.\.        
