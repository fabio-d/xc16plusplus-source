	.text
	nopr
	nopr
	DISI #locrel
	nopr
	nopr
	
	.data
	.byte 0x00
	.org 16383
locrel:	.byte 0x01
	.byte 0xFF

	.end

