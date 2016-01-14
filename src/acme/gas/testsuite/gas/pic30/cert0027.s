	.title cert0027 Assembler Debugging messages (ignored)
	.sbttl Test description
	
/*



*/
	.text
	goto main
	nopr
	.global foo
foo:	nopr

main:	MOV #5, w5
	MOV #1, w6
	
	addc w5, w6, w7
	
	MUL.US	w5, w6, w8
	
	
	
	
	
