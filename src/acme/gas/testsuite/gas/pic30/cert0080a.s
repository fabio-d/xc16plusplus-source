
	.title cert0080 .float directive, out-of-range parameter, text
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
	

poszer:	.float	0.0
negzer:	.float -0.0
one:	.float  1.0
two:	.float	2.0
maxnm:	.float	3.40282347e+38
minpos:	.float	1.17549435e-38
maxsub:	.float	1.17549421e-38
minsub:	.float	1.40129846e-45
posinf:	.float	+INF
neginf:	.float	-INF

outrge:	.float	3.402824e+38	
	
	goto 6f
	goto 7f
	goto 8f
	goto 9f
	goto 0f
	nopr
	.global foo
foo:	nopr
	.eject
	.ascii "Test of listing continuation lines.\n"

	.if 0
	.ascii "This ascii string is within a false conditional"
	.endif
	.sbttl subtitle2 test
	.ascii "Resume listing in list file."
	
	.eject
	.sbttl subtitle3 test main routine

	
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


	
