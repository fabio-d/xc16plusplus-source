#as: --defsym outrange=0xFFFFFFFF1
#objdump: -s -t
#name: --defsym Define out-of-range symbol

# We do not use this file.  The assembly source should not assemble.

.*: .*

SYMBOL TABLE:
.*
File 
\[  .*\]\(sec .*\)\(fl 0x00\)\(ty   0\)\(scl   .*\) \(.* .*\) 0xffffffff maxsym
\[  .*\]\(sec .*\)\(fl 0x00\)\(ty   0\)\(scl   .*\) \(.* .*\) 0x00000000 minsym
\[  .*\]\(sec  .*\)\(fl 0x00\)\(ty   0\)\(scl   .*\) \(.* .*\) .* .text
.* .* .* .* 2 .* 0
\[  .*\]\(sec  .*\)\(fl 0x00\)\(ty   0\)\(scl   .*\) \(.* .*\) .* .data
.* .* .* .* 0 .* 0
\[  .*\]\(sec  .*\)\(fl 0x00\)\(ty   0\)\(scl   .*\) \(.* .*\) .* .bss
.* .* .* .* 0 .* 0
\[ .*\]\(sec  .*\)\(fl 0x00\)\(ty   0\)\(scl   .*\) \(.* .*\) .* foo


Contents of section .text:
 .* .* .* .*           ............    
