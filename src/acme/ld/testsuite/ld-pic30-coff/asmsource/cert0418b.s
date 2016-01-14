		.text
		nopr
		nopr
		nopr
		nop
		nop
		goto gotoself1
	
		.org 0x100
gotoself2:	goto .


		.global gotoself2
		
		.data
		.equiv	bitsym2, 0x0A
		.org 0x100
externalsym:	.byte 	0x5A
		.global externalsym
		.global bitsym2
		.end

