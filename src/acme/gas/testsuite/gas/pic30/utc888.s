	.text
main:	mov w1, w2
	nopr
	nopr
	nopr
	nopr
	nopr
	nopr
	mov w6, w5
	CALL callme
	mov w5, w6
	mov w6, w7
	nopr
callme:	nopr
	mov w8, w9
	goto main
	.end
