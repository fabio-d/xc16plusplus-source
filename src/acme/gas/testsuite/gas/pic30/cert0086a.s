
	.title cert0086 ifnotdef Conditional Compilation
	.sbttl subtitle1 test

	.data

hwd1:	.hword	0x1234

	.text

main:



.ifnotdef hwd1
	.asciz "This section should NOT compile"
.endif	

.ifndef hwd1
	.asciz "This second section should NOT compile"
.endif	



	MOV #5, w5
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

	bra lb
.ifndef undefsym
	.asciz "This section SHOULD compile"
.endif

.ifnotdef undefsym
	.asciz "This second section SHOULD compile"
.endif


5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	
hwd2:	.hword	0xFEDC
hwd3:	.hword	0b1100001111110000


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
	
	.end
