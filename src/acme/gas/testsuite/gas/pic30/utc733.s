	.text
	nopr
	nopr
	ADD.b w1, #locre, w2
	nopr
	nopr
	
	
	.data
	.byte 0x00
	.org 31
locre:	.byte 0x01
	.byte 0x02
	.byte 0xFF
	.end

