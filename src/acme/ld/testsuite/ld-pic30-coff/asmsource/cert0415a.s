		.global test1
		.global __reset
		.global datasym
		.global test2

		.text
		.equiv test1, 1
		.byte 1,2,3,4,5
		.byte 0
		.byte 5
		.pbyte 1,2,3,datasym-128,3,2,1
		.byte 0xA5
		
		.pbyte 1
		.byte 0xFF
		.pbyte 1,2,3,test1,3,2,1
		.byte 0xFF
		.pbyte extsym
		.byte 0x01
		.pbyte test2

		.align 4
__reset:	clrwdt
		.align 8
		clrwdt

		.equiv test2, 0x1A
		clrwdt
		nopr

		.data
		.byte 1		
		.byte 2
		.byte 3
		
		.byte 0xFF
		.byte 00
		.byte 0xFF

		.equiv datasym, 0
	
		.end
