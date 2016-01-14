#as:
#name: .incbin directive in .data with count > filesize
#source: cert0724.s

.+cert0724.s: Assembler messages:
.+cert0724.s:[[:digit:]]+: Error: skip \(0\) \+ count \(258\) larger than file size \(257\)
