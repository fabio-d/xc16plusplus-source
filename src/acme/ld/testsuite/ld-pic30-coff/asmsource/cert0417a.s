		.global __reset

		.text
		.byte 1
		.byte 0
		.byte 5
		.byte 0xA5
		.byte 0xFF
		.byte 0xFF
		
		
		.align 4
__reset:	nop
		nop
		
		DO	#5, . - 16
		
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
