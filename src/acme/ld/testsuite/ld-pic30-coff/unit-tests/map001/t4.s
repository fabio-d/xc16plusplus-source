        .global LC4
        .global _space, _xdigit
        
        .section	.const,"r"
LC4:
	.ascii "abcdefABCDEF\12\0"
	.data
	.align	2
_xdigit:
	.word	LC4
