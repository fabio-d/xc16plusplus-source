
	.title cert 0216a -- .data Assemble data onto data subsection (range)
	.sbttl subtitle1 test

	
	.data

poszer:	.double	0.0
negzer:	.double -0.0
one:	.double 1.0
two:	.double	2.0
mtwo:	.double	-2.0
dhexe:  .double 0e:40c81cd5c28f5c29
dhexf:  .double 0f:40c81cd5c28f5c29
dhexd:  .double 0d:40c81cd5c28f5c29
maxnm:	.double	1.7976931348623157e308
minpos:	.double	2.2250738585072014e-308
maxsub:	.double	2.2250738585072009e-308
minsub:	.double	4.9406564584124654e-324


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


	
