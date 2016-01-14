#as:
#name: .incbin directive in .data with skip > filesize
#source: cert0723.s

.+cert0723.s: Assembler messages:
.+cert0723.s:[[:digit:]]+: Error: skip \(257\) \+ count \([[:digit:]]+\) larger than file size \(257\)
