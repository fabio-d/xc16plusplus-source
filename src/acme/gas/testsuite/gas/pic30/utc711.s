	nopr
	addc	#locdec, w8
	nopr	
	
	.data
	.byte 0xFF
	.org 1023+1
locdec: .byte 0xA5
	.int 0xFFFF
	.end

