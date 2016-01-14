		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
__reset:	nop


symAT1:		nop
symAT2:		nop
symAT3:		nop
symAT4:		nop
symAT5:		nop
		
		nopr
		nopr

		MOV #handle(symAT1), w4
		MOV #handle(symAT2), w3		
		MOV #handle(symAT3), w2
		MOV #handle(symAT4), w1
		MOV #handle(symAT5), w0

		MOV #handle(symBT1), w4
		MOV #handle(symBT2), w3		
		MOV #handle(symBT3), w2
		MOV #handle(symBT4), w1
		MOV #handle(symBT5), w0
			
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
	
		.data
symAD1:		.byte 1
symAD2:		.byte 2
symAD3:		.byte 3
symAD4:		.byte 4
symAD5:		.byte 5

		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

