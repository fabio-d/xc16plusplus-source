

		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5

		.text

		nopr
		nopr

		MOV #tblpage(symAD1), w14
		MOV #tblpage(symAD2), w13		
		MOV #tblpage(symAD3), w12
		MOV #tblpage(symAD4), w11
		MOV #tblpage(symAD5), w10		
		

		MOV #tblpage(symBT1), w9
		MOV #tblpage(symBT2), w8		
		MOV #tblpage(symBT3), w7
		MOV #tblpage(symBT4), w6
		MOV #tblpage(symBT5), w5			
		
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		

		.org 0x287fE/2+1
symBT1:		nop
		.org 0x4f002/2+1
symBT2:		nop
		.org 0x68004/2
symBT3:		nop
		.org 0x69806/2+1
symBT4:		nop
		.org 0x6F000/2
symBT5:		nop

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
		
symBD1:		.word 0x01
symBD2:		.word 0x02
symBD3:		.word 0x03
symBD4:		.word 0x04
symBD5:		.word 0x05		

		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

