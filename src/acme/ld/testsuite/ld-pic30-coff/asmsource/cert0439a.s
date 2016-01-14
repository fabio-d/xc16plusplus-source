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

		MOV #psvoffset(symAT1), w14
		MOV #psvoffset(symAT2), w13
		MOV #psvoffset(symAT3), w12
		MOV #psvoffset(symAT4), w11
		MOV #psvoffset(symAT5), w10
		
		MOV #psvoffset(symBT1), w9
		MOV #psvoffset(symBT2), w8
		MOV #psvoffset(symBT3), w7
		MOV #psvoffset(symBT4), w6
		MOV #psvoffset(symBT5), w5		
		
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

