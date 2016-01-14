
		
		.text
		.org 0x1234
__reset:	nopr
		.global __reset
		nop

		mov	#temp, w5
		mov	#temp2, w6
		nopr	

		.data
temp: 		.byte 	0xA5
		.byte	0x5A
		.byte 	0xFF
		
		.end

