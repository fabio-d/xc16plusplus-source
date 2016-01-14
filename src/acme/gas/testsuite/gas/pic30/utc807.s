	.text
	nopr
	nop
	nop
loctext:nop	
	nopr
	
	DO #locsym1, extsym
	
	nop
here:	nopr
	
	.data
	.byte 1		
	.byte 2
	.byte 3
locsym1:.byte 00
	
	.end
