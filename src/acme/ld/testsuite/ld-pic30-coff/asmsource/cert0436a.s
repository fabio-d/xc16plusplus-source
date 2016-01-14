		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
		
		.equiv symAT1, 0x1234
		.equiv symAT2, 0xFFFF
		.equiv symAT3, 0x0000
		.equiv symAT4, 0x7FFF
		.equiv symAT5, 0x8000	
		
__reset:	nop
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
		.equiv symAD1, 0x1234
		.equiv symAD2, 0xFFFF
		.equiv symAD3, 0x0000
		.equiv symAD4, 0x7FFF
		.equiv symAD5, 0x8000		
		
		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

