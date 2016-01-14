	
		.text
		nop
		nopr
		nop
		nopr
		nopr
		addc	#symA1, w8
		addc	#symA2, w7
		addc	#symA3, w6
		addc	#symA4, w5
		addc	#symA5, w5		
		
		addc	#symB1, w4
		addc	#symB2, w3
		addc	#symB3, w2
		addc	#symB4, w1
		addc	#symB5, w1		
		
		nopr	
		
		.data
		
		.equiv symB1, 0x01
		.equiv symB2, 0b1111111111
		.equiv symB3, 0b0111111111
		.equiv symB4, 0
		.equiv symB5, 0b1000000000
		
		.global symB1
		.global symB2
		.global symB3
		.global symB4
		.global symB5
		
		.end

