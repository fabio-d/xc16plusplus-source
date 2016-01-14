
		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5
	
		.text


		
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
		
symBT1:		nopr

symBT2:		nop

symBT3:		nopr

symBT4:		nopr

symBT5:		nop		
	
		.data
symBD1:		.byte 1
symBD2:		.byte 2
symBD3:		.byte 3
symBD4:		.byte 4
symBD5:		.byte 5

		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		 
		.end

