		.global __reset

		.text
__reset:	nop
		nop
		nop
		nop
		nop
		nop
		nop
		
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
locsym1:	.word	0x1234
	
		.global locsym1
	
		.end
