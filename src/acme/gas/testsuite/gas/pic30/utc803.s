	nopr
	add.b	locdec
	nopr	
	
	.data
	.byte 0x5A
	.byte 0
	.byte 1
	.byte 0xFF
locdec:	.byte 0xA5	
	.byte 0
	.byte 1
	.byte 0x5A
	.end

