#as: 
#objdump: -t -s
#name: \.val in \.text \(limits\)




dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000000 long1
\[  3\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000004 int1
\[  4\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000000 main
\[  5\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000000e word1
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000018 L41
\[  7\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000001e word100
\[  8\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000028 word500
\[  9\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000032 word1000
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x98 nreloc 3 nlnno 0
\[ 12\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x10 nreloc 0 nlnno 0
\[ 14\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0


Contents of section \.text:
 0000 550020 160020 86834a 06acb8  U\. \.\. \.\.J\.\.\.
 0008 160020 86834a 06acb8 010000  \.\. \.\.J\.\.\.\.\.\.
 0010 160020 86834a 06acb8 160020  \.\. \.\.J\.\.\.\.\. 
 0018 86834a 06acb8 000037 640000  \.\.J\.\.\.\.\.7d\.\.
 0020 160020 86834a 160020 06acb8  \.\. \.\.J\.\. \.\.\.
 0028 f40100 160020 86834a 06acb8  \.\.\.\.\. \.\.J\.\.\.
 0030 010478 e80300 f5a92f 160020  \.\.x\.\.\.\.\./\.\. 
 0038 86834a 06acb8 160020 86834a  \.\.J\.\.\.\.\. \.\.J
 0040 06acb8 160020 86834a 06acb8  \.\.\.\.\. \.\.J\.\.\.
 0048 000004 000000                \.\.\.\.\.\.      
Contents of section \.data:
 0000 00000010 00100000                    \.\.\.\.\.\.\.\.        
