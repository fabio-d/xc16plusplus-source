

		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5

		.text

		nopr
		nopr

		MOV #tbloffset(symAT1), w14
		MOV #tbloffset(symAT2), w13		
		MOV #tbloffset(symAT3), w12
		MOV #tbloffset(symAT4), w11
		MOV #tbloffset(symAT5), w10		
		

		MOV #tbloffset(symBT1), w9
		MOV #tbloffset(symBT2), w8		
		MOV #tbloffset(symBT3), w7
		MOV #tbloffset(symBT4), w6
		MOV #tbloffset(symBT5), w5		
		
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

		.word tbloffset(symAT1)	
		.word tbloffset(symAT2)	
		.word tbloffset(symAT3)	
		.word tbloffset(symAT4)	
		.word tbloffset(symAT5)	

		.word tbloffset(symBT1)	
		.word tbloffset(symBT2)	
		.word tbloffset(symBT3)	
		.word tbloffset(symBT4)	
		.word tbloffset(symBT5)	

		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

