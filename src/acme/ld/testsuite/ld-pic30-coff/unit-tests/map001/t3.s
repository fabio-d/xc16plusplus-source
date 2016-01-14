        .global LC2, LC3
        .global _upper, _graph
        
       	.section	.const,"r"
LC2:
	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ\12\0"
	.data
	.align	2
_upper:
	.word	LC2
	.section	.const,"r"
LC3:
	.ascii "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~\12\0"
	.data
	.align	2
_graph:
	.word	LC3
