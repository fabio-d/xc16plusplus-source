		.text
		.global __reset
__reset:	nop
		nop
		nop
		nop
		nopr
		nopr
		nopr
		nopr
		nopr
		goto gotoself2

		.org 0x100
gotoself1:	goto .
		.global gotoself1

		.data
		.equiv bitsym1, 0x05
temp: 		.byte 	0xA5
		.global temp
		.global bitsym1
		.end

