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

		MOV #tblpage(symAT1), w14
		MOV #tblpage(symAT2), w13		
		MOV #tblpage(symAT3), w12
		MOV #tblpage(symAT4), w11
		MOV #tblpage(symAT5), w10		
		

		MOV #tblpage(symBD1), w9
		MOV #tblpage(symBD2), w8		
		MOV #tblpage(symBD3), w7
		MOV #tblpage(symBD4), w6
		MOV #tblpage(symBD5), w5				
		
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

		.word tblpage(symAT1)	
		.word tblpage(symAT2)	
		.word tblpage(symAT3)	
		.word tblpage(symAT4)	
		.word tblpage(symAT5)	

		.word tblpage(symBT1)	
		.word tblpage(symBT2)	
		.word tblpage(symBT3)	
		.word tblpage(symBT4)	
		.word tblpage(symBT5)	
		
symAD1:		.word 0x01
symAD2:		.word 0x02
symAD3:		.word 0x03
symAD4:		.word 0x04
symAD5:		.word 0x05

		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

