		.global __reset
	
		.text
__reset:	nop
		nopr
		nop
		nopr
		nopr
		and.b	#symA1, w8
		and.b	#symA2, w7
		and.b	#symA3, w6
		and.b	#symA4, w5
		and.b	#symA5, w4	
		and.b	#symA6, w1
		and.b	#symA7, w1
		and.b	#symA8, w1
		and.b	#symA9, w1		
		
		and.b	#symB1, w3
		and.b	#symB2, w2
		and.b	#symB3, w1
		and.b	#symB4, w0
		and.b	#symB5, w1
		and.b	#symB6, w1
		and.b	#symB7, w1
		and.b	#symB8, w1
		and.b	#symB9, w1		
		
		nopr	
		
		.data
		
		.equiv symA1, 0x01
		.equiv symA2, 127
		.equiv symA3, -128
		.equiv symA4, 0
		.equiv symA5, -1
		.equiv symA6, 0x001
		.equiv symA7, 0x002
		.equiv symA8, 0x003
		.equiv symA9, 0x083		
		
		.global symA1
		.global symA2
		.global symA3
		.global symA4
		.global symA5		
		.global symA6
		.global symA7
		.global symA8		
		.global symA9
		
		
		.end

