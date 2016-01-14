#objdump: -t
#name: Include file annotation

# Test to ensure that include files are annotated

.*: .*

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000002 .*/utc241.inc
File 
\[  2\]\(sec -2\)\(fl 0x00\)\(ty   0\)\(scl 103\) \(nx 1\) 0x00000000 .*/utc241.s
File 
\[  4\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __C30COFF
\[  5\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 CONST
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 .text
AUX scnlen 0x0 nreloc 0 nlnno 0
\[  8\]\(sec  2\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 .data
AUX scnlen 0x0 nreloc 0 nlnno 0
\[ 10\]\(sec  3\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 1\) 0x00000000 .bss
AUX scnlen 0x0 nreloc 0 nlnno 0


