	.text
	nopr
	nopr
	MOV #psvpage(_foo), w1
	nopr
	nopr

	.data
	.byte 0xFF
	.byte 0x01
	.byte 0x02
_foo:	.byte 0x03
	.byte 0x04
	.byte 0x0f
	.byte 0xff

	.end

