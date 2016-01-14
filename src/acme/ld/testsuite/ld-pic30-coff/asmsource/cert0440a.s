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
		
symAT1:		nop
symAT2:		nop
symAT3:		nop
symAT4:		nop
symAT5:		nop
				
	
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

		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

