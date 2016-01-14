

		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5

		.text

		clrwdt
		nopr

		MOV #tblpage(symAT1), w14
		MOV #tblpage(symAT2), w13		
		MOV #tblpage(symAT3), w12
		MOV #tblpage(symAT4), w11
		MOV #tblpage(symAT5), w10		
		

		MOV #tblpage(symBT1), w9
		MOV #tblpage(symBT2), w8		
		MOV #tblpage(symBT3), w7
		MOV #tblpage(symBT4), w6
		MOV #tblpage(symBT5), w5			
		
		clrwdt
		nopr
		nopr
		nopr
		nopr
		clrwdt
		

		.org 0x287fE/2+1
symBT1:		clrwdt
		.org 0x4f002/2+1
symBT2:		clrwdt
		.org 0x68004/2
symBT3:		clrwdt
		.org 0x69806/2+1
symBT4:		clrwdt
		.org 0x6F000/2
symBT5:		clrwdt

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

		.end

