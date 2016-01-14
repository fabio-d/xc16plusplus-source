	
		.text
		nop
		nopr
		nop
		nopr
		nopr
		and.b	#symA1, w8
		and.b	#symA2, w7
		and.b	#symA3, w6
		and.b	#symA4, w5
		and.b	#symA5, w5
		and.b	#symA6, w1
		and.b	#symA7, w1
		and.b	#symA8, w1
		and.b	#symA9, w1			
		
		and.b	#symB1, w4
		and.b	#symB2, w3
		and.b	#symB3, w2
		and.b	#symB4, w1
		and.b	#symB5, w1
		and.b	#symB6, w1
		and.b	#symB7, w1
		and.b	#symB8, w1
		and.b	#symB9, w1			
		
		nopr	
		
		.data
		
		.equiv symB1, 0x01
		.equiv symB2, 127
		.equiv symB3, -128
		.equiv symB4, 0
		.equiv symB5, -1
		.equiv symB6, 0x001
		.equiv symB7, 0x002
		.equiv symB8, 0x003
		.equiv symB9, 0x083
		
		.global symB1
		.global symB2
		.global symB3
		.global symB4
		.global symB5
		.global symB6
		.global symB7
		.global symB8
		.global symB9
		
		.end

