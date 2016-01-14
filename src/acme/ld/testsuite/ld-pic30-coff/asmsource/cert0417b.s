


		.text
		.byte 1
		.byte 0
		.byte 5
		.byte 0xA5
		.byte 0xFF
		.byte 0xFF
		.align 4

		nop
		nop
		
		DO	#8, . + 0x14
		
		nopr
		nopr
		nop
		nop
		nopr
		nopr
		nop
		nop
		nopr
		nopr
		nopr
		nopr

		.data
		.byte 1		
		.byte 2
		.byte 3
		.byte 0xFF
		.byte 00
		.byte 0xFF

		.end
