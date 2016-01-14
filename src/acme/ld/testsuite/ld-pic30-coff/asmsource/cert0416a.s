		.text
		.global __reset
__reset:	nop
		nop
		nop
		nop
		BRA braself2
		nopr
		nopr
		nopr
		nopr
		nopr
		BRA BRASELF1

		.org 0x100
BRASELF1:	BRA BRASELF1
		.global BRASELF1

		.end

