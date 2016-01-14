	.text
	nopr
	nopr
	DISI #locrel
	nopr
	nopr
	
	.data
	.byte 0x00
	.org 16383+1
locrel:	.byte 0x00
	.byte 0x01
	.byte 0xFF

	.end

