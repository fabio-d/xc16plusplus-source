
		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5
	
		.text


		
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
		
		.org 0x04000
symBT1:		nopr

		.org 0xC000		
symBT2:		nop
		.org 0x14000
symBT3:		nopr
		.org 0x2C000
symBT4:		nopr
		.org 0x3C000
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

