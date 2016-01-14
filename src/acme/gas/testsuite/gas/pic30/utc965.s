	.text
	nopr
	nopr
loc:	nopr
	nopr

	.data
	.byte 0x10
	.byte 0xA5
	.byte tblpage(foo)
	.byte 0xFF
	.byte 0x11
	.end

