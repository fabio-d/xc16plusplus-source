#as: 
#objdump: -t -s
#name: Legal Operator Usage

dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000000 zero1
\[  4\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 zero2
\[  5\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000002 one1
\[  6\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000003 two1
\[  7\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000004 negone1
\[  8\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000005 one2
\[  9\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000006 zero3
\[ 10\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000007 five1
\[ 11\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000000b tff1
\[ 12\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000000f twenfive1
\[ 13\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000013 tencube1
\[ 14\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000017 twohund1
\[ 15\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000001b tff2
\[ 16\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000001c off1
\[ 17\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000001d zero4
\[ 18\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000001e tff3
\[ 19\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000001f ten1
\[ 20\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000020 eighty1
\[ 21\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000021 sixtwo1
\[ 22\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000022 one3
\[ 23\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x48 nreloc 0 nlnno 0
\[ 25\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x48 nreloc 0 nlnno 0
\[ 27\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0


Contents of section \.text:
 0000 000000 010200 ff0100 000500  \.\.\.\.\.\..\.\.\.\.\.
 0008 000000 00ff00 000000 000700  \.\.\.\..\.\.\.\.\.\.\.
 0010 000000 000900 000000 00c800  \.\.\.\.	\.\.\.\.\..\.
 0018 000000 00ff00 9b0000 ff0a00  \.\.\.\..\..\.\..\.\.
 0020 503e00 010000                P>\.\.\.\.      
Contents of section \.data:
 0000 00000102 ff010005 000000ff 00000007  \.\.\.\..\.\.\.\.\.\..\.\.\.\.
 0010 00000009 000000c8 000000ff 9b00ff0a  \.\.\.	\.\.\..\.\.\...\..\.
 0020 503e0100                             P>\.\.            
