#as: 
#name: .align with out-of-range value for algn


.*cert0402.s: Assembler messages:
.+cert0402\.s:2087: Warning: \.fillvalue not specified in a code section\.  \.fillvalue ignored\.
.*cert0402.s:[[0-9]]+: Error: Alignment too large: 2\^[[0-9]|[a-f]|[A-F]|x]+ assumed
