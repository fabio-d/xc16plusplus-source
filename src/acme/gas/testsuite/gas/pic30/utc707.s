	nopr
	addc	#locdec, w8
	nopr	
	
	.data
locdec: .byte 0xA5
	.int 0xFFFF
	.end

