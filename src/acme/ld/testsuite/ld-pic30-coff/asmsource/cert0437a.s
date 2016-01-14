		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
__reset:	nop


		
		nopr
		nopr

		MOV #psvpage(symBT1), w4
		MOV #psvpage(symBT2), w3		
		MOV #psvpage(symBT3), w2
		MOV #psvpage(symBT4), w1
		MOV #psvpage(symBT5), w0
			


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

