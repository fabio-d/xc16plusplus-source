	.data
	.byte 0x10
	.byte 0xFF
	.word tblpage(_foo)
locdec:	.byte 0xA4
	.byte 0xFF
	.byte 0
	.byte 0x11
	.end

