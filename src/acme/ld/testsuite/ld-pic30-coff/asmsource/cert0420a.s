			.text
		.global __reset
__reset:	nop
		nop
		nop
		nop
		nopr

		.pword 	0x10
		.byte 0x00

		.pword 	0x00
		.byte 0x00
		.pword 	0xFF
		.byte 0x00		
		.pword	0x7F
		.byte 0x00		
		.pword  0x80
		.byte 0x00		
		.pword  0x1a
		.byte 0x00		
		.pword	sym1a
		.byte 0x00		
		.pword	sym2a
		.byte 0x00
		.pword	sym3a
		.byte 0x00
		.pword	sym4a
		.byte 0x00
		.pword	sym5a
		.byte 0x00
		.pword	tempa
		.byte 0x00
		.pword	0x1b
		.byte 0x00
		.pword	sym1b
		.byte 0x00
		.pword	sym2b
		.byte 0x00
		.pword	sym3b
		.byte 0x00
		.pword	sym4b
		.byte 0x00
		.pword	sym5b
		.byte 0x00
		.pword	tempb			
		.byte 0x00
		nopr
		nopr
		nopr
		nopr

		.data
		.equiv sym1a, 0x05
		.equiv sym2a, 0x00
		.equiv sym3a, 0xFF
		.equiv sym4a, 0x7F
		.equiv sym5a, 0x80
		
tempa: 		.byte 	0xA5
		.global tempa
		.global sym1a
		.global sym2a
		.global sym3a
		.global sym4a
		.global sym5a
		
		.end

