		.text
		mov	#temp, w5
		mov	#ext, w6
		nopr	

		.data
		.align 2
temp: 		.byte 	0xA5
		.byte	0x5A
		.byte 	0xFF
		
		.global temp
		
		.end

