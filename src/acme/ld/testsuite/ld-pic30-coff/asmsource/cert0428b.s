	
		.text
		nop
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
sym1B:		.word 	0xB1
sym2B:		.word	0xB2
sym3B:		.word	0xB3
sym4B:		.word	0xB4

		.global	sym1B
		.global	sym2B
		.global	sym3B
		.global	sym4B

		.end

		
