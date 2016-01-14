		.title Certification tests
		.sbttl subtitle1 test

		.bss
		.byte 0x5A

		.data
		.byte 	0xFF


		.text
		.byte 	0xA5
		
		
		.section test, code
		.byte 0
	
		.section test1,bss
		.byte 1
		
		.section test2,data,noload
		.byte 2
		
		.section test3,data
		.byte 3
		
		.section test4,data
		.byte 4
		
		
		.ident

		.end
