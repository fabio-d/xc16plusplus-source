#as: --warn
#name: LNK instruction on .text symbol
#objdump: -t -d
#source: cert0640.s

dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000002 text0
\[  4\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000000 dat0
\[  5\]\(sec  5\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000002 nx0
\[  6\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000002 dat1
\[  7\]\(sec  5\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000004 nx1
\[  8\]\(sec  5\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000000a nx2
\[  9\]\(sec  5\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x0000000c nx3
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000010 text1
\[ 11\]\(sec  4\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000002 foo0
\[ 12\]\(sec  4\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000010 foo1
\[ 13\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x00000014 text2
\[ 14\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x0000001c text3
\[ 15\]\(sec  4\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000016 foo2
\[ 16\]\(sec  4\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000018 foo3
\[ 17\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x40 nreloc 8 nlnno 0
\[ 19\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0xc nreloc 0 nlnno 0
\[ 21\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 23\]\(sec  4\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 foo
AUX scnlen 0x38 nreloc 6 nlnno 0
\[ 25\]\(sec  5\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 en
AUX scnlen 0x20 nreloc 0 nlnno 0
\[ 27\]\(sec  6\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 ex
AUX scnlen 0x18 nreloc 6 nlnno 0


Disassembly of section \.text:

00000000 <\.text>:
   0:	00 00 00    	nop       

00000002 <text0>:
   2:	00 00 00    	nop       
   4:	00 00 fa    	lnk       #0x0
   6:	02 00 fa    	lnk       #0x2
   8:	02 00 fa    	lnk       #0x2
   a:	04 00 fa    	lnk       #0x4
   c:	0a 00 fa    	lnk       #0xa
   e:	0c 00 fa    	lnk       #0xc

00000010 <text1>:
	\.\.\.

00000014 <text2>:
	\.\.\.
  18:	00 00 fa    	lnk       #0x0
  1a:	02 00 fa    	lnk       #0x2

0000001c <text3>:
	\.\.\.
Disassembly of section foo:

00000000 <foo>:
   0:	00 00 00    	nop       

00000002 <foo0>:
   2:	00 00 00    	nop       
   4:	02 00 fa    	lnk       #0x2
   6:	00 00 fa    	lnk       #0x0
   8:	04 00 fa    	lnk       #0x4
   a:	0a 00 fa    	lnk       #0xa
   c:	0c 00 fa    	lnk       #0xc
   e:	02 00 fa    	lnk       #0x2

00000010 <foo1>:
	\.\.\.

00000016 <foo2>:
  16:	00 00 00    	nop       

00000018 <foo3>:
	\.\.\.
Disassembly of section ex:

00000000 <ex>:
   0:	00 00 fa    	lnk       #0x0
   2:	02 00 fa    	lnk       #0x2
   4:	02 00 fa    	lnk       #0x2
   6:	04 00 fa    	lnk       #0x4
   8:	0a 00 fa    	lnk       #0xa
   a:	0c 00 fa    	lnk       #0xc
