
		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5
	
		.text
		
		.equiv symBT1, 0x1234
		.equiv symBT2, 0xFFFF
		.equiv symBT3, 0x0000
		.equiv symBT4, 0x7FFF
		.equiv symBT5, 0x8000	
		

		nopr
		nop
		nopr
		nopr

		nopr
		nopr

		MOV #symAT1, w0
		MOV #symAT2, w1
		MOV #symAT3, w2
		MOV #symAT4, w3
		MOV #symAT5, w4

		MOV #symAD1, w5
		MOV #symAD2, w6
		MOV #symAD3, w7
		MOV #symAD4, w8
		MOV #symAD5, w9
		
		MOV #symBT1, w10
		MOV #symBT2, w11
		MOV #symBT3, w12
		MOV #symBT4, w13
		MOV #symBT5, w14

		MOV #symBD1, w0
		MOV #symBD2, w1
		MOV #symBD3, w2
		MOV #symBD4, w3
		MOV #symBD5, w4		
		
		nopr
		nopr
	
		nopr
		nopr
		nopr
		nopr
	
			
		
		.data
		.equiv symBD1, 0x1234
		.equiv symBD2, 0xFFFF
		.equiv symBD3, 0x0000
		.equiv symBD4, 0x7FFF
		.equiv symBD5, 0x8000	
		
		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

