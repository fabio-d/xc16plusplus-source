
		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5
	
		.text
		
		.equiv symBT1, 0x00
		.equiv symBT2, 0x1F
		.equiv symBT3, 0x01
		.equiv symBT4, 0x0F
		.equiv symBT5, 0x10
		
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
		.equiv symBD1, 0x00
		.equiv symBD2, 0x1F
		.equiv symBD3, 0x01
		.equiv symBD4, 0x0F
		.equiv symBD5, 0x10	
		
		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

