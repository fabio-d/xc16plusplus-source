	.text
	nopr
	nop
	nop
loctext:nop	
	nopr
	
	CALL _foo
	
	nop
	. = 0x1c + 0x8000
	
here:	nopr
	
	.data
	.byte 1		
	.byte 2
	.byte 3
locsym1:.byte 00
	
	.end
