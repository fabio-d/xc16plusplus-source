
	.title cert 0062a -- Force Page Break
	.sbttl subtitle1 test

	
	.data

	.eject

	.text
	.global main
	.eject
	
	goto externdefine
	goto main2
	.eject
	goto 1f
	goto 2f
	goto 3f
	.eject
	goto 4f
	goto 5f
	
	.eject

	
	goto 6f
	.eject
	goto 7f
	goto 8f
	.eject
	goto 9f
	goto 0f
	.eject
	.eject
	nopr
	.global foo
foo:	nopr
	.eject
	.eject
	.ascii "Test of listing continuation lines.\n"
	.eject
	
	.if 0
	.ascii "This ascii string is within a false conditional"
	.endif
	.eject
	.eject
	.eject
	.sbttl subtitle2 test
	.ascii "Resume listing in list file."
	
	.eject
	.sbttl subtitle3 test main routine
	
	.eject
	
main:	MOV #5, w5
	MOV #1, w6
1:	addc w5, w6, w7
	.eject
	MUL.US	w5, w6, w8
	MOV #1, w6
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	.eject
	addc w5, w6, w7
3:	MUL.US	w5, w6, w8
	MOV #1, w6
	.eject
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
5:	MOV #1, w6
	.eject
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	.eject
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
7:	MOV #1, w6
	.eject
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
	.eject
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	.eject
	MOV #1, w6
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	.eject
	
0:	goto	main	

	.eject

	
