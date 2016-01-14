	nopr
	addc	#locdec, w8
	nopr	
	
	.data
	.byte 0x01
	.byte 0xFF
locdec: .int 0xA55A
	.int 0xFFFF
	.end

