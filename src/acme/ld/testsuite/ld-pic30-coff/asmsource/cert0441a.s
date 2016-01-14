		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
__reset:	clrwdt

		nopr
		clrwdt

		.align 4
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
		
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		
symAT1:		clrwdt
            .space 0x1000
symAT2:		clrwdt
            .space 0x1000
symAT3:		clrwdt
            .space 0x1000
symAT4:		clrwdt
            .space 0x1000
symAT5:		clrwdt
            .space 0x1000
				
	
		.data
		.align 2
	
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

