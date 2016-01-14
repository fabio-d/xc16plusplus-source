	nopr
	and.b	#locdec, w8
	nopr	

	.data

locdec:	.byte 0xA4
	.byte 0xFF
	.byte 0
	.byte 0x11
	.end

