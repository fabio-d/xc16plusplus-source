	nopr
	and.b	#locdec, w8
	nopr	

	.data
	.byte 0x01
	.byte 0x10
	.org 255
locdec:	.byte 0xA4
	.byte 0xFF
	.byte 0
	.byte 0x11
	.end

