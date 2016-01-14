#as: -MD depend.txt
#objdump: -s -t
#name: -MD Write dependency info
#source: cert0034a1.s ./gas/pic30/cert0034a2.s


dump.o: .*cert0034a2.s .*ascizInc.s \\
 .*cert0034a1.s
