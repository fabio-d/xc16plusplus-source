		.global __reset
	
		.text
__reset:	nop
		nopr
		nop
		nopr
		nopr
		addc	#symA1, w8
		addc	#symA2, w7
		addc	#symA3, w6
		addc	#symA4, w5
		addc	#symA5, w4
		
		addc	#symB1, w3
		addc	#symB2, w2
		addc	#symB3, w1
		addc	#symB4, w0
		addc	#symB5, w1
		
		nopr	
		
		.data
		
		.equiv symA1, 0x01
		.equiv symA2, 0b1111111111
		.equiv symA3, 0b0111111111
		.equiv symA4, 0
		.equiv symA5, 0b1000000000
		
		.global symA1
		.global symA2
		.global symA3
		.global symA4
		.global symA5		
		
		.end

