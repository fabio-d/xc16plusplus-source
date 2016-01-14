		.global test3
		.global datasym2
		.global extsym
		.global test4

		.text
		.equiv test3, 1		
		.byte 1
		.byte 0
		.byte 5
		.pbyte datasym-128
		.byte 0xA5
		
		.pbyte 1
		.byte 0xFF
		.pbyte test4
		.byte 0xFF
		.pbyte extsym
		.byte 0x01

		.pbyte test2

		.equiv	test4, 0xA5

		nop
		nop
		nopr
		nopr
	
	

		.data
		.byte 1		
		.byte 2
		.byte 3

		.equiv	extsym, 3

		.byte 0xFF
		.byte 00
		.byte 0xFF

		.equiv datasym1, 0
		.equiv datasym2, 0xFF
	
		.end
