	.text

	nopr
	nopr
	MOV #handle(_foo), w1
	nopr
	nopr
	nop
	nop
	nop
	nop
	nop

	.data
	.byte 0xFF
	.byte 0x01
_foo:	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x05
	.byte 0xFF

	.end

