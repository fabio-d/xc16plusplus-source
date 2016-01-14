		.text
		nopr
		nopr
		nopr
		
		.pword 	0x20
		.byte 0x00

		.pword 	0x00
		.byte 0x00
		.pword 	0xFF
		.byte 0x00
		.pword	0x7F
		.byte 0x00
		.pword  0x80
		.byte 0x00
		.pword  0x2a
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
		.pword	0x2b
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
		nop
		nop

		.data
		.equiv sym1b, 0x05
		.equiv sym2b, 0x00
		.equiv sym3b, 0xFF
		.equiv sym4b, 0x7F
		.equiv sym5b, 0x80
		
tempb: 		.byte 	0xA5
		.global tempb
		.global sym1b
		.global sym2b
		.global sym3b
		.global sym4b
		.global sym5b
		
		.end

