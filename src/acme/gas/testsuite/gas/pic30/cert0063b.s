
	.title cert0063b Conditional Else (negative)
	.sbttl subtitle1 test

	
	.data

	.text
	.global main
	goto externdefine
	goto main2
	goto 1f
	goto 2f
	goto 3f
	goto 4f
	goto 5f
	goto 6f
	goto 7f
	goto 8f
	goto 9f
	goto 0f
	nopr
	.global foo
foo:	nopr

	.if 1
	.ascii "This string should assemble"
	.else
	.ascii "This string should NOT assemble"
	.endif
	
main:	MOV #5, w5
	MOV #1, w6
1:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7
3:	MUL.US	w5, w6, w8
	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
5:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
7:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	
0:	goto	main	
