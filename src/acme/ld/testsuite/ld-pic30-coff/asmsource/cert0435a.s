		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
		
		.equiv symAT1, 0x00
		.equiv symAT2, 0x1F
		.equiv symAT3, 0x01
		.equiv symAT4, 0x0F
		.equiv symAT5, 0x10
		
__reset:	nop
		nopr
		nop
		nopr
		nopr
	
		nopr
		nopr

		ADD.b w14, #symAT1, w0
		ADD.b w13, #symAT2, w1
		ADD.b w12, #symAT3, w2
		ADD.b w11, #symAT4, w3
		ADD.b w10, #symAT5, w4
		
		ADD.b w9, #symAD1, w5
		ADD.b w8, #symAD2, w6
		ADD.b w7, #symAD3, w7
		ADD.b w6, #symAD4, w8
		ADD.b w5, #symAD5, w9

		ADD.b w4, #symBT1, w10
		ADD.b w3, #symBT2, w11
		ADD.b w2, #symBT3, w12
		ADD.b w1, #symBT4, w13
		ADD.b w0, #symBT5, w14
		
		ADD.b w14, #symBD1, w0
		ADD.b w13, #symBD2, w1
		ADD.b w12, #symBD3, w2
		ADD.b w11, #symBD4, w3
		ADD.b w10, #symBD5, w4

	

		nopr
		nopr
	
			
		.data
		.equiv symAD1, 0x00
		.equiv symAD2, 0x1F
		.equiv symAD3, 0x01	
		.equiv symAD4, 0x0F
		.equiv symAD5, 0x10		
		
		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

