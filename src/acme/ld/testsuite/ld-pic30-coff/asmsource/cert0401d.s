		.text
		.equiv bitsym2, 2
		nopr
		btst.b		temp, #bitsym1
		nopr
		nopr
		nop
		nop
		btst.b		externalsym, #bitsym2
	

		.data

		.org 0x0003
externalsym:    .byte 	0x5A
		
		
		.global externalsym
		.global bitsym2
		
		.end

