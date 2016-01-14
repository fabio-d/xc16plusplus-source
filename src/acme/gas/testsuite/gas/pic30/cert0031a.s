	
	.title cert0031a listing test
	.sbttl subtitle1 test
	.text
	goto main
	nopr
	.global foo
foo:	nopr
	.eject
	.ascii "Test of listing continuation lines.  This line should be really really really long so that gas is forced to use continuation lines.\n"
	.psize 25
	.nolist
	.ascii "This ascii string should not appear in the list file\n"
	.list
	.if 0
	.ascii "This ascii string is within a false conditional"
	.endif
	.sbttl subtitle2 test
	.ascii "Resume listing in list file."

/* Signed overflow */
test:	.short	-32767
test2:	.short	test - 100
test3: 	.short	test - 256
	
	.eject
	.sbttl subtitle3 test main routine
	.psize 20
	
main:	MOV #5, w5
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	
	goto	main	
