	nopr
	addc	#locdec, w8
	nopr	
	
	.data
	.byte 0x01
	.byte 0xFF
	.org 511
locdec: .byte 0xA5
	.int 0xFFFF
	.end

