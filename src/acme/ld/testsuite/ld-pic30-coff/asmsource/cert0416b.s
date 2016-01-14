		.text
		nopr
		nopr
		nopr
		BRA braself2
		nop
		nop
		BRA BRASELF1
	
		.org 0x100
braself2:	BRA braself2
		.global braself2
		

		.end

