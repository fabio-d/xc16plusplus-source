#as: -f
#objdump: -s -t
#name: -f Skip whitespace and comment preprocessing
#source: cert0028b.s

dump\.o:     file format coff-pic30

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 fake
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  3\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   6\) \(nx 0\) 0x000000de main
\[  4\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.text
AUX scnlen 0x1cc nreloc 2 nlnno 0
\[  6\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.data
AUX scnlen 0x0 nreloc 0 nlnno 0
\[  8\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 \.bss
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 10\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   2\) \(nx 0\) 0x00000006 foo


Contents of section .text:
 0000 000004 000000 0000ff 0000ff  ............
 0008 546500 737400 206f00 662000  Te.st. o.f .
 0010 6c6900 737400 696e00 672000  li.st.in.g .
 0018 636f00 6e7400 696e00 756100  co.nt.in.ua.
 0020 746900 6f6e00 206c00 696e00  ti.on. l.in.
 0028 657300 2e2000 205400 686900  es.. . T.hi.
 0030 732000 6c6900 6e6500 207300  s .li.ne. s.
 0038 686f00 756c00 642000 626500  ho.ul.d .be.
 0040 207200 656100 6c6c00 792000   r.ea.ll.y .
 0048 726500 616c00 6c7900 207200  re.al.ly. r.
 0050 656100 6c6c00 792000 6c6f00  ea.ll.y .lo.
 0058 6e6700 207300 6f2000 746800  ng. s.o .th.
 0060 617400 206700 617300 206900  at. g.as. i.
 0068 732000 666f00 726300 656400  s .fo.rc.ed.
 0070 207400 6f2000 757300 652000   t.o .us.e .
 0078 636f00 6e7400 696e00 756100  co.nt.in.ua.
 0080 746900 6f6e00 206c00 696e00  ti.on. l.in.
 0088 657300 2e0a00 546800 697300  es....Th.is.
 0090 206100 736300 696900 207300   a.sc.ii. s.
 0098 747200 696e00 672000 736800  tr.in.g .sh.
 00a0 6f7500 6c6400 206e00 6f7400  ou.ld. n.ot.
 00a8 206100 707000 656100 722000   a.pp.ea.r .
 00b0 696e00 207400 686500 206c00  in. t.he. l.
 00b8 697300 742000 666900 6c6500  is.t .fi.le.
 00c0 0a5200 657300 756d00 652000  .R.es.um.e .
 00c8 6c6900 737400 696e00 672000  li.st.in.g .
 00d0 696e00 206c00 697300 742000  in. l.is.t .
 00d8 666900 6c6500 2e0000 550020  fi.le....U. 
 00e0 160020 86834a 06acb8         .........   
