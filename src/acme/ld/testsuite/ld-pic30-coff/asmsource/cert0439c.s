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

		MOV #psvoffset(symBD1), w9
		MOV #psvoffset(symBD2), w8
		MOV #psvoffset(symBD3), w7
		MOV #psvoffset(symBD4), w6
		MOV #psvoffset(symBD5), w5		
		
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		
symAT1:		nop
symAT2:		nop
symAT3:		nop
symAT4:		nop
symAT5:		nop
				
	
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

