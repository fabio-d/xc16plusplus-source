
		.text
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		
		mov	_MODCON, WREG
		mov	_CORCON, WREG
		mov	_MODCON, WREG
		mov	_CORCON, WREG
		mov	_MODCON, WREG
		mov	_CORCON, WREG
		mov	_MODCON, WREG
		mov	_CORCON, WREG
		mov	_MODCON, WREG
		mov	_CORCON, WREG
		mov	_MODCON, WREG
		
		mov	extsym1, WREG
		
		mov	locsym1, WREG
	
		.data
extsym1:	.word	0xABCD
	
		.global extsym1
	
		.end
