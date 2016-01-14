#as: --processor 30F2010
#objdump: -t
#name: --processor - Target Processor Specified

# Test to ensure that a symbol is created for the given processor.

.*: .*

SYMBOL TABLE:
.*
File 
\[  2\]\(sec -1\)\(fl 0x00\)\(ty   0\)\(scl   3\) \(nx 0\) 0x00000001 __30F2010
.*
.*
.*
.*
.*
.*
.*
.*

