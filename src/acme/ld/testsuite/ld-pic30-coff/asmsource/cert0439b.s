
		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5

		.text


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

		.org 0x487fE/2+1
symBT1:		nop
		.org 0x5f002/2+1
symBT2:		nop
		.org 0x69004/2
symBT3:		nop
		.org 0x69806/2+1
symBT4:		nop
		.org 0x78000/2
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

