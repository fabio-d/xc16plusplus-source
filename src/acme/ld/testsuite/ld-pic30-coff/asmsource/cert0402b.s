		.text
		.equiv	bitsym2, 0x08		
		nopr
		btst.c		[W5++], #bitsym1
		nopr
		nopr
		nop
		nop
		btst.z		[++W5], #bitsym2
	

		.data

		.org 0x100
externalsym:	.byte 	0x5A
		.global externalsym
		.global bitsym2
		.end

