		.text
		.global __reset
__reset:	nop
		nop
		nop
		nop
		BRA 0x4000
		nopr
		nopr
		nopr
		nopr
		nopr
		
		.ORG 40000
		
		BRA .+2
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		
		BRA .-10

		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nopr
		nopr
		nopr

		.end

