		.global __reset
	
		.text
__reset:	nop
		nopr
		nop
		nopr

		mov	sym1A, w8
		mov	sym2A, w7
		mov	sym3A, w6
		mov	sym4A, w5
		
		mov	sym1B, w4
		mov	sym2B, w3
		mov	sym3B, w2
		mov	sym4B, w1		
		
		
		nopr
		nop
		nopr
		nop
		
		.data
sym1A:		.word 	0xA1
sym2A:		.word	0xA2
sym3A:		.word	0xA3
sym4A:		.word	0xA4

		.global	sym1A
		.global	sym2A
		.global	sym3A
		.global	sym4A
		
		.end

		
