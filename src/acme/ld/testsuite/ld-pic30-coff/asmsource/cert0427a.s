		.global __reset

		.text
__reset:	nop

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
symAD1:		.word	0x1A56
symAD2:		.word	0xFFFF
symAD3:		.word	0
symAD4:		.word	0x8000
symAD5:		.word	0x7FFF
		
		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
				
		
		.end

		
