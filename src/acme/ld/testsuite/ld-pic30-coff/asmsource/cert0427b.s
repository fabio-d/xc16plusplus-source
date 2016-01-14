
		pop	symAD1
		pop	symAD2
		pop	symAD3
		pop	symAD4
		pop	symAD5		

		pop	symBD1
		pop	symBD2
		pop	symBD3
		pop	symBD4
		pop	symBD5			

	
		.data
symBD1:		.word	0x1A56
symBD2:		.word	0xFFFF
symBD3:		.word	0
symBD4:		.word	0x8000
symBD5:		.word	0x7FFF
		
		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
				
		
		.end

		
